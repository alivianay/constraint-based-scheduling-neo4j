// ===============================================
// University Course Scheduling 
// ===============================================

// -----------------------
// CREATE COURSES
// -----------------------
CREATE (mk1:MataKuliah {id_mk:"CS101", nama:"Pengantar Kecerdasan Buatan", sks:3, semester:5, jenis:"teori"});
CREATE (mk2:MataKuliah {id_mk:"CS102", nama:"Basis Data Lanjut", sks:3, semester:5, jenis:"teori"});
CREATE (mk3:MataKuliah {id_mk:"CS103", nama:"Jaringan Komputer", sks:3, semester:5, jenis:"teori"});
CREATE (mk4:MataKuliah {id_mk:"CS104", nama:"Praktikum Jaringan Komputer", sks:1, semester:5, jenis:"praktikum"});
CREATE (mk5:MataKuliah {id_mk:"CS105", nama:"Algoritma dan Struktur Data", sks:3, semester:3, jenis:"teori"});
CREATE (mk6:MataKuliah {id_mk:"CS106", nama:"Praktikum Algoritma", sks:1, semester:3, jenis:"praktikum"});

// -----------------------
// CREATE PROFESSORS
// -----------------------
CREATE (d1:Dosen {id_dosen:"D001", nama:"Elly Matul", bidang:"AI", status:"tetap"});
CREATE (d2:Dosen {id_dosen:"D002", nama:"Ibnu Febry", bidang:"Database", status:"tetap"});
CREATE (d3:Dosen {id_dosen:"D003", nama:"Hasanuddin Al", bidang:"Networks", status:"tetap"});
CREATE (d4:Dosen {id_dosen:"D004", nama:"Yuliani Puji", bidang:"Algorithms", status:"tetap"});
CREATE (d5:Dosen {id_dosen:"D005", nama:"Ulfa Siti", bidang:"Software Eng", status:"kontrak"});

// -----------------------
// CREATE CLASSROOMS
// -----------------------
CREATE (r1:RuangKelas {id_ruang:'R001', nama:'E2.01.01', kapasitas:40, jenis:'kelas', fasilitas:['Proyektor','Whiteboard','Internet','Kursi Meja']});
CREATE (r2:RuangKelas {id_ruang:'R002', nama:'E2.01.02', kapasitas:40, jenis:'kelas', fasilitas:['Proyektor','Whiteboard','Internet','Kursi Meja']});
CREATE (r3:RuangKelas {id_ruang:'R003', nama:'E2.01.03', kapasitas:40, jenis:'kelas', fasilitas:['Proyektor','Whiteboard','Internet','Kursi Meja']});
CREATE (r4:RuangKelas {id_ruang:'R004', nama:'E2.01.04', kapasitas:40, jenis:'kelas', fasilitas:['Proyektor','Whiteboard','Internet','Kursi Meja']});
CREATE (r5:RuangKelas {id_ruang:'R005', nama:'LAB-01', kapasitas:25, jenis:'lab', fasilitas:['Komputer','Internet','Kursi Lab','Proyektor','Whiteboard']});

// -----------------------
// CREATE TIME SLOTS
// -----------------------
CREATE (t1:Waktu {id_waktu:"T01", hari:"Selasa", jam_mulai:"07:00", jam_selesai:"09:30", sesi:1});
CREATE (t2:Waktu {id_waktu:"T02", hari:"Selasa", jam_mulai:"09:30", jam_selesai:"12:00", sesi:2});
CREATE (t3:Waktu {id_waktu:"T03", hari:"Selasa", jam_mulai:"13:00", jam_selesai:"15:30", sesi:3});
CREATE (t4:Waktu {id_waktu:"T04", hari:"Selasa", jam_mulai:"15:30", jam_selesai:"18:00", sesi:4});
CREATE (t5:Waktu {id_waktu:"T05", hari:"Rabu", jam_mulai:"07:00", jam_selesai:"09:30", sesi:1});
CREATE (t6:Waktu {id_waktu:"T06", hari:"Rabu", jam_mulai:"09:30", jam_selesai:"12:00", sesi:2});
CREATE (t7:Waktu {id_waktu:"T07", hari:"Rabu", jam_mulai:"13:00", jam_selesai:"15:30", sesi:3});
CREATE (t8:Waktu {id_waktu:"T08", hari:"Rabu", jam_mulai:"15:30", jam_selesai:"18:00", sesi:4});
CREATE (t9:Waktu {id_waktu:"T09", hari:"Kamis", jam_mulai:"07:00", jam_selesai:"09:30", sesi:1});
CREATE (t10:Waktu {id_waktu:"T10", hari:"Kamis", jam_mulai:"09:30", jam_selesai:"12:00", sesi:2});
CREATE (t11:Waktu {id_waktu:"T11", hari:"Kamis", jam_mulai:"13:00", jam_selesai:"15:30", sesi:3});
CREATE (t12:Waktu {id_waktu:"T12", hari:"Kamis", jam_mulai:"15:30", jam_selesai:"18:00", sesi:4});

