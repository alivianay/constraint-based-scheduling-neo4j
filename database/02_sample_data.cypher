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

CREATE (t5:Waktu {
  id_waktu: "T05",
  hari: "Selasa",
  jam_mulai: "07:00",
  jam_selesai: "09:30",
  sesi: 1
});

CREATE (t6:Waktu {
  id_waktu: "T06",
  hari: "Selasa",
  jam_mulai: "09:30",
  jam_selesai: "12:00",
  sesi: 2
});

CREATE (t7:Waktu {
  id_waktu: "T07",
  hari: "Selasa",
  jam_mulai: "13:00",
  jam_selesai: "15:30",
  sesi: 3
});

CREATE (t8:Waktu {
  id_waktu: "T08",
  hari: "Selasa",
  jam_mulai: "15:30",
  jam_selesai: "18:00",
  sesi: 4
});

CREATE (t9:Waktu {
  id_waktu: "T09",
  hari: "Rabu",
  jam_mulai: "07:00",
  jam_selesai: "09:30",
  sesi: 1
});

CREATE (t10:Waktu {
  id_waktu: "T10",
  hari: "Rabu",
  jam_mulai: "09:30",
  jam_selesai: "12:00",
  sesi: 2
});

CREATE (t11:Waktu {
  id_waktu: "T11",
  hari: "Rabu",
  jam_mulai: "13:00",
  jam_selesai: "15:30",
  sesi: 3
});

CREATE (t12:Waktu {
  id_waktu: "T12",
  hari: "Rabu",
  jam_mulai: "15:30",
  jam_selesai: "18:00",
  sesi: 4
});

CREATE (t13:Waktu {
  id_waktu: "T13",
  hari: "Kamis",
  jam_mulai: "07:00",
  jam_selesai: "09:30",
  sesi: 1
});

CREATE (t14:Waktu {
  id_waktu: "T14",
  hari: "Kamis",
  jam_mulai: "09:30",
  jam_selesai: "12:00",
  sesi: 2
});

CREATE (t15:Waktu {
  id_waktu: "T15",
  hari: "Kamis",
  jam_mulai: "13:00",
  jam_selesai: "15:30",
  sesi: 3
});

CREATE (t16:Waktu {
  id_waktu: "T16",
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

// ===============================================
// CREATE PROFESSOR PREFERENCES
// ===============================================


// ===============================================
// CREATE COURSE-ROOM REQUIREMENTS
// ===============================================


// ===============================================
// CREATE COURSE CONFLICTS
// ===============================================

// ===============================================
// CREATE STUDENT ENROLLMENTS
// ===============================================

// ===============================================
// CREATE SAMPLE SCHEDULE (VALID ASSIGNMENTS)
// ===============================================


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