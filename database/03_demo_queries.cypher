// ===============================================
// University Course Scheduling - Demo Queries
// ===============================================
// This file contains demonstration queries for constraint satisfaction
// in university course scheduling using Neo4j.

// ===============================================
// 1. BASIC DATA EXPLORATION
// ===============================================

// View all nodes and relationships
MATCH (n) RETURN n LIMIT 25;

// Count nodes by type
MATCH (n) 
RETURN labels(n) AS NodeType, count(n) AS Count
ORDER BY NodeType;

// Count relationships by type
MATCH ()-[r]->() 
RETURN type(r) AS RelationshipType, count(r) AS Count
ORDER BY RelationshipType;

// ===============================================
// 2. CONSTRAINT SATISFACTION QUERIES
// ===============================================

// Find all courses that can be taught by each professor
MATCH (d:Dosen)-[:CAN_TEACH]->(mk:MataKuliah)
RETURN d.nama AS Professor, collect(mk.nama) AS CanTeach
ORDER BY Professor;

// Find all time slots available for each professor
MATCH (d:Dosen)-[:AVAILABLE_AT]->(w:Waktu)
RETURN d.nama AS Professor, 
       collect(w.hari + " " + w.jam_mulai + "-" + w.jam_selesai) AS AvailableTimes
ORDER BY Professor;

// Find room requirements for each course
MATCH (mk:MataKuliah)-[:CLASS_ROOM]->(r:RuangKelas)
RETURN mk.nama AS Course, collect(r.jenis) AS RequiredRoomTypes
ORDER BY Course;

// ===============================================
// 3. CONFLICT DETECTION QUERIES
// ===============================================

// Detect scheduling conflicts (same professor, same time)
MATCH (d:Dosen)-[:TAUGHT_BY]-(mk1:MataKuliah)-[:SCHEDULED_AT]->(w:Waktu),
      (d)-[:TAUGHT_BY]-(mk2:MataKuliah)-[:SCHEDULED_AT]->(w)
WHERE mk1 <> mk2
RETURN d.nama AS Professor, 
       w.hari + " " + w.jam_mulai + "-" + w.jam_selesai AS TimeSlot,
       mk1.nama AS Course1, 
       mk2.nama AS Course2
ORDER BY Professor, TimeSlot;

// Detect room conflicts (same room, same time)
MATCH (r:RuangKelas)-[:HELD_IN]-(mk1:MataKuliah)-[:SCHEDULED_AT]->(w:Waktu),
      (r)-[:HELD_IN]-(mk2:MataKuliah)-[:SCHEDULED_AT]->(w)
WHERE mk1 <> mk2
RETURN r.nama AS Room, 
       w.hari + " " + w.jam_mulai + "-" + w.jam_selesai AS TimeSlot,
       mk1.nama AS Course1, 
       mk2.nama AS Course2
ORDER BY Room, TimeSlot;

// Find courses that conflict with each other (by design)
MATCH (mk1:MataKuliah)-[:SAME_TIME_CONFLICT]->(mk2:MataKuliah)
RETURN mk1.nama AS Course1, mk2.nama AS Course2
ORDER BY Course1;

// ===============================================
// 4. SCHEDULE VALIDATION QUERIES
// ===============================================

// Show current schedule with all details
MATCH (mk:MataKuliah)-[:TAUGHT_BY]->(d:Dosen),
      (mk)-[:SCHEDULED_AT]->(w:Waktu),
      (mk)-[:HELD_IN]->(r:RuangKelas)
RETURN mk.nama AS Course,
       d.nama AS Professor,
       w.hari + " " + w.jam_mulai + "-" + w.jam_selesai AS Time,
       r.nama AS Room
ORDER BY w.hari, w.jam_mulai;

// Validate that all scheduled courses have valid assignments
MATCH (mk:MataKuliah)
OPTIONAL MATCH (mk)-[:TAUGHT_BY]->(d:Dosen)
OPTIONAL MATCH (mk)-[:SCHEDULED_AT]->(w:Waktu)
OPTIONAL MATCH (mk)-[:HELD_IN]->(r:RuangKelas)
RETURN mk.nama AS Course,
       CASE 
         WHEN d IS NULL THEN "No Professor Assigned"
         ELSE d.nama 
       END AS Professor,
       CASE 
         WHEN w IS NULL THEN "No Time Assigned"
         ELSE w.hari + " " + w.jam_mulai + "-" + w.jam_selesai 
       END AS Time,
       CASE 
         WHEN r IS NULL THEN "No Room Assigned"
         ELSE r.nama 
       END AS Room
