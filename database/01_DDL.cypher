// ==================================================
// University Course Scheduling - Schema Setup
// ==================================================

// Clear existing data
MATCH (n) DETACH DELETE n;

// ==================================================
// CONSTRAINTS (Unik ID) & INDEXES (Query Cepat)
// ==================================================
CREATE CONSTRAINT mata_kuliah_id_unique IF NOT EXISTS FOR (mk:MataKuliah) REQUIRE mk.id_mk IS UNIQUE;
CREATE CONSTRAINT dosen_id_unique IF NOT EXISTS FOR (d:Dosen) REQUIRE d.id_dosen IS UNIQUE;
CREATE CONSTRAINT ruang_id_unique IF NOT EXISTS FOR (r:RuangKelas) REQUIRE r.id_ruang IS UNIQUE;
CREATE CONSTRAINT waktu_id_unique IF NOT EXISTS FOR (w:Waktu) REQUIRE w.id_waktu IS UNIQUE;
CREATE CONSTRAINT mahasiswa_id_unique IF NOT EXISTS FOR (m:Mahasiswa) REQUIRE m.id_mahasiswa IS UNIQUE;

CREATE INDEX mata_kuliah_nama_index IF NOT EXISTS FOR (mk:MataKuliah) ON (mk.nama);
CREATE INDEX dosen_nama_index IF NOT EXISTS FOR (d:Dosen) ON (d.nama);
CREATE INDEX ruang_nama_index IF NOT EXISTS FOR (r:RuangKelas) ON (r.nama);
CREATE INDEX waktu_hari_index IF NOT EXISTS FOR (w:Waktu) ON (w.hari);
CREATE INDEX mahasiswa_nama_index IF NOT EXISTS FOR (m:Mahasiswa) ON (m.nama);


// ==================================================
// VERIFY SCHEMA
// ==================================================
SHOW CONSTRAINTS;
SHOW INDEXES;
CALL db.schema.visualization();
