---
title: OpenAI â€” Executive Company Overview & Enterprise Infrastructure
provider: OpenAI
capability: 00-Overview
file: Company.md
last_updated: 2026-07-28
tags: [openai, company, architecture, infrastructure, microsoft, azure, SOC2, HIPAA]
author: Antigravity AI Knowledge Engine
---

# OpenAI â€” Executive Company Overview & Infrastructure

## 1. Executive Summary & Corporate Governance
OpenAI is an artificial intelligence research and deployment company headquartered in San Francisco, California. Founded in December 2015, OpenAI transitioned in 2019 from a pure non-profit lab to a hybrid governance model consisting of **OpenAI Inc.** (a 501(c)(3) non-profit parent entity) and **OpenAI Global LLC** (a capped-profit commercial subsidiary).

OpenAI's primary mission is to ensure that Artificial General Intelligence (AGI)â€”defined as highly autonomous systems that outperform humans at most economically valuable workâ€”benefits all of humanity.

```text
               â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
               â”‚         OpenAI Inc. (Non-Profit)         â”‚
               â”‚   Board of Directors / Governance Core  â”‚
               â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”¬â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
                                    â”‚ Controls
                                    â–¼
               â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
               â”‚    OpenAI Global LLC (Capped-Profit)    â”‚
               â”‚   Commercial APIs, ChatGPT Enterprise   â”‚
               â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
```

---

## 2. Strategic Microsoft Partnership & Azure Infrastructure
- **Capital & Strategic Investment**: Microsoft has invested over $13 Billion into OpenAI, securing an exclusive commercial cloud partnership and a 49% share of profits up to a specified investment return cap.
- **Exclusive Cloud Infrastructure**: All OpenAI API inference workloads and model training runs execute exclusively on Microsoft Azure AI supercomputing infrastructure.
- **Hardware Architecture**:
  - **Training Clusters**: Tens of thousands of NVIDIA H100 (80GB HBM3) and H200 (141GB HBM3e) SXM5 GPUs linked via NVIDIA Quantum-2 InfiniBand networking (3.2 Tbps per node).
  - **Inference Hardware**: Custom Azure node deployments with NVIDIA HGX H100/H200 and Microsoft Maia 100 custom AI accelerators.
  - **Stargate Project**: A joint $100 Billion supercomputing infrastructure initiative planned for 2026â€“2028 deployment featuring NVIDIA Blackwell B200 and GB200 NVL72 architectures.

---

## 3. Commercial Product Ecosystem

| Tier / Platform | Product Name | Description & Key Features | Primary Target Audience |
| :--- | :--- | :--- | :--- |
| **Consumer & Team** | **ChatGPT Free / Plus / Team** | Web UI, iOS/Android apps, Voice Mode, Canvas code workspace, Custom GPTs | Consumers, small teams, researchers |
| **Enterprise SaaS** | **ChatGPT Enterprise** | Unlimited high-speed GPT-4o, 32k context, Workspace admin controls, Custom GPT sharing | Large enterprises, universities |
| **Developer API** | **OpenAI Developer Platform** | REST APIs (`api.openai.com`), WebSockets Realtime API, Batch API, Fine-Tuning | Software engineers, startups, SaaS builders |
| **Cloud Enterprise** | **Azure OpenAI Service** | Dedicated Provisioned Throughput Units (PTU), regional data residency, VNet security | Regulated banking, healthcare, government |

---

## 4. Security, Compliance & Data Governance

- **API Data Privacy & Training Policy**:
  - Data submitted to the OpenAI API (`api.openai.com`) is **NOT** used to train or improve OpenAI models.
  - API inputs and outputs are retained for 30 days solely for abuse and misuse monitoring, after which they are permanently deleted.
- **Zero Data Retention (ZDR)**:
  - Available for qualifying enterprise API customers and sensitive workloads (e.g. healthcare, legal), disabling the 30-day abuse storage entirely.
- **Certifications & Compliance**:
  - **SOC 2 Type II** certified across Security, Availability, and Confidentiality.
  - **HIPAA Compliance**: Business Associate Agreements (BAA) available for Azure OpenAI Service and qualifying API tiers.
  - **GDPR & CCPA**: Fully compliant data processing addendums (DPA) and data subject request workflows.
  - **Encryption**: TLS 1.3 in transit and AES-256 at rest.