ORDER BY Course;

// ===============================================
// 5. CONSTRAINT SATISFACTION PROBLEM SOLVING
// ===============================================

// Find valid schedule for a specific course (Pengantar AI)
MATCH (mk:MataKuliah {nama: "Pengantar Kecerdasan Buatan"})-[:CAN_TEACH]->(d:Dosen)
MATCH (d)-[:AVAILABLE_AT]->(w:Waktu)
MATCH (mk)-[:CLASS_ROOM]->(r:RuangKelas)
WHERE r.jenis = "kelas"
RETURN mk.nama AS Course,
       d.nama AS PossibleProfessor,
       w.hari + " " + w.jam_mulai + "-" + w.jam_selesai AS AvailableTime,
       r.nama AS SuitableRoom
ORDER BY d.nama, w.hari, w.jam_mulai;

// Find all possible valid schedules for unassigned courses
MATCH (mk:MataKuliah)
WHERE NOT (mk)-[:TAUGHT_BY]->()
MATCH (mk)-[:CAN_TEACH]->(d:Dosen)
MATCH (d)-[:AVAILABLE_AT]->(w:Waktu)
MATCH (mk)-[:CLASS_ROOM]->(r:RuangKelas)
WHERE NOT EXISTS {
  MATCH (other_mk:MataKuliah)-[:SCHEDULED_AT]->(w)
  WHERE other_mk <> mk
}
AND NOT EXISTS {
  MATCH (other_d:Dosen)-[:TAUGHT_BY]-(other_mk:MataKuliah)-[:SCHEDULED_AT]->(w)
  WHERE other_d = d AND other_mk <> mk
}
RETURN mk.nama AS Course,
       d.nama AS Professor,
       w.hari + " " + w.jam_mulai + "-" + w.jam_selesai AS Time,
       r.nama AS Room
ORDER BY mk.nama, d.nama;

// ===============================================
// 6. STUDENT ENROLLMENT ANALYSIS
// ===============================================

// Show student enrollments by course
MATCH (m:Mahasiswa)-[:ENROLLED_IN]->(mk:MataKuliah)
RETURN mk.nama AS Course,
       count(m) AS EnrolledStudents,
       collect(m.nama) AS Students
ORDER BY Course;

// Find courses that students are enrolled in but not scheduled
MATCH (m:Mahasiswa)-[:ENROLLED_IN]->(mk:MataKuliah)
WHERE NOT (mk)-[:SCHEDULED_AT]->()
RETURN mk.nama AS UnscheduledCourse,
       count(m) AS EnrolledStudents
ORDER BY UnscheduledCourse;

// ===============================================
// 7. ROOM UTILIZATION ANALYSIS
// ===============================================

// Show room utilization
MATCH (r:RuangKelas)
OPTIONAL MATCH (r)-[:HELD_IN]-(mk:MataKuliah)-[:SCHEDULED_AT]->(w:Waktu)
RETURN r.nama AS Room,
       r.kapasitas AS Capacity,
       r.jenis AS Type,
       count(mk) AS ScheduledCourses,
       collect(CASE WHEN mk IS NOT NULL THEN mk.nama + " (" + w.hari + " " + w.jam_mulai + ")" ELSE null END) AS Courses
ORDER BY r.nama;

// Find unused rooms
MATCH (r:RuangKelas)
WHERE NOT (r)-[:HELD_IN]->()
RETURN r.nama AS UnusedRoom, r.kapasitas AS Capacity, r.jenis AS Type
ORDER BY r.nama;

// ===============================================
// 8. PROFESSOR WORKLOAD ANALYSIS
// ===============================================

// Show professor workload
MATCH (d:Dosen)
OPTIONAL MATCH (d)-[:TAUGHT_BY]-(mk:MataKuliah)
RETURN d.nama AS Professor,
       d.bidang AS Expertise,
       count(mk) AS AssignedCourses,
       collect(CASE WHEN mk IS NOT NULL THEN mk.nama ELSE null END) AS Courses
