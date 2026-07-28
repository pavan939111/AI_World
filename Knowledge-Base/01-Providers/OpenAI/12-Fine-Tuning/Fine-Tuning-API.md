---
title: OpenAI Fine-Tuning â€” Base Models, Hyperparameters & Evaluation
provider: OpenAI
capability: 12-Fine-Tuning
file: Supported-Base-Models.md
last_updated: 2026-07-28
tags: [openai, fine-tuning, hyperparameters, loss-curves, evaluation]
author: Antigravity AI Knowledge Engine
---

# OpenAI Fine-Tuning â€” Base Models, Hyperparameters & Evaluation

## 1. Supported Base Models Comparison

| Base Model | Max Training Context | Best Use Case for Fine-Tuning |
| :--- | :--- | :--- |
| **`gpt-4o-mini`** | **128,000 tokens** | Enterprise customer support, domain classification, JSON formatting |
| **`gpt-4o`** | **128,000 tokens** | Complex legal document analysis, domain-specific coding styles |
| `gpt-3.5-turbo` | 16,385 tokens | Legacy fine-tuning pipelines |

---

## 2. Hyperparameter Recommendations
- **`n_epochs`**: Default `auto` (typically 3â€“4 epochs). Increasing epochs risks over-fitting on small datasets (<100 samples).
- **`learning_rate_multiplier`**: Adjusts global step learning rate. Lower values (e.g. 0.5) prevent catastrophic forgetting of base pre-training knowledge.
- **Validation Loss Monitoring**: Monitor the training vs validation loss curve via the OpenAI dashboard to detect overfitting early.
