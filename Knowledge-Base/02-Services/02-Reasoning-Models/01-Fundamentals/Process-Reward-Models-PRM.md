---
title: Reasoning Models — Process Reward Models (PRM)
service: 02-Reasoning-Models
section: 01-Fundamentals
file: Process-Reward-Models-PRM.md
last_updated: 2026-07-28
tags: [reasoning-models, prm, orm, reward-models, reinforcement-learning]
author: Antigravity AI Knowledge Engine
---

# Process Reward Models (PRM)

**Process Reward Models (PRMs)** are advanced reinforcement learning reward systems engineered to evaluate and grade each individual logical step within an AI model's chain of thought, rather than only grading the final output.

---

## 1. ORMs vs. PRMs

To align reasoning models, researchers choose between two primary reward systems:

| Dimension / Property | Outcome Reward Models (ORM) | Process Reward Models (PRM) |
| :--- | :--- | :--- |
| **Grading Target** | Grades only the **final output** completion (binary correct/incorrect). | Grades **every intermediate step** ($r_1, r_2, \dots, r_S$) of the logic path. |
| **Logic Verification** | Poor. The model can reach a correct answer using flawed logic and still receive a positive reward. | Excellent. Verifies each step, penalizing logical gaps even if the final answer happens to be correct. |
| **Annotation Cost** | Low. Easy to automate (e.g. check if the final output matches a math solution). | High. Requires step-by-step labels from human experts or advanced critique models (RLAIF). |
| **hallucination Mitigation**| Low. Can incentivize structural shortcuts and hallucinated facts that lead to target values. | **High**. Rejects hallucinations early by grading the validity of intermediate premises. |

---

## 2. Mathematical Impact on Policy Updates

During reinforcement learning loops, using a PRM provides a dense reward signal:

1. **Step-by-step Scoring**: For a reasoning path containing $S$ steps, the PRM outputs a sequence of rewards $\{r_1, r_2, \dots, r_S\}$, where $r_t \in [-1, 1]$.
2. **Advantage Optimization**: By mapping specific rewards to corresponding steps, the policy updates can pinpoint exactly which step (e.g. step 4: factoring the algebraic variable) introduced an error. This enables precise updates, preventing the policy from reinforcing flawed logical steps that happen to lead to a correct final answer.

---

## 3. Training & Scaling PRMs

* **Human-in-the-Loop Annotations**: Human experts review model reasoning traces, grading each step (e.g., math calculations, code structures) as positive, neutral, or negative.
* **Automated Critic Models (RLAIF)**: Large ensembles of critic models are prompted with targeted validation instructions to grade intermediate steps, scaling training data generation.