ORDER BY Professor;

// Find professors with no assigned courses
MATCH (d:Dosen)
WHERE NOT (d)-[:TAUGHT_BY]->()
RETURN d.nama AS UnassignedProfessor, d.bidang AS Expertise
ORDER BY d.nama;

// ===============================================
// 9. TIME SLOT ANALYSIS
// ===============================================

// Show time slot utilization
MATCH (w:Waktu)
OPTIONAL MATCH (w)<-[:SCHEDULED_AT]-(mk:MataKuliah)
RETURN w.hari AS Day,
       w.jam_mulai + "-" + w.jam_selesai AS TimeSlot,
       w.sesi AS Session,
       count(mk) AS ScheduledCourses,
       collect(CASE WHEN mk IS NOT NULL THEN mk.nama ELSE null END) AS Courses
ORDER BY Day, TimeSlot;

// Find unused time slots
MATCH (w:Waktu)
WHERE NOT (w)<-[:SCHEDULED_AT]-()
RETURN w.hari AS UnusedDay,
       w.jam_mulai + "-" + w.jam_selesai AS UnusedTime,
       w.sesi AS Session
ORDER BY UnusedDay, UnusedTime;

// ===============================================
// 10. COMPLEX CONSTRAINT QUERIES
// ===============================================

// Find all constraint violations in the current schedule
MATCH (mk1:MataKuliah)-[:SAME_TIME_CONFLICT]->(mk2:MataKuliah)
MATCH (mk1)-[:SCHEDULED_AT]->(w1:Waktu)
MATCH (mk2)-[:SCHEDULED_AT]->(w2:Waktu)
WHERE w1 = w2
RETURN mk1.nama AS Course1, mk2.nama AS Course2, 
       w1.hari + " " + w1.jam_mulai + "-" + w1.jam_selesai AS ConflictingTime
ORDER BY Course1;

// Find courses that require specific room types but are assigned to wrong rooms
MATCH (mk:MataKuliah)-[:CLASS_ROOM]->(required_room:RuangKelas)
MATCH (mk)-[:HELD_IN]->(assigned_room:RuangKelas)
WHERE required_room.jenis <> assigned_room.jenis
RETURN mk.nama AS Course,
       required_room.jenis AS RequiredType,
       assigned_room.jenis AS AssignedType,
       assigned_room.nama AS AssignedRoom
ORDER BY Course;

// ===============================================
// 11. OPTIMIZATION QUERIES
// ===============================================

// Find the most efficient schedule (minimize conflicts, maximize preferences)
MATCH (d:Dosen)-[:PREFERRED_TIME]->(w:Waktu)
MATCH (d)-[:CAN_TEACH]->(mk:MataKuliah)
MATCH (mk)-[:CLASS_ROOM]->(r:RuangKelas)
WHERE NOT (mk)-[:SCHEDULED_AT]->()
AND NOT EXISTS {
  MATCH (other_mk:MataKuliah)-[:SCHEDULED_AT]->(w)
  WHERE other_mk <> mk
}
AND NOT EXISTS {
  MATCH (other_d:Dosen)-[:TAUGHT_BY]-(other_mk:MataKuliah)-[:SCHEDULED_AT]->(w)
  WHERE other_d = d AND other_mk <> mk
}
RETURN mk.nama AS Course,
       d.nama AS Professor,
       w.hari + " " + w.jam_mulai + "-" + w.jam_selesai AS PreferredTime,
       r.nama AS SuitableRoom,
       "OPTIMAL ASSIGNMENT" AS Status
ORDER BY d.nama, mk.nama;

// ===============================================
// 12. VISUALIZATION QUERIES
// ===============================================

// Show the complete graph structure
MATCH (n)-[r]->(m) 
RETURN n, r, m
LIMIT 50;

// Show constraint relationships
MATCH p=()-[r:SAME_TIME_CONFLICT|CLASS_ROOM|CAN_TEACH]->() 
RETURN p
LIMIT 20;

// Show schedule relationships
MATCH p=(mk:MataKuliah)-[:TAUGHT_BY]->(d:Dosen),
      (mk)-[:SCHEDULED_AT]->(w:Waktu),
      (mk)-[:HELD_IN]->(r:RuangKelas)
RETURN p, mk, d, w, r
LIMIT 10;
