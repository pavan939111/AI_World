---
title: OpenAI Vision API â€” Image Token Calculator & Detail Parameter Mechanics
provider: OpenAI
capability: 04-Vision-and-Document-Understanding
file: Image-Token-Calculator.md
last_updated: 2026-07-28
tags: [openai, vision, image-tokens, token-calculator, detail-high, detail-low]
author: Antigravity AI Knowledge Engine
---

# OpenAI Vision API â€” Image Token Calculator & Detail Mechanics

## 1. Overview & Image Detail Modes
When sending images to OpenAI Vision models (`gpt-4o` or `gpt-4o-mini`), developers specify the `detail` parameter:
- **`detail: "low"`**: Fast, fixed-cost processing for simple image classification or low-resolution thumbnails.
- **`detail: "high"`**: High-resolution tile decomposition for fine document OCR, chart parsing, and visual diagram inspection.
- **`detail: "auto"`**: Default setting; OpenAI automatically selects `"low"` or `"high"` based on input image dimensions.

---

## 2. Image Token Calculation Algorithms

### Low-Detail Mode Token Formula
- **Fixed Cost**: Any image processed with `detail: "low"` consumes a flat **85 tokens**, regardless of aspect ratio or original resolution (image is downscaled to 512x512).

### High-Detail Mode Token Algorithm
For `detail: "high"`, OpenAI uses a 4-step tile grid calculation:
1. **Scale to Fit 2048x2048**: If image dimensions exceed 2048x2048, scale down to fit within a 2048x2048 bounding box.
2. **Scale Shortest Side to 768px**: Scale the image so that its shortest side is 768 pixels long.
3. **Count 512x512 Tiles**: Count how many 512x512 pixel tiles are needed to cover the scaled image.
4. **Calculate Final Tokens**: Multiply tile count by **170 tokens** and add **85 base tokens**.

$$\text{Total Tokens} = (\text{Tile Count} \times 170) + 85$$

---

## 3. High-Detail Token Cost Lookup Table

| Image Dimensions (Width x Height) | Scaled Dimensions | Tile Count (512x512 Grid) | Total Image Tokens | Input Cost (GPT-4o) | Input Cost (GPT-4o-mini) |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Low-Detail (Any Size)** | 512x512 | Fixed Low-Detail | **85 Tokens** | **$0.00021** | **$0.000013** |
| **1024 x 1024** | 768 x 768 | 4 Tiles (2x2) | **765 Tokens** | **$0.00191** | **$0.000115** |
| **2048 x 1024** | 1536 x 768 | 6 Tiles (3x2) | **1,105 Tokens** | **$0.00276** | **$0.000166** |
| **4096 x 2048** | 2048 x 1024 | 8 Tiles (4x2) | **1,445 Tokens** | **$0.00361** | **$0.000217** |
