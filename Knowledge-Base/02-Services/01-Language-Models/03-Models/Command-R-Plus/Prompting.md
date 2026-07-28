---
title: Command R+ — Prompting Guide
service: 01-Language-Models
model: Command-R-Plus
section: 03-Models
file: Prompting.md
last_updated: 2026-07-28
tags: [language-models, command-r-plus, prompting, rag, guide]
author: Antigravity AI Knowledge Engine
---

# Command R+ — Prompting Guide

To maximize output quality, citation generation, and RAG integration in Command R+, developers format prompts to cleanly separate instructions from referenced documentation.

---

## 1. Document Grounding Structure

When supplying document chunks directly in the prompt payload (in-context RAG), isolate materials using XML tags or JSON structure:

```text
[System Instructions]
You are a documentation analyst. Review the provided source documents and answer the user query.
Each fact you declare must reference its source document id using inline citation indices.

[Source Documents]
<document id="doc_1">
Title: API Rate Limits
Content: The platform rate limit is 10,000 completions per hour.
</document>
<document id="doc_2">
Title: SSE Timeouts
Content: Server-Sent Event stream connections time out after 5 minutes of inactivity.
</document>

[User Query]
What is the standard completions rate limit and the stream timeout?
```

---

## 2. Formatting Guidelines for Agent Tool Use

If you deploy Command R+ inside agent loops:
* **Define Schema Definitions**: Detail parameters and keys explicitly.
* **Keep Constraints Direct**: Instruct the model to avoid preambles and return only the requested JSON/XML payloads.
* **Inject Few-shot Examples**: Providing 1-2 examples of successful tool call returns helps lock in structure and output syntax.
