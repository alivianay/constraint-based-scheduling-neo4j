// ===============================================
// University Course Scheduling - Sample Data
// ===============================================
// This file populates the database with sample data for demonstration
// of constraint satisfaction in university course scheduling.

// ===============================================
// CREATE MATA KULIAH (COURSES)
// ===============================================

CREATE (mk1:MataKuliah {
    id_mk: "CS101",
    nama: "Pengantar Kecerdasan Buatan",
    kode: "CS101",
    sks: 3,
    semester: 5,
    jenis: "teori"
});

CREATE (mk2:MataKuliah {
    id_mk: "CS102",
    nama: "Basis Data Lanjut",
    kode: "CS102",
    sks: 3,
    semester: 5,
    jenis: "teori"
});

CREATE (mk3:MataKuliah {
    id_mk: "CS103",
    nama: "Jaringan Komputer",
    kode: "CS103",
    sks: 3,
    semester: 5,
    jenis: "teori"
});

CREATE (mk4:MataKuliah {
    id_mk: "CS104",
    nama: "Praktikum Jaringan Komputer",
    kode: "CS104",
    sks: 1,
    semester: 5,
    jenis: "praktikum"
});

CREATE (mk5:MataKuliah {
    id_mk: "CS105",
    nama: "Algoritma dan Struktur Data",
    kode: "CS105",
    sks: 3,
    semester: 3,
    jenis: "teori"
});

CREATE (mk6:MataKuliah {
    id_mk: "CS106",
    nama: "Praktikum Algoritma",
    kode: "CS106",
    sks: 1,
    semester: 3,
    jenis: "praktikum"
});

// ===============================================
// CREATE DOSEN (PROFESSORS)
// ===============================================

CREATE (d1:Dosen {
    id_dosen: "D001",
    nama: "Elly Matul",
    bidang: "Artificial Intelligence",
    status: "tetap"
});

CREATE (d2:Dosen {
    id_dosen: "D002",
    nama: "Ibnu Febry",
    bidang: "Database Systems",
    status: "tetap"
});

CREATE (d3:Dosen {
    id_dosen: "D003",
    nama: "Hasanuddin Al",
    bidang: "Computer Networks",
    status: "tetap"
});

CREATE (d4:Dosen {
    id_dosen: "D004",
    nama: "Yuliani Puji",
    bidang: "Algorithms",
    status: "tetap"
});

CREATE (d5:Dosen {
    id_dosen: "D005",
    nama: "Ulfa Siti",
    bidang: "Software Engineering",
    status: "kontrak"
});

// ===============================================
// CREATE RUANG KELAS
// ===============================================
CREATE (r1:RuangKelas {
  id_ruang: 'R001',
  nama: 'E2.01.01',
  kapasitas: 40,
  jenis: 'kelas',
  fasilitas: ['Proyektor', 'Whiteboard', 'Internet', 'Kursi Meja']
});

CREATE (r2:RuangKelas {
  id_ruang: 'R002',
  nama: 'E2.01.02',
  kapasitas: 40,
  jenis: 'kelas',
  fasilitas: ['Proyektor', 'Whiteboard', 'Internet', 'Kursi Meja']
});

CREATE (r3:RuangKelas {
  id_ruang: 'R003',
  nama: 'E2.01.03',
  kapasitas: 40,
  jenis: 'kelas',
  fasilitas: ['Proyektor', 'Whiteboard', 'Internet', 'Kursi Meja']
});

CREATE (r4:RuangKelas {
  id_ruang: 'R004',
  nama: 'E2.01.04',
  kapasitas: 40,
  jenis: 'kelas',
  fasilitas: ['Proyektor', 'Whiteboard', 'Internet', 'Kursi Meja']
});

CREATE (r5:RuangKelas {
  id_ruang: 'R005',
  nama: 'LAB-01',
  kapasitas: 25,
  jenis: 'lab',
  fasilitas: ['Komputer', 'Internet', 'Kursi Lab', 'Proyektor', 'Whiteboard']
});

// ===============================================
// CREATE WAKTU (TIME SLOTS)
// ===============================================

CREATE (t1:Waktu {
  id_waktu: "T01",
  hari: "Selasa",
  jam_mulai: "07:00",
  jam_selesai: "09:30",
  sesi: 1
});

CREATE (t2:Waktu {
  id_waktu: "T02",
  hari: "Selasa",
  jam_mulai: "09:30",
  jam_selesai: "12:00",
  sesi: 2
});

CREATE (t3:Waktu {
  id_waktu: "T03",
  hari: "Selasa",
  jam_mulai: "13:00",
  jam_selesai: "15:30",
  sesi: 3
});

