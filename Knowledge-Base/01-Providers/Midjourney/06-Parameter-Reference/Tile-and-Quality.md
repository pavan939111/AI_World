---
title: Midjourney â€” Tile-and-Quality Specification
provider: Midjourney
capability: 06-Parameter-Reference
file: Tile-and-Quality.md
last_updated: 2026-07-28
tags: [midjourney, v6-1, 06-parameter-reference, tile-and-quality]
author: Antigravity AI Documentation Engine
---

# Midjourney â€” Tile-and-Quality

## Overview
Detailed technical specification for **Tile-and-Quality** under **06-Parameter-Reference**.

## Model & Feature Specifications
- **Provider**: Midjourney, Inc. (San Francisco, CA)
- **Primary Interface**: Midjourney Web Editor & Discord Slash Commands (/imagine)
- **Base Resolution**: 1024x1024 pixels (upscalable to 2048x2048)
- **Supported Parameters**: --ar, --stylize, --cref, --sref, --p, --chaos, --weird, --tile, --version
- **Pricing Plans**: Basic ($10/mo), Standard ($30/mo), Pro ($60/mo), Mega ($120/mo)

## Typical Use Cases
1. Commercial advertising imagery & cinematic photorealism.
2. Consistent character storyboarding using --cref character reference.

## Strengths & Limitations
- **Strengths**: SOTA aesthetic beauty, unmatched artistic style control, character & style consistency (--cref/--sref), Niji 6 anime mode.
- **Limitations**: No public REST API for programmatic server backend integration (operated via Web & Discord).

## Example Prompt Command
`	ext
/imagine prompt: A cinematic full-body photograph of an astronaut walking through a futuristic neon city, photorealistic, 8k resolution, shot on 35mm lens --ar 16:9 --stylize 250 --v 6.1
`

## Related Documentation & Models
- See official Midjourney documentation at https://docs.midjourney.com
