---
title: AI Service â€” 02-Reasoning-Models Complete Master Reference
service: 02-Reasoning-Models
view: By Service
last_updated: 2026-07-28
tags: [reasoning-models, deepseek-r1, openai-o1, o3-mini, claude-3-7-thinking, gemini-2-5-thinking]
author: Antigravity AI Knowledge Engine
---

# AI Service â€” 02-Reasoning-Models: Master Technical Specification & Encyclopedia

Welcome to the **02-Reasoning-Models Service Knowledge Base**. This directory serves as an exhaustive, provider-agnostic technical reference, model comparison center, prompt engineering handbook, and production architectural guide for AI Reasoning Models (Test-Time Compute Scaling & Chain-of-Thought).

---

# ðŸ“ Service Folder Structure & Taxonomy

`	ext
02-Reasoning-Models/
â”œâ”€â”€ 00-Overview/                            # What are Reasoning Models, History, Evolution, CoT Pipeline, Terminology, FAQ
â”œâ”€â”€ 01-Fundamentals/                        # RLAIF, GRPO, Process Reward Models (PRM), Test-Time Compute Scaling, Hidden Thinking Tokens, MCTS
â”œâ”€â”€ 02-Providers/                           # OpenAI, DeepSeek, Anthropic, Google AI, Meta AI, Groq, Cerebras, Together AI
â”œâ”€â”€ 03-Models/                              # Deep-Dive Specs for OpenAI o1, o3-mini, DeepSeek-R1, DeepSeek-R1-Zero, Claude 3.7 Thinking, Gemini 2.5 Thinking, etc.
â”‚   â”œâ”€â”€ OpenAI-o1/                          # Overview, Capabilities, API, Pricing, Parameters, Prompting, Limitations, Best Practices, Examples, Alternatives
â”‚   â”œâ”€â”€ OpenAI-o3-mini/                     # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ DeepSeek-R1/                        # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ DeepSeek-R1-Zero/                   # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ Claude-3-7-Sonnet-Thinking/         # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ Gemini-2-5-Pro-Thinking/            # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ DeepSeek-R1-Distill-Llama-70B/      # (10 Deep-Dive Spec Files)
â”‚   â””â”€â”€ DeepSeek-R1-Distill-Qwen-32B/       # (10 Deep-Dive Spec Files)
â”œâ”€â”€ 04-Tasks/                               # Complex Math, Competitive Programming, Software Engineering, Scientific Proofs, Multi-Step Logic, Finance, Law
â”œâ”€â”€ 05-API/                                 # REST APIs, SDKs, Auth, Request Formats (easoning_effort), Streaming <think> tokens, Pricing, Error Handling
â”œâ”€â”€ 06-Prompt-Engineering/                  # Minimalist Prompting, System Prompts, Delimiters, Avoiding CoT Steers, Best Practices, Common Mistakes
â”œâ”€â”€ 07-Quality/                             # AIME 2024 Math, MATH-500, Codeforces ELO, GPQA Diamond, SWE-bench Verified
â”œâ”€â”€ 08-Comparisons/                         # Best Overall, Best Free, Best Paid, Cheapest, Fastest, Best API, Best Open-Source, Decision Matrix
â”œâ”€â”€ 09-Use-Cases/                           # Mathematical Proofs, Codebase Refactoring, Automated Debugging, Strategic Business Planning, Complex Science
â”œâ”€â”€ 10-Open-Source/                         # DeepSeek R1 (671B MoE), DeepSeek R1 Distill Series, vLLM Reasoning Serving, Ollama Local R1, TGI R1
â”œâ”€â”€ 11-Production/                          # Latency Management, Cost Optimization, Streaming Thinking Blocks, Safety & Jailbreak Mitigation
â”œâ”€â”€ 12-Examples/                            # Python, JavaScript, cURL, NextJS, FastAPI, NodeJS
â”œâ”€â”€ 13-Benchmarks/                          # Accuracy, Latency (TTFT vs CoT duration), Cost per Million Reasoning Tokens, Leaderboards
â”œâ”€â”€ 14-Learning-Resources/                  # Official Docs, Research Papers (DeepSeek R1 Paper, OpenAI o1 Post, QwQ), Blogs, Videos, Courses
â””â”€â”€ 15-Glossary/                            # Terms, Acronyms, References
`

---

# ðŸŽ¯ Model Comparison & Decision Matrix Snapshot

| Model | Developer | AIME 2024 Math | Codeforces ELO | API Pricing (Input / Output per 1M) | Open-Source / Weights |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **DeepSeek-R1** | DeepSeek | **79.8%** | **2029 ELO** | **.55 / .19** | **Open-Weights (MIT License)** |
| **OpenAI o1** | OpenAI | **83.3%** | **1891 ELO** | **.00 / .00** | Proprietary API |
| **OpenAI o3-mini** | OpenAI | **87.3%** | **2073 ELO** | **.10 / .40** | Proprietary API |
| **Claude 3.7 Sonnet (Thinking)** | Anthropic | **85.0%+** | **2000+ ELO** | **.00 / .00** | Proprietary API |
| **DeepSeek-R1-Distill-Llama-70B** | DeepSeek / Meta | **70.0%** | **1633 ELO** | **.60 / .60** (on Cerebras) | **Open-Weights (MIT)** |
| **DeepSeek-R1-Distill-Qwen-32B** | DeepSeek / Alibaba | **72.6%** | **1691 ELO** | **.15 / .15** (on Groq) | **Open-Weights (MIT)** |

---

# ðŸš€ Quick Start Example: Calling DeepSeek-R1 Reasoning API

`python
import os
from openai import OpenAI

# Initialize client for DeepSeek-R1 Reasoning API
client = OpenAI(
    base_url="https://api.deepseek.com",
    api_key=os.environ.get("DEEPSEEK_API_KEY")
)

response = client.chat.completions.create(
    model="deepseek-reasoner",
    messages=[
        {"role": "user", "content": "Prove that the sum of the first n positive odd integers is n^2."}
    ]
)

# Extract reasoning chain and final response
print("Reasoning Chain (<think>):")
print(response.choices[0].message.reasoning_content)
print("\nFinal Solution:")
print(response.choices[0].message.content)
`

---

# ðŸ“š Detailed Sub-Directory Navigation

- Explore **[00-Overview](./00-Overview/README.md)** for Test-Time Compute Scaling history and CoT pipeline concepts.
- Explore **[01-Fundamentals](./01-Fundamentals/README.md)** for GRPO (Group Relative Policy Optimization) and Process Reward Models.
- Explore **[03-Models](./03-Models/README.md)** for deep-dive specifications on OpenAI o1, o3-mini, DeepSeek-R1, Claude 3.7 Sonnet Thinking, and Gemini 2.5 Pro Thinking.
- Explore **[06-Prompt-Engineering](./06-Prompt-Engineering/README.md)** for minimalist prompting guides.
- Explore **[08-Comparisons](./08-Comparisons/README.md)** for decision matrices (Best Free, Best Open Source, Best Paid, Fastest).
- Explore **[10-Open-Source](./10-Open-Source/README.md)** for DeepSeek R1 671B local deployment on vLLM and Ollama.
