$servicesDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\02-Services"

$oldStubs = @(
    "Image-Generation",
    "Language-Models",
    "Agent-Frameworks",
    "Code-Generation",
    "Embeddings",
    "Fine-Tuning",
    "Function-Calling",
    "Image-Editing",
    "MCP-Servers",
    "Moderation",
    "OCR-Document-AI",
    "Realtime-Voice",
    "Reranking",
    "Speech-to-Text",
    "Structured-Outputs",
    "Text-to-Speech",
    "Video-Generation",
    "Vision-Multimodal",
    "Voice-Cloning"
)

foreach ($stub in $oldStubs) {
    $stubPath = Join-Path $servicesDir $stub
    if (Test-Path $stubPath) {
        Remove-Item -Recurse -Force $stubPath
        Write-Output "Removed old unnumbered duplicate stub directory: $stub"
    }
}

Write-Output "Cleanup completed successfully!"
