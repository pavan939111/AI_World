---
title: Reasoning Models — GRPO Algorithm
service: 02-Reasoning-Models
section: 01-Fundamentals
file: GRPO-Algorithm.md
last_updated: 2026-07-28
tags: [reasoning-models, grpo, optimization, reinforcement-learning, algorithm]
author: Antigravity AI Knowledge Engine
---

# Group Relative Policy Optimization (GRPO)

**Group Relative Policy Optimization (GRPO)** is a highly memory-efficient reinforcement learning algorithm developed by DeepSeek. It replaces the standard Proximal Policy Optimization (PPO) framework by eliminating the need for a separate value critic network, significantly reducing GPU memory requirements during alignment training.

---

## 1. Traditional PPO vs. GRPO

| Dimension / Property | Proximal Policy Optimization (PPO) | Group Relative Policy Optimization (GRPO) |
| :--- | :--- | :--- |
| **Critic Architecture** | Requires a dedicated **Value Network (Critic)** to estimate state baseline rewards. | **No Critic Network**. Baseline rewards are computed dynamically from group outputs. |
| **GPU Memory Footprint**| High (Critic model size often equals policy model size, doubling VRAM requirements). | **Low (~50% VRAM savings)**. Only the policy model and reference model are active. |
| **Advantage Estimation**| Computed using Generalized Advantage Estimation (GAE) against the critic network. | Computed relatively using reward averages and standard deviations of a group. |

---

## 2. Mathematical Formulation & Advantage Calculation

Instead of scoring a single generation against a value baseline, GRPO samples a group of $G$ outputs $\{q_1, q_2, \dots, q_G\}$ from the policy model $\pi_\theta$ for each input prompt:

1. **Grade Group Outputs**: Each output candidate $q_i$ receives a reward $r_i$ from the reward function pipeline (comprising rule-based checkers and model-based classifiers).
2. **Calculate Group Statistical Parameters**:
   * **Mean Reward**: $\text{mean}(R) = \frac{1}{G}\sum_{j=1}^{G} r_j$
   * **Standard Deviation**: $\text{std}(R) = \sqrt{\frac{1}{G}\sum_{j=1}^{G} (r_j - \text{mean}(R))^2}$
3. **Determine Relative Advantage**: The relative advantage $A_i$ of each candidate output $q_i$ is computed as:
   $$A_i = \frac{r_i - \text{mean}(R)}{\text{std}(R)}$$

This relative advantage is used to update the policy parameters $\theta$. If a candidate's reward is above the group average, its policy generation probability is boosted; if below, it is penalized.

---

## 3. Benefits for Reasoning Alignment

* **Saves GPU VRAM Resources**: Eliminating the critic network allows developers to train larger models (e.g. 671B MoE parameters) or use larger batch sizes on identical hardware.
* **Fined-Grained Contrast**: Comparing multiple outputs for the same query helps the model learn which formatting constraints or reasoning backtracking steps yield higher accuracy.
