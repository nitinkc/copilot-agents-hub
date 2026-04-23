#!/usr/bin/env bash
# scripts/serve-docs.sh — Install MkDocs and serve the documentation site locally

set -e

echo "Checking for mkdocs-material..."
if ! python3 -c "import material" &>/dev/null; then
  echo "Installing mkdocs-material..."
  pip install mkdocs-material
fi

echo "Starting MkDocs dev server → http://127.0.0.1:8000"
mkdocs serve