CREATE (t4:Waktu {
  id_waktu: "T04",
  hari: "Selasa",
  jam_mulai: "15:30",
  jam_selesai: "18:00",
  sesi: 4
});

CREATE (t5:Waktu {
  id_waktu: "T05",
  hari: "Rabu",
  jam_mulai: "07:00",
  jam_selesai: "09:30",
  sesi: 1
});

CREATE (t6:Waktu {
  id_waktu: "T06",
  hari: "Rabu",
  jam_mulai: "09:30",
  jam_selesai: "12:00",
  sesi: 2
});

CREATE (t7:Waktu {
  id_waktu: "T07",
  hari: "Rabu",
  jam_mulai: "13:00",
  jam_selesai: "15:30",
  sesi: 3
});

CREATE (t8:Waktu {
  id_waktu: "T08",
  hari: "Rabu",
  jam_mulai: "15:30",
  jam_selesai: "18:00",
  sesi: 4
});

CREATE (t9:Waktu {
  id_waktu: "T09",
  hari: "Kamis",
  jam_mulai: "07:00",
  jam_selesai: "09:30",
  sesi: 1
});

CREATE (t10:Waktu {
  id_waktu: "T10",
  hari: "Kamis",
  jam_mulai: "09:30",
  jam_selesai: "12:00",
  sesi: 2
});

CREATE (t11:Waktu {
  id_waktu: "T11",
  hari: "Kamis",
  jam_mulai: "13:00",
  jam_selesai: "15:30",
  sesi: 3
});

CREATE (t12:Waktu {
  id_waktu: "T12",
  hari: "Kamis",
  jam_mulai: "15:30",
  jam_selesai: "18:00",
  sesi: 4
});

// ===============================================
// CREATE MAHASISWA (STUDENTS)
// ===============================================

CREATE (m1:Mahasiswa {
    id_mahasiswa: "M036",
    nama: "Devina Sawitri",
    angkatan: 2021,
    program_studi: "Sains Data"
});

CREATE (m2:Mahasiswa {
    id_mahasiswa: "M041",
    nama: "Alivia Wibisono",
    angkatan: 2021,
    program_studi: "Teknik Informatika"
});

CREATE (m3:Mahasiswa {
    id_mahasiswa: "M044",
    nama: "Siti Aida",
    angkatan: 2020,
    program_studi: "Teknik Informatika"
});

CREATE (m4:Mahasiswa {
    id_mahasiswa: "M004",
    nama: "Daffa Narawangsa",
    angkatan: 2021,
    program_studi: "Teknik Informatika"
});

CREATE (m5:Mahasiswa {
    id_mahasiswa: "M005",
    nama: "Ferdiansyah Syahputa",
    angkatan: 2020,
    program_studi: "Teknik Informatika"
});


// ===============================================
// CREATE PROFESSOR-COURSE RELATIONSHIPS
// ===============================================

// Prof. Elly can teach AI and Algorithms
MATCH (d:Dosen {id_dosen: "D001"}), (mk:MataKuliah {id_mk: "CS101"})
CREATE (d)-[:CAN_TEACH]->(mk);

MATCH (d:Dosen {id_dosen: "D001"}), (mk:MataKuliah {id_mk: "CS105"})
CREATE (d)-[:CAN_TEACH]->(mk);

// Prof. Ibnu can teach Database and Algorithms
MATCH (d:Dosen {id_dosen: "D002"}), (mk:MataKuliah {id_mk: "CS102"})
CREATE (d)-[:CAN_TEACH]->(mk);

MATCH (d:Dosen {id_dosen: "D002"}), (mk:MataKuliah {id_mk: "CS105"})
CREATE (d)-[:CAN_TEACH]->(mk);

// Prof. Hasanuddin can teach Networks and Network Lab
MATCH (d:Dosen {id_dosen: "D003"}), (mk:MataKuliah {id_mk: "CS103"})
CREATE (d)-[:CAN_TEACH]->(mk);

MATCH (d:Dosen {id_dosen: "D003"}), (mk:MataKuliah {id_mk: "CS104"})
CREATE (d)-[:CAN_TEACH]->(mk);

// Prof. Yuliani can teach Algorithms and Algorithm Lab
MATCH (d:Dosen {id_dosen: "D004"}), (mk:MataKuliah {id_mk: "CS105"})
CREATE (d)-[:CAN_TEACH]->(mk);

MATCH (d:Dosen {id_dosen: "D004"}), (mk:MataKuliah {id_mk: "CS106"})
CREATE (d)-[:CAN_TEACH]->(mk);

// Prof. Ulfa can teach AI and Database
MATCH (d:Dosen {id_dosen: "D005"}), (mk:MataKuliah {id_mk: "CS101"})
CREATE (d)-[:CAN_TEACH]->(mk);

