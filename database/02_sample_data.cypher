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
    nama: "Dr. Elly Matul",
    bidang: "Artificial Intelligence",
    status: "tetap"
});

CREATE (d2:Dosen {
    id_dosen: "D002",
    nama: "Prof. Ibnu Febry",
    bidang: "Database Systems",
    status: "tetap"
});

CREATE (d3:Dosen {
    id_dosen: "D003",
    nama: "Dr. Hasanuddin Al",
    bidang: "Computer Networks",
    status: "tetap"
});

CREATE (d4:Dosen {
    id_dosen: "D004",
    nama: "Dr. Yuliani Puji",
    bidang: "Algorithms",
    status: "tetap"
});

CREATE (d5:Dosen {
    id_dosen: "D005",
    nama: "Dr. Ulfa Siti",
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

