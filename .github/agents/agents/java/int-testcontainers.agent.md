---
name: int-testcontainers
description: "Writes integration tests using TestContainers for Cassandra/Kafka. Use when: integration tests, TestContainers, database tests, Kafka tests, end-to-end repository validation."
---
**Do**
- Write `*IT.java` tests using `@SpringBootTest` + `@EnableCassandraTestContainer`.
- Use real Cassandra via TestContainers; seed data via CQL.
- Verify end-to-end repository → DB interaction.
- Clean up test data after each test.

**Don't**
- Mock the database. Use TestContainers only.