MATCH (d:Dosen {id_dosen: "D005"}), (mk:MataKuliah {id_mk: "CS102"})
CREATE (d)-[:CAN_TEACH]->(mk);




// ===============================================
// CREATE PROFESSOR AVAILABILITY
// ===============================================

// Prof. Elly is available Tuesday and Wednesday mornings
MATCH (d:Dosen {id_dosen: "D001"}), (w:Waktu {id_waktu: "T05"})
CREATE (d)-[:AVAILABLE_AT]->(w);

MATCH (d:Dosen {id_dosen: "D001"}), (w:Waktu {id_waktu: "T09"})
CREATE (d)-[:AVAILABLE_AT]->(w);

MATCH (d:Dosen {id_dosen: "D001"}), (w:Waktu {id_waktu: "T10"})
CREATE (d)-[:AVAILABLE_AT]->(w);

// Prof. Ibnu is available Tuesday and Thursday mornings
MATCH (d:Dosen {id_dosen: "D002"}), (w:Waktu {id_waktu: "T05"})
CREATE (d)-[:AVAILABLE_AT]->(w);

MATCH (d:Dosen {id_dosen: "D002"}), (w:Waktu {id_waktu: "T13"})
CREATE (d)-[:AVAILABLE_AT]->(w);

MATCH (d:Dosen {id_dosen: "D002"}), (w:Waktu {id_waktu: "T14"})
CREATE (d)-[:AVAILABLE_AT]->(w);

// Prof. Hasanuddin is available Tuesday and Wednesday afternoons
MATCH (d:Dosen {id_dosen: "D003"}), (w:Waktu {id_waktu: "T07"})
CREATE (d)-[:AVAILABLE_AT]->(w);

MATCH (d:Dosen {id_dosen: "D003"}), (w:Waktu {id_waktu: "T11"})
CREATE (d)-[:AVAILABLE_AT]->(w);

MATCH (d:Dosen {id_dosen: "D003"}), (w:Waktu {id_waktu: "T15"})
CREATE (d)-[:AVAILABLE_AT]->(w);

// Prof. Yuliani is available Wednesday and Thursday
MATCH (d:Dosen {id_dosen: "D004"}), (w:Waktu {id_waktu: "T09"})
CREATE (d)-[:AVAILABLE_AT]->(w);

MATCH (d:Dosen {id_dosen: "D004"}), (w:Waktu {id_waktu: "T13"})
CREATE (d)-[:AVAILABLE_AT]->(w);

MATCH (d:Dosen {id_dosen: "D004"}), (w:Waktu {id_waktu: "T16"})
CREATE (d)-[:AVAILABLE_AT]->(w);

// Prof. Ulfa is available Tuesday and Thursday afternoons
MATCH (d:Dosen {id_dosen: "D005"}), (w:Waktu {id_waktu: "T06"})
CREATE (d)-[:AVAILABLE_AT]->(w);

MATCH (d:Dosen {id_dosen: "D005"}), (w:Waktu {id_waktu: "T15"})
CREATE (d)-[:AVAILABLE_AT]->(w);

// ===============================================
// CREATE PROFESSOR PREFERENCES
// ===============================================

// Prof. Elly prefers morning sessions
MATCH (d:Dosen {id_dosen: "D001"}), (w:Waktu {sesi: 1})
CREATE (d)-[:PREFERRED_TIME]->(w);

MATCH (d:Dosen {id_dosen: "D001"}), (w:Waktu {sesi: 2})
CREATE (d)-[:PREFERRED_TIME]->(w);

// Prof. Ibnu prefers early morning
MATCH (d:Dosen {id_dosen: "D002"}), (w:Waktu {id_waktu: "T05"})
CREATE (d)-[:PREFERRED_TIME]->(w);

MATCH (d:Dosen {id_dosen: "D002"}), (w:Waktu {id_waktu: "T13"})
CREATE (d)-[:PREFERRED_TIME]->(w);

// ===============================================
// CREATE COURSE-ROOM REQUIREMENTS
// ===============================================

// Network Lab requires computer lab
MATCH (mk:MataKuliah {id_mk: "CS104"}), (r:RuangKelas {jenis: "lab"})
CREATE (mk)-[:REQUIRES_ROOM_TYPE]->(r);

// Algorithm Lab requires computer lab
MATCH (mk:MataKuliah {id_mk: "CS106"}), (r:RuangKelas {jenis: "lab"})
CREATE (mk)-[:REQUIRES_ROOM_TYPE]->(r);

