---
title: OpenAI Coding Models â€” Benchmark Comparisons & Model Selection
provider: OpenAI
capability: 08-Coding-Models
file: Supported-Coding-Models.md
last_updated: 2026-07-28
tags: [openai, coding, swe-bench, humaneval, codeforces, gpt-4o, o3-mini, o1]
author: Antigravity AI Knowledge Engine
---

# OpenAI Coding Models â€” Benchmark Comparisons & Selection

## 1. Overview & Model Selection Matrix
OpenAI no longer maintains separate "Codex" standalone models (`code-davinci-002`); instead, code generation, refactoring, and software engineering capabilities are integrated natively into OpenAI's primary LLM and reasoning models:

| Model | HumanEval Pass@1 | SWE-bench Verified | Codeforces Rating | Best Coding Use Case |
| :--- | :--- | :--- | :--- | :--- |
| **`o3-mini` (High)** | **92.4%** | **49.2%** (#1 SOTA) | **2073 ELO** (Candidate Master) | Complex algorithms, data structures, & competitive coding |
| **`o1`** | **91.8%** | **48.9%** | **1891 ELO** (Expert) | Multi-file architecture, security audits, & proofs |
| **`gpt-4o`** | **90.2%** | **38.8%** | 808 ELO | Rapid web development, API integrations, & HTML/CSS |
| **`gpt-4o-mini`** | **87.2%** | 18.2% | 650 ELO | Scripting, SQL queries, & regex generation |

---

## 2. Benchmark Metrics Explained
- **SWE-bench Verified**: Evaluates autonomous AI agents on resolving real-world GitHub issues (bug fixes, pull requests) across 500+ python repositories.
- **HumanEval**: Evaluates zero-shot Python function generation against unit test suites.
- **Codeforces**: Measures competitive programming problem solving under strict time and memory constraints.
