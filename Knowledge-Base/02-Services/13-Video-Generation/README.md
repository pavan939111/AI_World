---
title: AI Service â€” 13-Video-Generation Complete Master Reference
service: 13-Video-Generation
view: By Service
last_updated: 2026-07-28
tags: [video-generation, t2v, i2v, runway-gen3, luma-dream-machine, kling-1-5, sora, hailuo-minimax, pika-2-0, hunyuanvideo, cogvideox]
author: Antigravity AI Knowledge Engine
---

# AI Service â€” 13-Video-Generation: Master Technical Specification & Encyclopedia

Welcome to the **13-Video-Generation Service Knowledge Base**. This directory serves as an exhaustive, provider-agnostic technical reference, model comparison center, video prompt engineering handbook, and production architectural guide for 3D Diffusion Transformer (DiT) Video Generation models.

---

# ðŸ“ Service Folder Structure & Taxonomy

`	ext
13-Video-Generation/
â”œâ”€â”€ 00-Overview/                            # What is AI Video Generation, History, Evolution, T2V/I2V Pipeline, Terminology, FAQ
â”œâ”€â”€ 01-Fundamentals/                        # 3D Diffusion Transformers (DiT), Spatio-Temporal Attention, Motion Conditioning, Camera Controls, FPS
â”œâ”€â”€ 02-Providers/                           # Runway, Luma AI, Kling AI, Sora / OpenAI, Hailuo AI / Minimax, Pika Labs, Stability AI, Tencent
â”œâ”€â”€ 03-Models/                              # Deep-Dive Specs for Runway Gen-3 Alpha, Luma Dream Machine, Kling 1.5, Sora, Hailuo Minimax, Pika 2.0, HunyuanVideo
â”‚   â”œâ”€â”€ Runway-Gen-3-Alpha/                 # Overview, Capabilities, API, Pricing, Parameters, Prompting, Limitations, Best Practices, Examples, Alternatives
â”‚   â”œâ”€â”€ Luma-Dream-Machine/                 # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ Kling-1-5/                          # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ OpenAI-Sora/                        # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ Hailuo-Minimax-Video-01/            # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ Pika-2-0/                           # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ HunyuanVideo-Open/                  # (10 Deep-Dive Spec Files)
â”‚   â””â”€â”€ CogVideoX-5B/                       # (10 Deep-Dive Spec Files)
â”œâ”€â”€ 04-Tasks/                               # Text-to-Video, Image-to-Video, Video-to-Video, Camera Motion Control, Keyframe Animation, Extension, Lip-Sync
â”œâ”€â”€ 05-API/                                 # REST APIs, Async Polling & Webhooks, Auth, Request Formats, Response Formats (MP4), Pricing, Error Handling
â”œâ”€â”€ 06-Video-Prompt-Engineering/            # Cinematography Terms, Lighting & Lens Controls, Motion Directives, Negative Prompts, Consistency Control
â”œâ”€â”€ 07-Quality/                             # VBench Benchmark, Temporal Consistency Rating, Motion Smoothness, Physics Realism, Artifacts
â”œâ”€â”€ 08-Comparisons/                         # Best Overall, Best Free, Best Paid, Cheapest, Fastest, Best Open-Source, Decision Matrix
â”œâ”€â”€ 09-Use-Cases/                           # Advertising, Movie Storyboarding, Social Media Content, Music Videos, Game Animation, E-Commerce
â”œâ”€â”€ 10-Open-Source/                         # HunyuanVideo, CogVideoX, Stable Video Diffusion, Open-Sora-Plan, AnimateDiff, ComfyUI Workflows
â”œâ”€â”€ 11-Production/                          # Async Render Queues, Upscaling & Frame Interpolation, Video Transcoding (H.264/H.265), CDN Integration
â”œâ”€â”€ 12-Examples/                            # Python, JavaScript, cURL, NextJS, FastAPI, NodeJS
â”œâ”€â”€ 13-Benchmarks/                          # VBench Leaderboard, Generation Latency (s), Cost per Video Second, Motion Quality Rating
â”œâ”€â”€ 14-Learning-Resources/                  # Official Docs, Research Papers (Sora Paper, DiT, HunyuanVideo), Blogs, Videos, Courses
â””â”€â”€ 15-Glossary/                            # Terms, Acronyms, References
`

---

# ðŸŽ¯ Model & Engine Comparison Snapshot

| Model | Developer | Max Clip Duration | Max Native Resolution | VBench Score | API Pricing (per 5s video) | Open-Weights |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Runway Gen-3 Alpha** | Runway | 10 seconds | **1080p (4K upscaled)** | **84.5%** (#1 SOTA) | **.25 / video** | Proprietary API |
| **Hailuo Minimax Video-01** | Minimax | 6 seconds | **1080p** | **83.8%** | **.15 / video** | Proprietary API |
| **Kling 1.5** | Kling AI | 10 seconds | **1080p** | **83.2%** | **.20 / video** | Proprietary API |
| **Luma Dream Machine** | Luma AI | 5 seconds | **720p / 1080p** | **82.6%** | **.20 / video** | Proprietary API |
| **HunyuanVideo** | Tencent | 5 seconds | **720p** | **82.1%** (#1 Open) | **Self-Hosted ()** | **Open-Weights (Apache 2.0)** |
| **CogVideoX-5B** | THUDM | 6 seconds | **720p** | **79.4%** | **Self-Hosted ()** | **Open-Weights (Apache 2.0)** |

---

# ðŸš€ Quick Start Example: Generating Video via Replicate API

`python
import os
import replicate

# Generate 5-second video clip using HunyuanVideo
output = replicate.run(
    "tencent/hunyuan-video:8d3f...",
    input={
        "prompt": "An astronaut walking through a neon-lit alien jungle, cinematic camera orbit, 4k 24fps",
        "num_frames": 129,
        "width": 1280,
        "height": 720
    }
)

print(f"Video URL: {output}")
`

---

# ðŸ“š Detailed Sub-Directory Navigation

- Explore **[00-Overview](./00-Overview/README.md)** for Text-to-Video (T2V) & Image-to-Video (I2V) pipeline concepts.
- Explore **[01-Fundamentals](./01-Fundamentals/README.md)** for 3D Diffusion Transformers (DiT), spatio-temporal self-attention, and camera motion mechanics.
- Explore **[03-Models](./03-Models/README.md)** for deep-dive specifications on Runway Gen-3 Alpha, Luma Dream Machine, Kling 1.5, OpenAI Sora, Hailuo Minimax, Pika 2.0, and HunyuanVideo.
- Explore **[06-Video-Prompt-Engineering](./06-Video-Prompt-Engineering/README.md)** for cinematography, lens directives, volumetric lighting, and motion prompt guides.
- Explore **[08-Comparisons](./08-Comparisons/README.md)** for decision matrices (Best Free, Best Paid, Best Open-Source, Highest Motion Quality).
- Explore **[10-Open-Source](./10-Open-Source/README.md)** for HunyuanVideo, CogVideoX, Stable Video Diffusion, and ComfyUI video rendering workflows.
