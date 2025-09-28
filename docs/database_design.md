# Database Design Documentation

## Overview

This document describes the graph database design for the University Course Scheduling Constraint Satisfaction Problem using Neo4j. The database models the complex relationships and constraints involved in scheduling university courses.

## Problem Domain

The university course scheduling problem involves:
- **Courses** that need to be scheduled
- **Professors** who can teach specific courses
- **Rooms** with different capacities and facilities
- **Time slots** when courses can be held
- **Students** who are enrolled in courses
- **Constraints** that must be satisfied

## Graph Schema Design

### Node Types

#### 1. MataKuliah (Course)
Represents university courses with the following properties:
- `id_mk`: Unique course identifier
- `nama`: Course name
- `kode`: Course code
- `sks`: Credit hours
- `semester`: Semester when course is offered
- `jenis`: Course type (teori/praktikum)

#### 2. Dosen (Professor)
Represents faculty members with the following properties:
- `id_dosen`: Unique professor identifier
- `nama`: Professor name
- `bidang`: Field of expertise
- `status`: Employment status (tetap/kontrak)

#### 3. RuangKelas (Room)
Represents physical spaces with the following properties:
- `id_ruang`: Unique room identifier
- `nama`: Room name/number
- `kapasitas`: Room capacity
- `jenis`: Room type (kelas/lab/auditorium)
- `fasilitas`: Available facilities (array)

#### 4. Waktu (Time Slot)
Represents time periods with the following properties:
- `id_waktu`: Unique time identifier
- `hari`: Day of the week
- `jam_mulai`: Start time
- `jam_selesai`: End time
- `sesi`: Session type (pagi/siang/sore)

#### 5. Mahasiswa (Student)
Represents students with the following properties:
- `id_mahasiswa`: Unique student identifier
- `nama`: Student name
- `angkatan`: Year of enrollment
- `program_studi`: Study program

### Relationship Types

#### Constraint Relationships
- **CONFLICT_WITH**: Courses that cannot be scheduled at the same time
- **REQUIRES_ROOM_TYPE**: Course requires specific room type
- **CAN_TEACH**: Professor can teach specific course
- **AVAILABLE_AT**: Professor is available at specific time
- **PREFERRED_TIME**: Professor prefers specific time slots

#### Assignment Relationships
- **TAUGHT_BY**: Course is taught by professor
- **SCHEDULED_AT**: Course is scheduled at specific time
- **HELD_IN**: Course is held in specific room
- **ENROLLED_IN**: Student is enrolled in course

## Constraint Types

### 1. Hard Constraints (Must be satisfied)
- **Professor Availability**: Professor can only teach when available
- **Room Capacity**: Room must accommodate enrolled students
- **Time Conflicts**: No double-booking of professors or rooms
- **Course Conflicts**: Conflicting courses cannot be scheduled simultaneously

### 2. Soft Constraints (Preferences)
- **Professor Preferences**: Professors prefer certain time slots
- **Room Suitability**: Courses should use appropriate room types
- **Student Load**: Balanced distribution of courses across time slots

## Database Constraints and Indexes

### Unique Constraints
- `mata_kuliah_id_unique`: Ensures unique course IDs
- `dosen_id_unique`: Ensures unique professor IDs
- `ruang_id_unique`: Ensures unique room IDs
- `waktu_id_unique`: Ensures unique time slot IDs
- `mahasiswa_id_unique`: Ensures unique student IDs

### Indexes
- Indexes on name fields for faster lookups
- Index on day field for time-based queries
- Indexes support efficient constraint checking

## Query Patterns

### 1. Constraint Validation
```cypher
// Check for professor double-booking
MATCH (d:Dosen)-[:TAUGHT_BY]-(mk1:MataKuliah)-[:SCHEDULED_AT]->(w:Waktu),
      (d)-[:TAUGHT_BY]-(mk2:MataKuliah)-[:SCHEDULED_AT]->(w)
WHERE mk1 <> mk2
```

### 2. Schedule Generation
```cypher
// Find valid assignments for a course
MATCH (mk:MataKuliah)-[:CAN_TEACH]->(d:Dosen)
MATCH (d)-[:AVAILABLE_AT]->(w:Waktu)
MATCH (mk)-[:REQUIRES_ROOM_TYPE]->(r:RuangKelas)
```

### 3. Conflict Detection
```cypher
// Find constraint violations
MATCH (mk1:MataKuliah)-[:CONFLICT_WITH]->(mk2:MataKuliah)
MATCH (mk1)-[:SCHEDULED_AT]->(w1:Waktu)
MATCH (mk2)-[:SCHEDULED_AT]->(w2:Waktu)
WHERE w1 = w2
```

## Benefits of Graph Database Approach

### 1. Natural Constraint Modeling
- Constraints are represented as relationships
- Easy to add new constraint types
- Flexible constraint checking

### 2. Efficient Querying
- Path-based queries for constraint satisfaction
- Natural representation of complex relationships
- Easy to find alternative solutions

### 3. Scalability
- Handles large numbers of courses and constraints
- Efficient for complex scheduling problems
- Easy to extend with new requirements

## Performance Considerations

### 1. Indexing Strategy
- Index on frequently queried properties
- Composite indexes for complex queries
- Relationship indexes for constraint checking

### 2. Query Optimization
- Use specific relationship types in queries
- Limit result sets with appropriate WHERE clauses
- Use EXPLAIN to analyze query performance

### 3. Data Modeling
- Minimize node properties for better performance
- Use relationships instead of properties for complex data
- Consider denormalization for frequently accessed data

## Extension Possibilities

### 1. Additional Constraints
- Student course load limits
- Room maintenance schedules
- Professor workload balancing
- Equipment requirements

### 2. Advanced Features
- Multi-semester planning
- Course prerequisites
- Student preferences
- Dynamic rescheduling

### 3. Integration
- Student information systems
- Room booking systems
- Academic calendar integration
- Notification systems

## Conclusion

The graph database design provides a flexible and efficient solution for the university course scheduling constraint satisfaction problem. The natural representation of relationships and constraints makes it easy to model complex scheduling requirements and find valid solutions efficiently.
