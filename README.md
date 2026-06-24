# Copilot Agents Hub

Reusable repository for managing custom GitHub Copilot agents, prompts, instructions, and skills — synced across machines via Git.

[https://nitinkc.github.io/copilot-agents-hub/](https://nitinkc.github.io/copilot-agents-hub/)


## Documentation

Full documentation lives in [https://nitinkc.github.io/copilot-agents-hub/](https://nitinkc.github.io/copilot-agents-hub/) and is served with MkDocs.

```bash
# 1. Create and activate a virtual environment
python3 -m venv .venv
source .venv/bin/activate   # Windows: .venv\Scripts\activate

# 2. Install dependencies
pip install -r requirements.txt

# 3. Serve locally
mkdocs serve
# → http://127.0.0.1:8000

# 4. (Optional) Build static site
mkdocs build
# → output in site/
```

## 🚀 scaffold-learning-site — Quick Usage Demo

Use `/scaffold-learning-site` to generate a complete MkDocs learning tutorial project for any topic.

**Invoke it in Copilot Chat like this:**

```
/scaffold-learning-site
Topic: RAG Search & Vector Databases
Key questions:
- How does cosine similarity work mathematically?
- How do you prevent "Order #1766" matching "Order #1767"?
- What is the difference between lexical and semantic search?
```

```
/scaffold-learning-site
Topic: Database Engineering
Sections: SQL vs NoSQL, ACID, Normalization, Indexing, Replication, Caching
Cloud implementations: Spanner, BigQuery, DynamoDB, Cassandra, MongoDB, PostgreSQL
```

## 🧪 create-lab — Quick Usage Demo

Use `/create-lab` to generate a complete, ready-to-run hands-on lab for any domain and language.

**Invoke it in Copilot Chat like this:**

```
/create-lab
Domain: Data Engineering
Topic: Stream processing with Kafka
Level: Intermediate
Language: Python
Estimated time: 45 minutes
```

```
/create-lab
Domain: Web Development
Topic: REST API error handling
Level: Beginner
Language: TypeScript / Express
Estimated time: 30 minutes
```

Each invocation generates:

- `lab_<topic>.md` — full lab document (objectives → instructions → rubric → expected outputs)
- `lab_<topic>_starter.<ext>` — starter code with sequentially numbered, point-valued TODOs
- `lab_<topic>_solution.<ext>` — reference solution (do not distribute to students)
- `data/<topic>_data.<ext>` — realistic domain dataset with edge cases



## Agent Registry

See [docs/agents-index.md](docs/agents-index.md) for all available agents.

## Validate Before Committing

```bash
bash scripts/validate-agents.sh
```
