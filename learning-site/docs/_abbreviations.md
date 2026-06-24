<!-- 
ABBREVIATIONS TEMPLATE
=======================

This file contains domain-specific terms and their definitions.
Include it at the bottom of any page using: --8<-- "_abbreviations.md"

Each term uses the markdown abbreviation syntax:
*[TERM]: Definition with context.

Keep definitions concise (one sentence ideally) and clear.
Add domain-specific terms as you write articles.

INSTRUCTION FOR CONTENT WRITERS:
- Add new terms as you use them for the first time in an article
- Keep alphabetical within sections for easier maintenance
- Provide practical definitions (not overly academic)
- Include context when the term has multiple meanings
-->

<!-- ============================================================
     GENERAL TECHNICAL TERMS
     ============================================================ -->

*[API]: Application Programming Interface — a set of functions and protocols that allow different software components to communicate.
*[CLI]: Command-Line Interface — a text-based interface for interacting with software or operating systems.
*[CRUD]: Create, Read, Update, Delete — the four basic operations for data persistence.
*[HTTP]: HyperText Transfer Protocol — the protocol used for transmitting web pages and data across the internet.
*[JSON]: JavaScript Object Notation — a human-readable data format widely used for web APIs and configuration.
*[YAML]: YAML Ain't Markup Language — a human-readable data serialization format often used for configuration files.
*[REST]: Representational State Transfer — an architectural style for building web APIs using HTTP verbs and resources.
*[SQL]: Structured Query Language — a standardized language for querying and managing relational databases.
*[ACID]: Atomicity, Consistency, Isolation, Durability — four properties that guarantee reliable database transactions.

<!-- ============================================================
     DISTRIBUTED SYSTEMS & ARCHITECTURE
     ============================================================ -->

*[CAP Theorem]: In a distributed system, you can guarantee at most two of Consistency, Availability, or Partition Tolerance simultaneously.
*[Consistency]: Every read returns the most recent write or an error; no client sees stale data.
*[Availability]: Every request receives a response (even if potentially stale); the system does not return errors due to unavailability.
*[Partition Tolerance]: The system continues operating despite network partitions (message loss or delays between nodes).
*[Eventual Consistency]: A relaxed consistency model where all replicas eventually converge to the same state, but not immediately.
*[Strong Consistency]: All reads return the most recent write immediately; guarantees no stale data.

<!-- ============================================================
     DATA STRUCTURES & ALGORITHMS
     ============================================================ -->

*[Latency]: The time delay between making a request and receiving a response; measured in milliseconds or microseconds.
*[Throughput]: The amount of work completed per unit time; often measured in requests per second or operations per second.
*[Big-O Notation]: A mathematical notation for describing the time or space complexity of an algorithm as the input size grows.
*[Caching]: Storing frequently-accessed data in fast memory to reduce latency and improve performance.
*[Index]: A data structure that enables fast lookups in a dataset, trading storage space for query speed.

<!-- ============================================================
     CLOUD & DEVOPS
     ============================================================ -->

*[CI/CD]: Continuous Integration / Continuous Deployment — automated practices for building, testing, and deploying code.
*[Docker]: A containerization platform that packages applications with their dependencies for consistent deployment.
*[Kubernetes]: An orchestration platform for managing containerized applications across clusters of machines.
*[Microservices]: An architecture where a large application is split into small, independently deployable services.
*[Monolith]: A traditional application architecture where all functionality is built as a single, tightly-coupled unit.
*[SLA]: Service Level Agreement — a contractual commitment to uptime, performance, or other reliability metrics.
*[SLO]: Service Level Objective — internal targets (e.g., 99.9% uptime) that drive engineering decisions.

<!-- ============================================================
     DEVELOPMENT PRACTICES
     ============================================================ -->

*[DRY]: Don't Repeat Yourself — a principle to avoid code duplication and maintain a single source of truth.
*[SOLID Principles]: Five design principles (Single Responsibility, Open/Closed, Liskov, Interface Segregation, Dependency Inversion) for writing maintainable code.
*[Design Pattern]: A reusable solution to a common programming problem; examples include Singleton, Factory, Observer.
*[Refactoring]: The process of improving code structure and maintainability without changing its external behavior.
*[Technical Debt]: Accrued complexity and shortcuts that make future changes slower; should be paid down over time.

<!-- ============================================================
     TESTING & QUALITY
     ============================================================ -->

*[Unit Test]: A test that verifies a single function or method works correctly in isolation.
*[Integration Test]: A test that verifies multiple components work correctly together.
*[End-to-End Test]: A test that simulates a complete user workflow through the entire application.
*[Code Coverage]: The percentage of code that is executed by automated tests; higher is generally better.
*[Mocking]: Creating fake objects or services in tests to isolate the code being tested.

<!-- ============================================================
     TEMPLATE INSTRUCTIONS FOR YOUR TOPIC
     ============================================================ -->

<!-- 
TO CUSTOMIZE THIS FILE:

1. Keep the sections that are relevant to your topic
2. Remove sections that don't apply
3. Add new sections specific to your domain (e.g., for databases: Replication, Sharding, Partitioning)
4. Add at least 20-30 terms relevant to your topic
5. Keep explanations concise and practical

EXAMPLE FOR A DATABASE GUIDE:
*[Sharding]: Splitting data horizontally across multiple databases to improve scalability.
*[Replication]: Copying data across multiple servers for redundancy and availability.
*[Primary Key]: A unique identifier for each row in a table.
*[Foreign Key]: A reference to a primary key in another table, maintaining referential integrity.

EXAMPLE FOR AN ML GUIDE:
*[Overfitting]: When a model learns the training data too well, including noise, and performs poorly on new data.
*[Regularization]: Techniques to prevent overfitting by penalizing model complexity.
*[Epoch]: One complete pass through the entire training dataset during neural network training.
*[Batch]: A subset of training data processed together before updating model weights.
-->
