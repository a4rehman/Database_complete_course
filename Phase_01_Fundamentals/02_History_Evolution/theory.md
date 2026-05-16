# 02: History & Evolution of Databases

## Introduction
Databases have come a long way from physical paper files to distributed cloud systems. Understanding this evolution helps you understand why modern databases are designed the way they are.

## The Evolution Timeline

### 1. Pre-Database Era (Paper Files)
Before computers, data was stored in drawers and cabinets.
- **Problem:** Impossible to search, easy to lose, and took up massive space.

### 2. File System Era (1950s - 1960s)
Data was stored in flat files on magnetic tapes.
- **Problem:** Data redundancy (same data in multiple files) and isolation.

### 3. Hierarchical Model (1960s)
Data organized in a tree-like structure (Parent-Child).
- **Analogy:** A company hierarchy (CEO -> Manager -> Employee).
- **Example:** IBM's IMS.
- **Problem:** Rigid; couldn't handle complex relationships easily.

### 4. Network Model (1970s)
Allowed a child to have multiple parents (Graphs).
- **Problem:** Extremely complex to maintain.

### 5. Relational Model (1970s - Present)
Proposed by E.F. Codd. Data stored in tables.
- **Revolution:** Used SQL to query data independently of how it's stored.
- **Example:** MySQL, PostgreSQL, Oracle.

### 6. NoSQL & Modern Era (2000s - Present)
Born from the need to handle "Big Data" and unstructured data (JSON, Images).
- **Example:** MongoDB, Cassandra.

### 7. Cloud & NewSQL (Current)
Distributed databases that scale automatically on the cloud.
- **Example:** Snowflake, Google Spanner.

---

## Real World Analogy: Music Storage
1. **Paper:** Sheet music in a folder.
2. **File System:** MP3 files on a CD.
3. **Relational:** Spotify (Search by Artist, Album, Genre in structured tables).

> [!NOTE]
> **Key Takeaway:** We moved from "How to store data" to "How to use data efficiently."
