$providersDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\01-Providers"
$providers = Get-ChildItem -Directory -Path $providersDir

Write-Host "================================================================================"
Write-Host "        AI ENGINEERING KNOWLEDGE BASE -- 13 PROVIDERS CAPABILITY AUDIT           "
Write-Host "================================================================================"

$totalFilesAcrossKB = 0

foreach ($provider in $providers) {
    $pName = $provider.Name
    $folders = Get-ChildItem -Directory -Path $provider.FullName
    $files = Get-ChildItem -File -Recurse -Path $provider.FullName
    $totalFilesAcrossKB += $files.Count
    
    Write-Host "--------------------------------------------------------------------------------"
    Write-Host "PROVIDER: $pName"
    Write-Host "  Capabilities (Folders): $($folders.Count)"
    Write-Host "  Total Files: $($files.Count)"
    Write-Host "  Capability List:"
    foreach ($f in $folders) {
        Write-Host "    - $($f.Name)"
    }
}

Write-Host "================================================================================"
Write-Host "TOTAL DOCUMENTED FILES ACROSS ALL PROVIDERS: $totalFilesAcrossKB"
Write-Host "================================================================================"
