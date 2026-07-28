---
title: Midjourney — Complete Technical Specification & Provider Reference
provider: Midjourney
view: By Provider
last_updated: 2026-07-28
tags: [midjourney, v6-1, niji-6, cref, sref, image-generation, discord, web-editor]
author: Antigravity AI Documentation Engine
---

# Midjourney — Complete Technical Specification & Provider Reference

# 1. Company Overview

- **Company**: Midjourney, Inc.
- **Parent Company**: Midjourney, Inc.
- **Founders**: David Holz (CEO & Founder, former co-founder of Leap Motion and NASA Langley researcher)
- **Headquarters**: San Francisco, California, USA
- **Year Founded**: 2022
- **Mission**: An independent research lab exploring new mediums of thought and expanding the imaginative powers of the human species.
- **Business Model**: 100% bootstrapped and self-funded profitability with over $200M+ ARR without taking venture capital funding.
- **AI Ecosystem**: Premier generative image foundation model suite (Midjourney v6.1, v6, v5.2, Niji 6 anime model) featuring advanced character reference consistency (`--cref`), style reference (`--sref`), aesthetic personalization (`--p`), Vary Region inpainting, canvas zoom/pan, `/describe` image-to-prompt reverse engineering, and dual creation interfaces (Midjourney Web Alpha Editor & Discord Bot).
- **Timeline & Major Milestones**:
  - **March 2022**: Founded by David Holz and launched Midjourney v1 closed beta on Discord.
  - **July 2022**: Released Midjourney v3 gaining global viral popularity.
  - **November 2022**: Released Midjourney v4 introducing groundbreaking photorealism.
  - **March 2023**: Released Midjourney v5 and v5.1.
  - **December 2023**: Released Midjourney v6 featuring 1024x1024 base resolution, text rendering, and character consistency (`--cref`).
  - **May 2024**: Launched Midjourney Web Alpha Editor (`midjourney.com/create`).
  - **July 2024**: Released Midjourney v6.1 featuring enhanced skin texture, smaller detail accuracy, 25% faster generation speed, and Niji 6.

---

# 2. AI Services Overview

| Service | Description | Interface Available | Main Models | Status |
| :--- | :--- | :--- | :--- | :--- |
| **Image Generation** | SOTA aesthetic text-to-image synthesis with photorealism | Web Editor / Discord | Midjourney v6.1, Midjourney v6 | Active |
| **Anime & Illustration** | Specialized Japanese anime, manga, and digital art models | Web Editor / Discord | Niji 6 (`--niji 6`), Niji 5 | Active |
| **Character Consistency** | Maintaining facial and character consistency across multiple images | Web Editor / Discord | `--cref <URL>` Parameter | Active |
| **Style Consistency** | Copying aesthetic color, lighting, and art styles from reference images | Web Editor / Discord | `--sref <URL>` Parameter | Active |
| **Inpainting & Editing** | Modifying specific image regions via interactive masking brushes | Web Editor / Discord | Vary Region / Inpainting Editor | Active |
| **Canvas Expansion** | Expanding canvas boundaries left/right/up/down and zooming out | Web Editor / Discord | Pan (← → ↑ ↓) & Zoom Out (1.5x/2x) | Active |
| **Image-to-Prompt (Describe)** | Reverse engineering 4 detailed text prompts from an uploaded image | Web Editor / Discord | `/describe` Engine | Active |

---

# 3. Image Generation Models

### Model: Midjourney v6.1
- **Name**: Midjourney v6.1 (`--v 6.1`)
- **Release Date**: July 2024
- **Base Resolution**: 1024x1024 pixels (upscalable to 2048x2048)
- **Services Provided by the Model**:
  - **SOTA Photorealism & Anatomy**: Improved human skin textures, realistic eyes, and hand anatomy.
  - **Small Detail Accuracy**: 25% faster generation speed with accurate small details (eyeglasses, jewelry, background objects).
  - **Text Rendering**: Renders words in quotes (`"text"`) inside generated artwork.
  - **Character & Style Reference**: Full compatibility with `--cref`, `--sref`, `--p`, and `--stylize`.

### Model: Niji 6
- **Name**: Niji 6 (`--niji 6`)
- **Services Provided by the Model**:
  - **Specialized Anime & Manga Art**: Engineered in partnership with Spellbrush for authentic Japanese animation artwork.

---

# 4. Membership Tiers & GPU Pricing

| Subscription Plan | Monthly Price | Fast GPU Hours Included | Unlimited Relax Mode | Concurrent Jobs |
| :--- | :--- | :--- | :--- | :--- |
| **Basic Plan** | $10 / month | 3.3 Fast Hours / month | No | 3 Fast jobs |
| **Standard Plan** | $30 / month | 15 Fast Hours / month | **Yes (Unlimited)** | 3 Fast / 12 Relax jobs |
| **Pro Plan** | $60 / month | 30 Fast Hours / month | **Yes (Unlimited)** | 12 Fast / 12 Relax jobs |
| **Mega Plan** | $120 / month | 60 Fast Hours / month | **Yes (Unlimited)** | 12 Fast / 12 Relax jobs |

---

# 5. Official References

- Official Midjourney Documentation: [docs.midjourney.com](https://docs.midjourney.com)
- Midjourney Web Creation App: [midjourney.com/create](https://midjourney.com/create)
- Official Website: [midjourney.com](https://midjourney.com)
