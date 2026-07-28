---
title: Reasoning Models — FAQ
service: 02-Reasoning-Models
section: 00-Overview
file: FAQ.md
last_updated: 2026-07-28
tags: [reasoning-models, faq, Q&A]
author: Antigravity AI Knowledge Engine
---

# Frequently Asked Questions

Common questions and architectural concerns regarding integrating and deploying reasoning models.

---

## Technical Q&A

### **Q: Why do reasoning models take longer to generate answers?**
**A**: Unlike standard models that immediately begin streaming final responses, reasoning models must first generate hundreds or thousands of internal reasoning tokens (chain-of-thought) to plan and self-correct. This adds significant Time-to-Last-Token (TTLT) latency.

### **Q: Should I include "think step-by-step" in my prompts for reasoning models?**
**A**: **No.** These models are pre-trained using reinforcement learning to generate reasoning traces automatically. Adding redundant prompting phrases can confuse the alignment layers, leading to repetitive or circular logical loops.

### **Q: Are intermediate thinking tokens billed?**
**A**: **Yes.** All generated tokens (both the hidden reasoning chain and the final visible output text) are billed at the provider's standard output token rate.

### **Q: Can I stream reasoning traces in real-time?**
**A**: **Yes.** Most API providers support streaming completions via Server-Sent Events (SSE). Chunks containing delta updates are returned inside the designated `reasoning_content` parameter before transitioning to standard completion content.

### **Q: How do distilled reasoning models compare to native ones?**
**A**: Distilled models (like Qwen-32B distilled from DeepSeek-R1) offer excellent logical reasoning on specific programming or math tasks at lower VRAM hosting footprints. However, they lack the general semantic flexibility and broad logical generalization capabilities of native, large-scale reasoning models.
