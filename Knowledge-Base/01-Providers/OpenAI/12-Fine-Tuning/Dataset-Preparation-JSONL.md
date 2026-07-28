---
title: OpenAI Fine-Tuning â€” JSONL Dataset Formatting & Preparation
provider: OpenAI
capability: 12-Fine-Tuning
file: Dataset-Preparation-JSONL.md
last_updated: 2026-07-28
tags: [openai, fine-tuning, jsonl, dataset, rlhf, supervised-fine-tuning]
author: Antigravity AI Knowledge Engine
---

# OpenAI Fine-Tuning â€” JSONL Dataset Formatting & Preparation

## 1. Summary & Data Requirements
OpenAI Supervised Fine-Tuning (SFT) customizes foundation model weights (`gpt-4o`, `gpt-4o-mini`) to enforce specific domain tones, complex output formats, or specialized industry vocabulary.

Fine-tuning datasets must be uploaded in **JSONL (JSON Lines)** format, where each line represents a complete conversation turn array.

---

## 2. JSONL File Format Specification

```json
{"messages": [{"role": "system", "content": "You are a customer service assistant for Acme Corp."}, {"role": "user", "content": "How do I process a refund?"}, {"role": "assistant", "content": "To request a refund, navigate to Settings > Billing > Request Refund within 30 days of purchase."}]}
{"messages": [{"role": "system", "content": "You are a customer service assistant for Acme Corp."}, {"role": "user", "content": "Where is my order?"}, {"role": "assistant", "content": "Track your order by entering your 8-digit tracking number on our status portal."}]}
```

### Dataset Recommendations
- **Minimum Dataset Size**: At least **50 high-quality conversation examples** are required to start a fine-tuning job; 500 to 1,000 examples are recommended for production quality.
- **Validation Split**: Reserve 10%â€“20% of your JSONL dataset as a validation file (`validation_file`) to track out-of-sample loss metrics.

---

## 3. Fine-Tuning Pricing Schedule

| Model Family | Training Cost per 1M Tokens | Fine-Tuned Input Price | Fine-Tuned Output Price |
| :--- | :--- | :--- | :--- |
| **`gpt-4o-mini`** | **$3.00 / 1M Tokens** | **$0.30 / 1M Tokens** | **$1.20 / 1M Tokens** |
| **`gpt-4o`** | **$25.00 / 1M Tokens** | **$3.75 / 1M Tokens** | **$15.00 / 1M Tokens** |
| `gpt-3.5-turbo` | $8.00 / 1M Tokens | $3.00 / 1M Tokens | $6.00 / 1M Tokens |

---

## 4. Python SDK Implementation (Launching a Fine-Tuning Job)

```python
import os
from openai import OpenAI

client = OpenAI(api_key=os.environ.get("OPENAI_API_KEY"))

# 1. Upload Training File
training_file = client.files.create(
    file=open("acme_support_dataset.jsonl", "rb"),
    purpose="fine-tune"
)

# 2. Launch Fine-Tuning Job
job = client.fine_tuning.jobs.create(
    training_file=training_file.id,
    model="gpt-4o-mini",
    hyperparameters={
        "n_epochs": 3,
        "batch_size": "auto",
        "learning_rate_multiplier": "auto"
    }
)

print(f"Fine-Tuning Job Launched ID: {job.id} | Status: {job.status}")
```