// Theory courses can use regular classrooms
MATCH (mk:MataKuliah {jenis: "teori"}), (r:RuangKelas {jenis: "kelas"})
CREATE (mk)-[:REQUIRES_ROOM_TYPE]->(r);

// ===============================================
// CREATE COURSE CONFLICTS
// ===============================================

// AI and Database cannot be scheduled at the same time (same semester students)
MATCH (mk1:MataKuliah {id_mk: "CS101"}), (mk2:MataKuliah {id_mk: "CS102"})
CREATE (mk1)-[:CONFLICT_WITH]->(mk2);

// Network theory and lab cannot be at the same time
MATCH (mk1:MataKuliah {id_mk: "CS103"}), (mk2:MataKuliah {id_mk: "CS104"})
CREATE (mk1)-[:CONFLICT_WITH]->(mk2);

// Algorithm theory and lab cannot be at the same time
MATCH (mk1:MataKuliah {id_mk: "CS105"}), (mk2:MataKuliah {id_mk: "CS106"})
CREATE (mk1)-[:CONFLICT_WITH]->(mk2);

// ===============================================
// CREATE STUDENT ENROLLMENTS
// ===============================================

// Students enrolled in 5th semester courses
MATCH (m:Mahasiswa {angkatan: 2021}), (mk:MataKuliah {semester: 5})
CREATE (m)-[:ENROLLED_IN]->(mk);

// Students enrolled in 3rd semester courses
MATCH (m:Mahasiswa {angkatan: 2020}), (mk:MataKuliah {semester: 3})
CREATE (m)-[:ENROLLED_IN]->(mk);

// ===============================================
// CREATE SAMPLE SCHEDULE (VALID ASSIGNMENTS)
// ===============================================

// Pengantar AI - Prof. Elly - Tuesday 07:00-09:30 - Room E2.01.01
MATCH (mk:MataKuliah {id_mk: "CS101"}), (d:Dosen {id_dosen: "D001"})
CREATE (mk)-[:TAUGHT_BY]->(d);

MATCH (mk:MataKuliah {id_mk: "CS101"}), (w:Waktu {id_waktu: "T05"})
CREATE (mk)-[:SCHEDULED_AT]->(w);

MATCH (mk:MataKuliah {id_mk: "CS101"}), (r:RuangKelas {id_ruang: "R001"})
CREATE (mk)-[:HELD_IN]->(r);

// Basis Data Lanjut - Prof. Ibnu - Tuesday 09:30-12:00 - Room E2.01.02
MATCH (mk:MataKuliah {id_mk: "CS102"}), (d:Dosen {id_dosen: "D002"})
CREATE (mk)-[:TAUGHT_BY]->(d);

MATCH (mk:MataKuliah {id_mk: "CS102"}), (w:Waktu {id_waktu: "T06"})
CREATE (mk)-[:SCHEDULED_AT]->(w);

MATCH (mk:MataKuliah {id_mk: "CS102"}), (r:RuangKelas {id_ruang: "R002"})
CREATE (mk)-[:HELD_IN]->(r);

// Jaringan Komputer - Prof. Hasanuddin - Tuesday 13:00-15:30 - Room E2.01.03
MATCH (mk:MataKuliah {id_mk: "CS103"}), (d:Dosen {id_dosen: "D003"})
CREATE (mk)-[:TAUGHT_BY]->(d);

MATCH (mk:MataKuliah {id_mk: "CS103"}), (w:Waktu {id_waktu: "T07"})
CREATE (mk)-[:SCHEDULED_AT]->(w);

MATCH (mk:MataKuliah {id_mk: "CS103"}), (r:RuangKelas {id_ruang: "R003"})
CREATE (mk)-[:HELD_IN]->(r);

// Praktikum Jaringan - Prof. Hasanuddin - Wednesday 13:00-15:30 - Lab-01
MATCH (mk:MataKuliah {id_mk: "CS104"}), (d:Dosen {id_dosen: "D003"})
CREATE (mk)-[:TAUGHT_BY]->(d);

MATCH (mk:MataKuliah {id_mk: "CS104"}), (w:Waktu {id_waktu: "T11"})
CREATE (mk)-[:SCHEDULED_AT]->(w);

MATCH (mk:MataKuliah {id_mk: "CS104"}), (r:RuangKelas {id_ruang: "R005"})
CREATE (mk)-[:HELD_IN]->(r);


// ===============================================
// VERIFY DATA CREATION
// ===============================================

// Count nodes by type
MATCH (n) 
RETURN labels(n) AS NodeType, count(n) AS Count
ORDER BY NodeType;

// Show sample relationships
MATCH (n)-[r]->(m) 
RETURN type(r) AS RelationshipType, count(r) AS Count
ORDER BY RelationshipType;