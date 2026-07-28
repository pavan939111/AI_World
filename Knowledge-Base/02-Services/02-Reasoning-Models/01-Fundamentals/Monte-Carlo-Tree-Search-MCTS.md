---
title: Reasoning Models — Monte Carlo Tree Search (MCTS)
service: 02-Reasoning-Models
section: 01-Fundamentals
file: Monte-Carlo-Tree-Search-MCTS.md
last_updated: 2026-07-28
tags: [reasoning-models, mcts, search-decoding, algorithms]
author: Antigravity AI Knowledge Engine
---

# Monte Carlo Tree Search (MCTS)

**Monte Carlo Tree Search (MCTS)** is a heuristic search algorithm used to navigate decision trees by running random simulations. When integrated with large language models (such as search-based decoding architectures like Q*), MCTS enables the system to evaluate multiple reasoning paths during inference, scaling test-time compute.

---

## 1. The Four Stages of MCTS

Every search cycle in MCTS follows four logical steps:

```mermaid
graph LR
    A[Selection] --> B[Expansion]
    B --> C[Simulation]
    C --> D[Backpropagation]
    D --> A
```

### 1. Selection
* **Operation**: Starting at the root node (initial user prompt), the algorithm traverses down the search tree by selecting child nodes (intermediate reasoning steps) that maximize a selection policy.
* **Selection Formula**: Typically utilizes the **Upper Confidence Bound applied to Trees (UCT)**:
  $$UCT = \frac{v_i}{n_i} + c \sqrt{\frac{\ln N}{n_i}}$$
  * $v_i$: Total accumulated reward score of the node.
  * $n_i$: Visit count of the node.
  * $N$: Total visit count of the parent node.
  * $c$: Exploration constant balancing exploitation (choosing known high-scoring steps) vs. exploration (searching unvisited steps).

### 2. Expansion
* **Operation**: Once a leaf node is reached, the model expands the search tree by generating one or more new candidate reasoning tokens or sentence steps.

### 3. Simulation (Rollout)
* **Operation**: The model runs a simulation (or rollout) from the newly expanded node to the terminal state (final answer) to evaluate the validity of the reasoning path. In LLM applications, this is scored by Process Reward Models (PRMs) or Outcome Reward Models (ORMs).

### 4. Backpropagation
* **Operation**: The evaluation score of the simulation is backpropagated up the tree, updating the values ($v_i$) and visit counts ($n_i$) of all parent nodes along the traversed path.

---

## 2. Integration with LLM Decoders

* **Search-Based Decoding**: Instead of using greedy search decoding (which predicts the single next most probable token), MCTS routes multiple token generation paths. This enables the model to identify and prune incorrect logical directions before final output selection.
* **Accuracy Improvements**: Using MCTS at inference time scales mathematical accuracy and competitive programming ELO scores without altering the underlying model parameters.
