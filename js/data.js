window.AI_DATA = {
  explorations: [
    { id: "view-provider", name: "🏢 View 1: By Provider", desc: "What does OpenAI, Anthropic, or Google provide?" },
    { id: "view-service", name: "⚡ View 2: By Service", desc: "Who offers image generation, realtime voice, or embeddings?" },
    { id: "view-comparison", name: "📊 View 3: By Comparison", desc: "Which provider is best or cheapest for your stack?" }
  ],
  providers: [
    {
      id: "openai",
      name: "OpenAI",
      category: "Provider",
      logo: "🤖",
      tagline: "Multimodal flagship models (GPT-4o, o1, o3-mini), Realtime Audio API, DALL-E 3 & Embeddings.",
      badge: "Industry Leader",
      hasApi: true,
      models: ["GPT-4o", "o3-mini", "o1", "text-embedding-3-small/large", "DALL-E 3", "Whisper v3"],
      apis: ["Responses API", "Realtime Voice API", "Batch API", "Fine-Tuning API", "Images API", "Vector Stores"],
      servicesOffered: ["Language Models", "Embeddings", "Image Generation", "Vision", "Speech-to-Text", "Realtime Voice", "Function Calling", "Fine-Tuning"],
      details: {
        company: "Founded 2015, HQ San Francisco, $157B Valuation, backed by Microsoft.",
        sdks: "Official Python (`openai`), TypeScript (`openai`), Go",
        pricing: "GPT-4o: $2.50 in / $10.00 out | o3-mini: $1.10 in / $4.40 out | 50% Prompt Caching Discount",
        rateLimits: "Tier 1: 500 RPM | Tier 5: 10,000+ RPM",
        auth: "Bearer Token (`Authorization: Bearer YOUR_KEY`)",
        examples: `from openai import OpenAI\nclient = OpenAI()\ncompletion = client.chat.completions.create(model="gpt-4o", messages=[{"role": "user", "content": "Hello"}])`
      }
    },
    {
      id: "anthropic",
      name: "Anthropic",
      category: "Provider",
      logo: "🟧",
      tagline: "Claude 3.7 Sonnet hybrid reasoning models, Constitutional AI, and Model Context Protocol (MCP).",
      badge: "Top for Developers",
      hasApi: true,
      models: ["Claude 3.7 Sonnet (Hybrid Reasoning)", "Claude 3.5 Haiku", "Claude 3 Opus"],
      apis: ["Messages API", "Computer Use (GUI Agent)", "Prompt Caching (90% savings!)", "Batch API", "MCP Native"],
      servicesOffered: ["Language Models", "Vision", "Code Generation", "Agent Frameworks", "MCP Servers", "Function Calling", "Structured Outputs"],
      details: {
        company: "Founded 2021, HQ San Francisco, $40B Valuation, backed by Amazon & Google.",
        sdks: "Official Python (`@anthropic-ai/sdk`), TypeScript (`@anthropic-ai/sdk`)",
        pricing: "Claude 3.7 Sonnet: $3.00 in / $15.00 out | Prompt Caching Read: $0.30/1M (90% savings!)",
        rateLimits: "Tier 1: 50 RPM | Tier 4: 4,000 RPM",
        auth: "X-Api-Key Header (`x-api-key: YOUR_KEY`)",
        examples: `import anthropic\nclient = anthropic.Anthropic()\nmsg = client.messages.create(model="claude-3-7-sonnet-20250219", max_tokens=1024, messages=[{"role": "user", "content": "Hi"}])`
      }
    },
    {
      id: "google-ai",
      name: "Google AI (DeepMind)",
      category: "Provider",
      logo: "♊",
      tagline: "Gemini 2.5 Pro 2M Context Window, Imagen 3, Veo 2 video, and live Google Search Grounding.",
      badge: "2M Context Window",
      hasApi: true,
      models: ["Gemini 2.5 Pro (2M Context)", "Gemini 2.5 Flash", "Imagen 3", "Veo 2"],
      apis: ["AI Studio API", "Vertex AI Enterprise", "Google Search Grounding", "Context Caching"],
      servicesOffered: ["Language Models", "Embeddings", "Vision", "Video Generation", "Audio", "Grounding", "Fine-Tuning"],
      details: {
        company: "Google DeepMind, HQ Mountain View, CA.",
        sdks: "Official Python (`@google/genai`), TypeScript, Go, Java",
        pricing: "Gemini 2.5 Pro: $1.25 in / $5.00 out (<128k) | Gemini Flash: $0.075 in / $0.30 out",
        rateLimits: "Free: 15 RPM | Paid: 1,000 - 4,000 RPM",
        auth: "API Key Header or GCP Service Account OAuth2",
        examples: `from google import genai\nclient = genai.Client()\nres = client.models.generate_content(model="gemini-2.5-pro", contents="Explain Gemini.")`
      }
    },
    {
      id: "black-forest-labs",
      name: "Black Forest Labs",
      category: "Provider",
      logo: "🎨",
      tagline: "FLUX.1 state-of-the-art 12B open-weights image generation models with accurate text rendering.",
      badge: "Open Weights King",
      hasApi: true,
      models: ["FLUX.1 [pro]", "FLUX.1 [dev]", "FLUX.1 [schnell]"],
      apis: ["BFL Direct API", "Replicate API", "Fal.ai API", "ComfyUI Local Weights"],
      servicesOffered: ["Image Generation", "Typography", "Open Weights Models"],
      details: {
        company: "Founded 2024 by Stable Diffusion creators, HQ Freiburg, Germany.",
        sdks: "Replicate Python SDK, Fal JS Client",
        pricing: "FLUX [schnell]: $0.003 / image | FLUX [dev]: $0.025 / image | FLUX [pro]: $0.050 / image",
        rateLimits: "High concurrency on cloud hosts",
        auth: "Bearer Token Header",
        examples: `import replicate\noutput = replicate.run("black-forest-labs/flux-schnell", input={"prompt": "Neon text"})`
      }
    },
    {
      id: "elevenlabs",
      name: "ElevenLabs",
      category: "Provider",
      logo: "🔊",
      tagline: "Ultra-realistic Text-to-Speech, voice cloning, and real-time interactive voice agents across 29 languages.",
      badge: "Voice Market Leader",
      hasApi: true,
      models: ["Eleven Multilingual v2", "Eleven Turbo v2.5", "Conversational AI Agent SDK"],
      apis: ["Text-to-Speech API", "Voice Cloning API", "WebSockets Streaming", "Dubbing API"],
      servicesOffered: ["Text-to-Speech", "Voice Cloning", "Realtime Voice", "Audio Translation"],
      details: {
        company: "Founded 2022, HQ New York, $1.1B Valuation.",
        sdks: "Python (`elevenlabs`), JavaScript (`elevenlabs`)",
        pricing: "Turbo v2.5: $0.15 - $0.30 per 1,000 text characters",
        rateLimits: "2 to 15 concurrent streams",
        auth: "`xi-api-key` Header",
        examples: `from elevenlabs import generate\naudio = generate(text="Hello world", voice="Rachel", model="eleven_multilingual_v2")`
      }
    }
  ],
  services: [
    { name: "Language Models (LLMs)", providers: ["OpenAI", "Anthropic", "Google AI", "DeepSeek", "xAI", "Mistral", "Meta"] },
    { name: "Embeddings", providers: ["OpenAI", "Voyage AI", "Cohere", "Google AI", "Jina AI"] },
    { name: "Image Generation", providers: ["Black Forest Labs (FLUX)", "Midjourney", "Ideogram", "OpenAI (DALL-E 3)", "Recraft"] },
    { name: "Speech-to-Text", providers: ["OpenAI (Whisper)", "Deepgram"] },
    { name: "Text-to-Speech & Voice", providers: ["ElevenLabs", "Cartesia", "PlayHT"] },
    { name: "Realtime Voice APIs (<300ms)", providers: ["OpenAI Realtime API", "Cartesia Sonic", "ElevenLabs Conversational Agent"] },
    { name: "Code Generation", providers: ["Cursor Composer", "Anthropic (Claude Code)", "GitHub Copilot", "Codeium"] },
    { name: "Agent Frameworks & MCP", providers: ["Anthropic (MCP)", "n8n AI Agents", "LangChain"] }
  ],
  comparisons: [
    { title: "LLM Benchmark Comparison", metric: "Coding & Reasoning", leader: "Claude 3.7 Sonnet (93.7% SWE-bench)" },
    { title: "Vector Embedding Comparison", metric: "RAG Retrieval Accuracy", leader: "Voyage-3 & text-embedding-3-large" },
    { title: "Image Generation Comparison", metric: "Text Typography", leader: "FLUX.1 [pro] & Ideogram 2.0" },
    { title: "Realtime Voice Comparison", metric: "Sub-300ms Latency", leader: "GPT-4o Realtime & Cartesia Sonic" },
    { title: "Pricing Comparison", metric: "Budget High Efficiency", leader: "DeepSeek-V3 ($0.14 / 1M) & Gemini Flash" }
  ],
  architectures: [
    {
      id: "rag",
      name: "Retrieval-Augmented Generation (RAG)",
      tag: "Knowledge Base Systems",
      summary: "Connect your enterprise internal documents (PDFs, SQL, Notion) to LLMs without fine-tuning.",
      steps: [
        "1. Ingestion: Document chunks created via RecursiveCharacterTextSplitter.",
        "2. Embedding: Chunks embedded using text-embedding-3-small or Gemini Embeddings.",
        "3. Vector Storage: Saved to Qdrant / Pinecone / pgvector with HNSW index.",
        "4. Retrieval: Query embedded -> Top K cosine similarity chunks retrieved.",
        "5. Generation: Context chunks + System prompt fed to Claude 3.7 Sonnet / GPT-4o with citations."
      ],
      codeSnippet: `// Standard RAG Prompt Formulation\nconst prompt = \\\`Use ONLY context:\\n\${retrievedChunks.join("\\n")}\\nQuery: \${userQuery}\\\`;`
    },
    {
      id: "agents",
      name: "Autonomous AI Agents & MCP Protocol",
      tag: "Agentic Systems",
      summary: "Enable LLMs to execute loops, call APIs, use terminal tools, and interact with desktop applications.",
      steps: [
        "1. Perception: Agent reads goal and environment state.",
        "2. Planning: Extended thinking (e.g. Claude 3.7 / o3-mini) breaks down sub-goals.",
        "3. Tool Selection: Agent selects MCP Server tool (e.g., git_commit, run_sql_query).",
        "4. Execution: System executes tool and returns JSON result.",
        "5. Reflection: Agent evaluates output; repeats loop until task complete."
      ],
      codeSnippet: `// MCP Tool Call Structure\n{ "tool": "execute_query", "arguments": { "sql": "SELECT COUNT(*) FROM users;" } }`
    },
    {
      id: "routing",
      name: "Model Routing & Cost Optimization",
      tag: "Production Optimization",
      summary: "Route lightweight prompts to cheap models (Flash / Haiku) and hard queries to reasoning models (o3 / Claude 3.7).",
      steps: [
        "1. Classifier: Lightweight model or rule evaluator classifies prompt complexity.",
        "2. Fast Path: Simple formatting/classification -> Route to Gemini 2.5 Flash ($0.075/1M).",
        "3. Hard Path: Complex code/math -> Route to Claude 3.7 Sonnet / o1 ($3.00/1M).",
        "4. Dynamic Caching: Cache common system prompts to get 80-90% prompt cost discount."
      ],
      codeSnippet: `// Model Router Logic\nfunction routeQuery(prompt) {\n  if (isSimpleClassification(prompt)) return "gemini-2.5-flash";\n  if (isComplexCoding(prompt)) return "claude-3-7-sonnet";\n  return "gpt-4o-mini";\n}`
    }
  ]
};
