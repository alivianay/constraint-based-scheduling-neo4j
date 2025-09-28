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
    nama: "Dr. Elly",
    bidang: "Artificial Intelligence",
    status: "tetap"
});

CREATE (d2:Dosen {
    id_dosen: "D002",
    nama: "Prof. Ibnu",
    bidang: "Database Systems",
    status: "tetap"
});

CREATE (d3:Dosen {
    id_dosen: "D003",
    nama: "Dr. Yuli",
    bidang: "Computer Networks",
    status: "tetap"
});

CREATE (d4:Dosen {
    id_dosen: "D004",
    nama: "Dr. Hasan",
    bidang: "Algorithms",
    status: "tetap"
});

CREATE (d5:Dosen {
    id_dosen: "D005",
    nama: "Dr. Risky",
    bidang: "Software Engineering",
    status: "kontrak"
});
