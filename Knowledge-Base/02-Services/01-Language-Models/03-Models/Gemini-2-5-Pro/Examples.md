---
title: Gemini 2.5 Pro — Code Examples
service: 01-Language-Models
model: Gemini-2-5-Pro
section: 03-Models
file: Examples.md
last_updated: 2026-07-28
tags: [language-models, gemini-2-5-pro, examples, code, python, grounding, vision]
author: Antigravity AI Knowledge Engine
---

# Gemini 2.5 Pro — Code Examples

Practical, executable Python examples demonstrating Google Search Grounding and video asset ingestion.

---

## Example 1: Google Search Grounding

This script configures the Gemini API to query Google Search dynamically, retrieve context, and return citations along with the generation.

```python
import google.generativeai as genai

# Configure credentials
genai.configure(api_key="GEMINI_API_KEY")

# Configure grounding tool
model = genai.GenerativeModel(
    model_name="gemini-2.5-pro",
    tools=[{"google_search": {}}]
)

response = model.generate_content(
    "What are the key terms in the latest legal cases regarding AI copyright in 2026?"
)

# Output response
print("Grounded Response Output:")
print(response.text)

# Access grounding metadata
try:
    grounding_metadata = response.candidates[0].grounding_metadata
    print("\nGoogle Search Queries Run:")
    print(grounding_metadata.web_search_queries)
    print("\nSource Links Cited:")
    for chunk in grounding_metadata.grounding_chunks:
        print(f"- {chunk.web.title}: {chunk.web.uri}")
except AttributeError:
    print("\nNo search grounding metadata returned.")
```

---

## Example 2: Ingesting Video Assets

This script uploads a video file, waits for processing completion, and queries the model about specific timeline events.

```python
import time
import google.generativeai as genai

# Configure credentials
genai.configure(api_key="GEMINI_API_KEY")

# Upload video file to the Files API
video_path = "meeting_recording.mp4"
print(f"Uploading file: {video_path}...")
video_file = genai.upload_file(path=video_path)
print(f"Upload complete. File URL: {video_file.uri}")

# Wait for processing to complete
print("Waiting for video processing...")
while video_file.state.name == "PROCESSING":
    time.sleep(5)
    video_file = genai.get_file(video_file.name)
    print(".", end="", flush=True)

if video_file.state.name == "FAILED":
    raise ValueError(f"Video processing failed: {video_file.error.message}")

print("\nProcessing complete. Querying model...")

model = genai.GenerativeModel(model_name="gemini-2.5-pro")

# Call generation endpoint passing the media file
response = model.generate_content(
    [
        video_file,
        "Summarize the key action items discussed in the video. List timestamps for each action."
    ]
)

print("\nVideo Action Items:")
print(response.text)

# Optional: Clean up file after execution
genai.delete_file(video_file.name)
print("Cleaned up file from API storage.")
```