// -----------------------
// CREATE STUDENTS
// -----------------------
CREATE (m1:Mahasiswa {id_mahasiswa:"M036", nama:"Devina Sawitri", angkatan:2021, program_studi:"Sains Data"});
CREATE (m2:Mahasiswa {id_mahasiswa:"M041", nama:"Alivia Wibisono", angkatan:2021, program_studi:"Teknik Informatika"});
CREATE (m3:Mahasiswa {id_mahasiswa:"M044", nama:"Siti Aida", angkatan:2020, program_studi:"Teknik Informatika"});
CREATE (m4:Mahasiswa {id_mahasiswa:"M004", nama:"Daffa Narawangsa", angkatan:2021, program_studi:"Teknik Informatika"});
CREATE (m5:Mahasiswa {id_mahasiswa:"M005", nama:"Ferdiansyah Syahputa", angkatan:2020, program_studi:"Teknik Informatika"});

// -----------------------
// PROFESSOR-COURSE RELATIONSHIPS
// -----------------------
MATCH (d:Dosen {id_dosen:"D001"}), (mk:MataKuliah {id_mk:"CS101"}) CREATE (d)-[:CAN_TEACH]->(mk);
MATCH (d:Dosen {id_dosen:"D001"}), (mk:MataKuliah {id_mk:"CS105"}) CREATE (d)-[:CAN_TEACH]->(mk);

MATCH (d:Dosen {id_dosen:"D002"}), (mk:MataKuliah {id_mk:"CS102"}) CREATE (d)-[:CAN_TEACH]->(mk);
MATCH (d:Dosen {id_dosen:"D002"}), (mk:MataKuliah {id_mk:"CS105"}) CREATE (d)-[:CAN_TEACH]->(mk);

MATCH (d:Dosen {id_dosen:"D003"}), (mk:MataKuliah {id_mk:"CS103"}) CREATE (d)-[:CAN_TEACH]->(mk);
MATCH (d:Dosen {id_dosen:"D003"}), (mk:MataKuliah {id_mk:"CS104"}) CREATE (d)-[:CAN_TEACH]->(mk);

MATCH (d:Dosen {id_dosen:"D004"}), (mk:MataKuliah {id_mk:"CS105"}) CREATE (d)-[:CAN_TEACH]->(mk);
MATCH (d:Dosen {id_dosen:"D004"}), (mk:MataKuliah {id_mk:"CS106"}) CREATE (d)-[:CAN_TEACH]->(mk);

MATCH (d:Dosen {id_dosen:"D005"}), (mk:MataKuliah {id_mk:"CS101"}) CREATE (d)-[:CAN_TEACH]->(mk);
MATCH (d:Dosen {id_dosen:"D005"}), (mk:MataKuliah {id_mk:"CS102"}) CREATE (d)-[:CAN_TEACH]->(mk);

// -----------------------
// PROFESSOR AVAILABILITY
// -----------------------
MATCH (d:Dosen {id_dosen:"D001"}), (w:Waktu) WHERE w.id_waktu IN ["T01","T05","T06"] CREATE (d)-[:AVAILABLE_AT]->(w);
MATCH (d:Dosen {id_dosen:"D002"}), (w:Waktu) WHERE w.id_waktu IN ["T01","T09","T10"] CREATE (d)-[:AVAILABLE_AT]->(w);
MATCH (d:Dosen {id_dosen:"D003"}), (w:Waktu) WHERE w.id_waktu IN ["T03","T07","T11"] CREATE (d)-[:AVAILABLE_AT]->(w);
MATCH (d:Dosen {id_dosen:"D004"}), (w:Waktu) WHERE w.id_waktu IN ["T05","T09","T12"] CREATE (d)-[:AVAILABLE_AT]->(w);
MATCH (d:Dosen {id_dosen:"D005"}), (w:Waktu) WHERE w.id_waktu IN ["T02","T12"] CREATE (d)-[:AVAILABLE_AT]->(w);

// -----------------------
// PROFESSOR PREFERENCES
// -----------------------
MATCH (d:Dosen {id_dosen:"D001"}), (w:Waktu) WHERE w.sesi IN [1,2] CREATE (d)-[:PREFERRED_TIME]->(w);
MATCH (d:Dosen {id_dosen:"D002"}), (w:Waktu) WHERE w.id_waktu IN ["T01","T09"] CREATE (d)-[:PREFERRED_TIME]->(w);

// -----------------------
// COURSE-ROOM REQUIREMENTS
// -----------------------
MATCH (mk:MataKuliah {id_mk:"CS104"}), (r:RuangKelas {jenis:"lab"}) CREATE (mk)-[:CLASS_ROOM]->(r);
MATCH (mk:MataKuliah {id_mk:"CS106"}), (r:RuangKelas {jenis:"lab"}) CREATE (mk)-[:CLASS_ROOM]->(r);
MATCH (mk:MataKuliah {jenis:"teori"}), (r:RuangKelas {jenis:"kelas"}) CREATE (mk)-[:CLASS_ROOM]->(r);

// -----------------------
// COURSE CONFLICTS
// -----------------------
MATCH (mk1:MataKuliah {id_mk:"CS101"}), (mk2:MataKuliah {id_mk:"CS102"}) CREATE (mk1)-[:SAME_TIME_CONFLICT]->(mk2);
MATCH (mk1:MataKuliah {id_mk:"CS103"}), (mk2:M
