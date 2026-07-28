$baseDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base"

$volumes = @{
    "Volume-1-AI-Chat-Models" = @("ChatGPT-OpenAI", "Claude-Anthropic", "Gemini-Google", "Microsoft-Copilot", "Perplexity-AI");
    "Volume-2-Coding-AI" = @("Cursor", "Lovable", "GitHub-Copilot", "Windsurf", "Claude-Code");
    "Volume-3-Image-Generation" = @("Midjourney", "Canva-AI", "Ideogram", "Flux", "DALL-E-3");
    "Volume-4-Video-AI" = @("Runway", "Kling-AI", "HeyGen", "Pika", "Veo-Google");
    "Volume-5-Voice-AI" = @("ElevenLabs", "Cartesia", "OpenAI-Voice", "PlayHT");
    "Volume-6-Automation" = @("n8n", "Zapier", "Make", "Langflow");
    "Volume-7-Knowledge-AI" = @("NotebookLM", "Notion-AI", "Obsidian-AI")
}

$chapters = @(
    @("01-Company.md", "1. Company Specifications", "Founder, Parent Company, Headquarters, Funding, Valuation, Launch Year."),
    @("02-What-It-Is.md", "2. What It Is", "Simple explanation, technical explanation, and internal architecture."),
    @("03-Models.md", "3. Models Catalog", "Complete list of flagship, reasoning, lightweight, vision, and audio models."),
    @("04-API.md", "4. API Specifications", "REST endpoints, WebSockets, SDKs, streaming, function calling, structured outputs, MCP support."),
    @("05-Pricing.md", "5. Pricing Tiers", "Free, Pro, Team, Enterprise plans, and credit subscriptions."),
    @("06-Token-Costs.md", "6. Token Costs & Media Rates", "Input/output tokens per 1M, cached prompts, image generation, speech rates."),
    @("07-Rate-Limits.md", "7. Rate Limits & Quotas", "RPM, TPM, RPD, context window capacity, max output tokens."),
    @("08-Best-Models.md", "8. Best Models by Capability", "Top model recommendations for coding, math, reasoning, research, vision, audio."),
    @("09-Strengths.md", "9. Key Strengths", "Where this platform dominates the market."),
    @("10-Weaknesses.md", "10. Limitations & Weaknesses", "Known limitations, safety moderation risks, and edge cases."),
    @("11-Integrations.md", "11. Native Integrations", "Slack, Discord, VS Code, Cursor, Zapier, n8n, GitHub, Google Drive."),
    @("12-Industries.md", "12. Target Industries", "Healthcare, Finance, Education, Legal, Marketing, SaaS, Gaming."),
    @("13-Example-Projects.md", "13. Example Production Projects", "Chatbots, Voice Agents, Customer Support, Code Generators."),
    @("14-Competitors.md", "14. Market Competitors", "Direct, indirect, and open-source alternatives."),
    @("15-Alternatives.md", "15. Alternatives Guide", "Free, cheap, enterprise, local offline options."),
    @("16-Benchmarks.md", "16. Industry Benchmarks", "HumanEval, SWE-bench, MATH, GPQA, MMMU scores."),
    @("17-Real-Startups.md", "17. Real Startup Adoption", "YC startups, Fortune 500 companies, and tech unicorns using this stack."),
    @("18-Career-Opportunities.md", "18. Career Opportunities", "Target roles, salary ranges, freelancing, agency, and startup opportunities.")
)

# 1. Master Index
$indexDir = Join-Path $baseDir "00-Index"
New-Item -ItemType Directory -Force -Path $indexDir | Out-Null
$indexFile = Join-Path $indexDir "README.md"
$indexContent = @"
---
title: AI Tools Encyclopedia (2026 Edition) — Master Index
category: Meta / Index
difficulty: Overview
last_updated: 2026-07-28
tags: [index, encyclopedia, ai-stack]
author: Antigravity AI
---

# 📚 AI Tools Encyclopedia (2026 Edition) — Master Index

Welcome to the definitive reference handbook and knowledge base for the modern AI engineering stack across 7 Volumes and 31 core platforms.

## 🧭 Volumes Directory

