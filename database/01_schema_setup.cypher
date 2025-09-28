// ===============================================
// University Course Scheduling - Schema Setup
// ===============================================
// This file creates the graph database schema for constraint satisfaction
// in university course scheduling using Neo4j.

// Clear existing data (for fresh setup)
MATCH (n) DETACH DELETE n;

// ===============================================
// CREATE CONSTRAINTS AND INDEXES
// ===============================================

// Create unique constraints for primary keys
CREATE CONSTRAINT mata_kuliah_id_unique IF NOT EXISTS FOR (mk:MataKuliah) REQUIRE mk.id_mk IS UNIQUE;
CREATE CONSTRAINT dosen_id_unique IF NOT EXISTS FOR (d:Dosen) REQUIRE d.id_dosen IS UNIQUE;
CREATE CONSTRAINT ruang_id_unique IF NOT EXISTS FOR (r:RuangKelas) REQUIRE r.id_ruang IS UNIQUE;
CREATE CONSTRAINT waktu_id_unique IF NOT EXISTS FOR (w:Waktu) REQUIRE w.id_waktu IS UNIQUE;
CREATE CONSTRAINT mahasiswa_id_unique IF NOT EXISTS FOR (m:Mahasiswa) REQUIRE m.id_mahasiswa IS UNIQUE;

// Create indexes for better query performance
CREATE INDEX mata_kuliah_nama_index IF NOT EXISTS FOR (mk:MataKuliah) ON (mk.nama);
CREATE INDEX dosen_nama_index IF NOT EXISTS FOR (d:Dosen) ON (d.nama);
CREATE INDEX ruang_nama_index IF NOT EXISTS FOR (r:RuangKelas) ON (r.nama);
CREATE INDEX waktu_hari_index IF NOT EXISTS FOR (w:Waktu) ON (w.hari);
CREATE INDEX mahasiswa_nama_index IF NOT EXISTS FOR (m:Mahasiswa) ON (m.nama);

// ===============================================
// CREATE NODE LABELS AND PROPERTIES
// ===============================================

// MataKuliah (Course) nodes will have:
// - id_mk: unique identifier
// - nama: course name
// - kode: course code
// - sks: credit hours
// - semester: semester offered
// - jenis: type (teori/praktikum)

// Dosen (Professor) nodes will have:
// - id_dosen: unique identifier
// - nama: professor name
// - bidang: field of expertise
// - status: employment status

// RuangKelas (Room) nodes will have:
// - id_ruang: unique identifier
// - nama: room name/number
// - kapasitas: room capacity
// - jenis: room type (kelas/lab/auditorium)
// - fasilitas: available facilities

// Waktu (Time) nodes will have:
// - id_waktu: unique identifier
// - hari: day of week
// - jam_mulai: start time
// - jam_selesai: end time
// - sesi: session identifier

// Mahasiswa (Student) nodes will have:
// - id_mahasiswa: unique identifier
// - nama: student name
// - angkatan: year of enrollment
// - program_studi: study program

// ===============================================
// RELATIONSHIP TYPES DEFINITION
// ===============================================

// Constraint relationships:
// - CONFLICT_WITH: courses that cannot be scheduled at the same time
// - REQUIRES_ROOM_TYPE: course requires specific room type
// - CAN_TEACH: professor can teach specific course
// - AVAILABLE_AT: professor is available at specific time
// - PREFERRED_TIME: professor prefers specific time slots
// - ENROLLED_IN: student is enrolled in course
// - SCHEDULED_AT: course is scheduled at specific time
// - TAUGHT_BY: course is taught by professor
// - HELD_IN: course is held in specific room
// - REQUIRES_EQUIPMENT: course requires specific equipment

// ===============================================
// VERIFY SCHEMA CREATION
// ===============================================

// Show all constraints
SHOW CONSTRAINTS;

// Show all indexes
SHOW INDEXES;

// Display schema information
CALL db.schema.visualization();

// ===============================================
// SCHEMA SETUP COMPLETE
// ===============================================
