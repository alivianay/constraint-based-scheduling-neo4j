// -----------------------
// CREATE NEW COURSE TO TRIGGER CONFLICT
// -----------------------
CREATE (mk7:MataKuliah {id_mk:"CS107", nama:"Pemrosesan Teks", sks:3, semester:5, jenis:"teori"});

// -----------------------
// CS101 -> D001
// -----------------------
MATCH (d:Dosen {id_dosen:"D001"}), (mk:MataKuliah {id_mk:"CS107"})
CREATE (d)-[:CAN_TEACH]->(mk);

MATCH (mk:MataKuliah {id_mk:"CS107"}), (d:Dosen {id_dosen:"D001"}), 
      (w:Waktu {id_waktu:"T01"}), (r:RuangKelas {id_ruang:"R002"})
CREATE (mk)-[:TAUGHT_BY]->(d)
CREATE (mk)-[:SCHEDULED_AT]->(w)
CREATE (mk)-[:HELD_IN]->(r);

MATCH (mk1:MataKuliah {id_mk:"CS101"}), (mk2:MataKuliah {id_mk:"CS107"})
CREATE (mk1)-[:SAME_TIME_CONFLICT]->(mk2);

MATCH (mk1:MataKuliah)-[:TAUGHT_BY]->(d:Dosen)<-[:TAUGHT_BY]-(mk2:MataKuliah),
      (mk1)-[:SCHEDULED_AT]->(w:Waktu)<-[:SCHEDULED_AT]-(mk2)
WHERE mk1.id_mk < mk2.id_mk   // biar gak duplikat pasangan
RETURN d.nama AS Dosen, w.hari AS Hari, w.jam_mulai + "-" + w.jam_selesai AS Jam,
       collect(mk1.nama) + collect(mk2.nama) AS MataKuliah_Bentrok;



// -----------------------
// Devina -> CS107
// -----------------------
MATCH (m:Mahasiswa {id_mahasiswa:"M036"})
MATCH (mk:MataKuliah {id_mk:"CS107"})
CREATE (m)-[:ENROLLED_IN]->(mk);

MATCH (m:Mahasiswa)-[:ENROLLED_IN]->(mk1:MataKuliah)-[:SCHEDULED_AT]->(w:Waktu),
      (m)-[:ENROLLED_IN]->(mk2:MataKuliah)-[:SCHEDULED_AT]->(w)
WHERE mk1.id_mk < mk2.id_mk
RETURN m.nama AS Mahasiswa, w.hari AS Hari, w.jam_mulai + "-" + w.jam_selesai AS Jam,
       collect(DISTINCT mk1.nama) + collect(DISTINCT mk2.nama) AS MataKuliah_Bentrok;