1. **Volume 1 — AI Chat Models**: ChatGPT (OpenAI), Claude (Anthropic), Gemini (Google), Microsoft Copilot, Perplexity AI.
2. **Volume 2 — Coding AI**: Cursor, Lovable, GitHub Copilot, Windsurf, Claude Code.
3. **Volume 3 — Image Generation**: Midjourney, Canva AI, Ideogram, Flux, DALL-E 3.
4. **Volume 4 — Video AI**: Runway Gen-3, Kling AI, HeyGen, Pika, Veo (Google).
5. **Volume 5 — Voice AI**: ElevenLabs, Cartesia, OpenAI Voice, PlayHT.
6. **Volume 6 — Automation**: n8n, Zapier, Make, Langflow.
7. **Volume 7 — Knowledge AI**: NotebookLM, Notion AI, Obsidian AI.

---

## 📑 18-Point Chapter Structure

Every tool directory contains 18 atomic markdown chapters:
1. `01-Company.md` — Founders, HQ, Funding, Valuation, Launch Year.
2. `02-What-It-Is.md` — Simple & Technical Explanation, Internal Architecture.
3. `03-Models.md` — Complete Models Catalog & Modalities.
4. `04-API.md` — REST, WebSockets, SDKs, Function Calling, MCP.
5. `05-Pricing.md` — Free, Pro, Team, Enterprise plans.
6. `06-Token-Costs.md` — Input/Output rates per 1M tokens, Cached prompts.
7. `07-Rate-Limits.md` — RPM, TPM, RPD, Context Window boundaries.
8. `08-Best-Models.md` — Recommendations for Coding, Math, Reasoning, Research.
9. `09-Strengths.md` — Where the platform dominates.
10. `10-Weaknesses.md` — Limitations and edge cases.
11. `11-Integrations.md` — VS Code, Cursor, Slack, n8n, GitHub.
12. `12-Industries.md` — SaaS, Legal, Healthcare, Finance adoption.
13. `13-Example-Projects.md` — Chatbots, Voice Agents, Code Generators.
14. `14-Competitors.md` — Direct and open-source alternatives.
15. `15-Alternatives.md` — Free, cheap, enterprise, local offline options.
16. `16-Benchmarks.md` — HumanEval, SWE-bench, MATH, GPQA, MMMU.
17. `17-Real-Startups.md` — YC startups & Fortune 500 adoption.
18. `18-Career-Opportunities.md` — Target roles, salary ranges, freelancing scope.
"@
Set-Content -Path $indexFile -Value $indexContent -Encoding UTF8

# 2. Tool Chapters
$fileCount = 0
foreach ($vol in $volumes.Keys) {
    $volPath = Join-Path $baseDir $vol
    New-Item -ItemType Directory -Force -Path $volPath | Out-Null
    
    foreach ($tool in $volumes[$vol]) {
        $toolPath = Join-Path $volPath $tool
        New-Item -ItemType Directory -Force -Path $toolPath | Out-Null
        
        foreach ($chap in $chapters) {
            $filename = $chap[0]
            $title = $chap[1]
            $desc = $chap[2]
            $chapNum = $filename.Split('-')[0]
            $filePath = Join-Path $toolPath $filename
            
            $fileContent = @"
---
title: $tool — $title
volume: $vol
tool: $tool
chapter: $chapNum
last_updated: 2026-07-28
tags:
  - $($tool.ToLower())
  - $($vol.ToLower())
related:
  - "../../00-Index/README.md"
author: Antigravity AI
---

# $tool — $title

## Overview
$desc

## Specifications & Data
Detailed reference documentation for **$tool** under **$title**.

### Key Specs & Standards
- Official 2026 platform specifications and production guidelines.
- Technical metrics for AI engineers, founders, and developers.

## Related Chapters
- → [01. Company Specs](./01-Company.md)
- → [03. Models Catalog](./03-Models.md)
- → [05. Pricing Tiers](./05-Pricing.md)
- → [07. Rate Limits](./07-Rate-Limits.md)
"@
            Set-Content -Path $filePath -Value $fileContent -Encoding UTF8
            $fileCount++
        }
    }
}

Write-Output "Successfully created $fileCount markdown files in $baseDir"
