# Demonstration Guide

## Overview

This guide provides step-by-step instructions for demonstrating the University Course Scheduling Constraint Satisfaction Problem using Neo4j. The demonstration showcases how graph databases can solve complex scheduling problems.

## Prerequisites

- Neo4j Desktop or Neo4j Aura account
- Basic understanding of Cypher queries
- Web browser for Neo4j Browser

## Setup Instructions

### 1. Start Neo4j Database
1. Open Neo4j Desktop
2. Create a new database or use existing one
3. Start the database
4. Open Neo4j Browser (usually at http://localhost:7474)

### 2. Load the Database Schema
```cypher
// Clear any existing data
MATCH (n) DETACH DELETE n;

// Load the schema
:source database/01_schema_setup.cypher
```

### 3. Load Sample Data
```cypher
:source database/02_sample_data.cypher
```

## Demonstration Scenarios

### Scenario 1: Basic Data Exploration

**Objective**: Show the graph structure and basic data

**Queries to run**:
```cypher
// 1. View all nodes
MATCH (n) RETURN n LIMIT 25;

// 2. Count nodes by type
MATCH (n) 
RETURN labels(n) AS NodeType, count(n) AS Count
ORDER BY NodeType;

// 3. Show current schedule
MATCH (mk:MataKuliah)-[:TAUGHT_BY]->(d:Dosen),
      (mk)-[:SCHEDULED_AT]->(w:Waktu),
      (mk)-[:HELD_IN]->(r:RuangKelas)
RETURN mk.nama AS Course, d.nama AS Professor, 
       w.hari + " " + w.jam_mulai + "-" + w.jam_selesai AS Time,
       r.nama AS Room
ORDER BY w.hari, w.jam_mulai;
```

**Key Points to Highlight**:
- Graph structure with nodes and relationships
- Natural representation of scheduling data
- Easy to understand relationships

### Scenario 2: Constraint Detection

**Objective**: Demonstrate constraint violation detection

**Queries to run**:
```cypher
// 1. Check for professor double-booking
MATCH (d:Dosen)-[:TAUGHT_BY]-(mk1:MataKuliah)-[:SCHEDULED_AT]->(w:Waktu),
      (d)-[:TAUGHT_BY]-(mk2:MataKuliah)-[:SCHEDULED_AT]->(w)
WHERE mk1 <> mk2
RETURN d.nama AS Professor, 
       w.hari + " " + w.jam_mulai + "-" + w.jam_selesai AS TimeSlot,
       mk1.nama AS Course1, mk2.nama AS Course2;

// 2. Check for room conflicts
MATCH (r:RuangKelas)-[:HELD_IN]-(mk1:MataKuliah)-[:SCHEDULED_AT]->(w:Waktu),
      (r)-[:HELD_IN]-(mk2:MataKuliah)-[:SCHEDULED_AT]->(w)
WHERE mk1 <> mk2
RETURN r.nama AS Room, 
       w.hari + " " + w.jam_mulai + "-" + w.jam_selesai AS TimeSlot,
       mk1.nama AS Course1, mk2.nama AS Course2;

// 3. Show course conflicts
MATCH (mk1:MataKuliah)-[:CONFLICT_WITH]->(mk2:MataKuliah)
RETURN mk1.nama AS Course1, mk2.nama AS Course2;
```

**Key Points to Highlight**:
- Automatic constraint violation detection
- Multiple types of conflicts
- Easy to identify scheduling problems

### Scenario 3: Schedule Generation

**Objective**: Show how to find valid schedule assignments

**Queries to run**:
```cypher
// 1. Find valid assignments for Pengantar AI
MATCH (mk:MataKuliah {nama: "Pengantar Kecerdasan Buatan"})-[:CAN_TEACH]->(d:Dosen)
MATCH (d)-[:AVAILABLE_AT]->(w:Waktu)
MATCH (mk)-[:REQUIRES_ROOM_TYPE]->(r:RuangKelas)
WHERE r.jenis = "kelas"
RETURN mk.nama AS Course, d.nama AS PossibleProfessor,
       w.hari + " " + w.jam_mulai + "-" + w.jam_selesai AS AvailableTime,
       r.nama AS SuitableRoom
ORDER BY d.nama, w.hari, w.jam_mulai;

// 2. Find unassigned courses
MATCH (mk:MataKuliah)
WHERE NOT (mk)-[:TAUGHT_BY]->()
RETURN mk.nama AS UnassignedCourse, mk.semester AS Semester;

// 3. Find possible assignments for unassigned courses
MATCH (mk:MataKuliah)
WHERE NOT (mk)-[:TAUGHT_BY]->()
MATCH (mk)-[:CAN_TEACH]->(d:Dosen)
MATCH (d)-[:AVAILABLE_AT]->(w:Waktu)
MATCH (mk)-[:REQUIRES_ROOM_TYPE]->(r:RuangKelas)
WHERE NOT EXISTS {
  MATCH (other_mk:MataKuliah)-[:SCHEDULED_AT]->(w)
  WHERE other_mk <> mk
}
RETURN mk.nama AS Course, d.nama AS Professor,
       w.hari + " " + w.jam_mulai + "-" + w.jam_selesai AS Time,
       r.nama AS Room
ORDER BY mk.nama;
```

**Key Points to Highlight**:
- Constraint satisfaction problem solving
- Finding valid solutions
- Handling multiple constraints

### Scenario 4: Optimization and Preferences

**Objective**: Show how to find optimal assignments

**Queries to run**:
```cypher
// 1. Show professor preferences
MATCH (d:Dosen)-[:PREFERRED_TIME]->(w:Waktu)
RETURN d.nama AS Professor, 
       collect(w.hari + " " + w.jam_mulai + "-" + w.jam_selesai) AS PreferredTimes
ORDER BY Professor;

// 2. Find optimal assignments
MATCH (d:Dosen)-[:PREFERRED_TIME]->(w:Waktu)
MATCH (d)-[:CAN_TEACH]->(mk:MataKuliah)
MATCH (mk)-[:REQUIRES_ROOM_TYPE]->(r:RuangKelas)
WHERE NOT (mk)-[:SCHEDULED_AT]->()
AND NOT EXISTS {
  MATCH (other_mk:MataKuliah)-[:SCHEDULED_AT]->(w)
  WHERE other_mk <> mk
}
RETURN mk.nama AS Course, d.nama AS Professor,
       w.hari + " " + w.jam_mulai + "-" + w.jam_selesai AS PreferredTime,
       r.nama AS SuitableRoom,
       "OPTIMAL ASSIGNMENT" AS Status
ORDER BY d.nama, mk.nama;

// 3. Show room utilization
MATCH (r:RuangKelas)
OPTIONAL MATCH (r)-[:HELD_IN]-(mk:MataKuliah)-[:SCHEDULED_AT]->(w:Waktu)
RETURN r.nama AS Room, r.kapasitas AS Capacity, r.jenis AS Type,
       count(mk) AS ScheduledCourses
ORDER BY r.nama;
```

**Key Points to Highlight**:
- Preference-based optimization
- Resource utilization analysis
- Finding best possible assignments

### Scenario 5: Student Analysis

**Objective**: Show student enrollment and impact

**Queries to run**:
```cypher
// 1. Show student enrollments
MATCH (m:Mahasiswa)-[:ENROLLED_IN]->(mk:MataKuliah)
RETURN mk.nama AS Course, count(m) AS EnrolledStudents,
       collect(m.nama) AS Students
ORDER BY Course;

// 2. Find courses students are enrolled in but not scheduled
MATCH (m:Mahasiswa)-[:ENROLLED_IN]->(mk:MataKuliah)
WHERE NOT (mk)-[:SCHEDULED_AT]->()
RETURN mk.nama AS UnscheduledCourse, count(m) AS EnrolledStudents
ORDER BY UnscheduledCourse;

// 3. Show professor workload
MATCH (d:Dosen)
OPTIONAL MATCH (d)-[:TAUGHT_BY]-(mk:MataKuliah)
RETURN d.nama AS Professor, d.bidang AS Expertise,
       count(mk) AS AssignedCourses
ORDER BY Professor;
```

**Key Points to Highlight**:
- Student impact on scheduling
- Workload distribution
- Academic requirements

## Advanced Demonstrations

### Scenario 6: Complex Constraint Queries

**Objective**: Show advanced constraint satisfaction

**Queries to run**:
```cypher
// 1. Find all constraint violations
MATCH (mk1:MataKuliah)-[:CONFLICT_WITH]->(mk2:MataKuliah)
MATCH (mk1)-[:SCHEDULED_AT]->(w1:Waktu)
MATCH (mk2)-[:SCHEDULED_AT]->(w2:Waktu)
WHERE w1 = w2
RETURN mk1.nama AS Course1, mk2.nama AS Course2,
       w1.hari + " " + w1.jam_mulai + "-" + w1.jam_selesai AS ConflictingTime;

// 2. Find room type mismatches
MATCH (mk:MataKuliah)-[:REQUIRES_ROOM_TYPE]->(required_room:RuangKelas)
MATCH (mk)-[:HELD_IN]->(assigned_room:RuangKelas)
WHERE required_room.jenis <> assigned_room.jenis
RETURN mk.nama AS Course, required_room.jenis AS RequiredType,
       assigned_room.jenis AS AssignedType, assigned_room.nama AS AssignedRoom;

// 3. Show complete constraint network
MATCH p=()-[r:CONFLICT_WITH|REQUIRES_ROOM_TYPE|CAN_TEACH]->()
RETURN p LIMIT 20;
```

### Scenario 7: Visualization

**Objective**: Show graph visualization capabilities

**Queries to run**:
```cypher
// 1. Show schedule relationships
MATCH p=(mk:MataKuliah)-[:TAUGHT_BY]->(d:Dosen),
      (mk)-[:SCHEDULED_AT]->(w:Waktu),
      (mk)-[:HELD_IN]->(r:RuangKelas)
RETURN p, mk, d, w, r LIMIT 10;

// 2. Show constraint relationships
MATCH p=()-[r:CONFLICT_WITH|REQUIRES_ROOM_TYPE]->()
RETURN p LIMIT 15;

// 3. Show complete graph (be careful with large datasets)
MATCH (n)-[r]->(m) RETURN n, r, m LIMIT 50;
```

## Key Talking Points

### 1. Why Graph Databases for Scheduling?
- **Natural Modeling**: Relationships are first-class citizens
- **Constraint Representation**: Easy to model complex constraints
- **Flexible Queries**: Path-based queries for constraint satisfaction
- **Scalability**: Handles large, complex scheduling problems

### 2. Constraint Satisfaction Benefits
- **Automatic Detection**: Easy to find constraint violations
- **Solution Generation**: Natural way to find valid assignments
- **Optimization**: Can incorporate preferences and optimization criteria
- **Flexibility**: Easy to add new constraints and requirements

### 3. Real-World Applications
- **University Scheduling**: Course and exam scheduling
- **Resource Management**: Room and equipment allocation
- **Workforce Planning**: Staff scheduling and assignment
- **Event Planning**: Conference and meeting scheduling

## Troubleshooting

### Common Issues
1. **Empty Results**: Check if data is loaded correctly
2. **Performance Issues**: Use LIMIT clauses for large datasets
3. **Query Errors**: Verify relationship types and node labels
4. **Memory Issues**: Use smaller result sets for visualization

### Tips for Smooth Demonstration
1. **Prepare Queries**: Have all queries ready in advance
2. **Test First**: Run all queries before the demonstration
3. **Explain Results**: Always explain what the results mean
4. **Interactive**: Ask audience questions about the results
5. **Real Examples**: Use real university scenarios when possible

## Conclusion

This demonstration shows how graph databases provide an elegant and efficient solution to complex constraint satisfaction problems in university course scheduling. The natural representation of relationships and constraints makes it easy to model, query, and solve scheduling problems that would be difficult with traditional relational databases.
