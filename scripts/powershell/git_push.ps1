$git = "C:\Program Files\Git\cmd\git.exe"

Write-Output "Configuring Git credentials..."
& $git config --global user.name "pavan939"
& $git config --global user.email "pavankumarkunukuntla@gmail.com"

Write-Output "Initializing Git repository..."
if (-not (Test-Path "c:\Users\Admin\Desktop\AI_World\.git")) {
    & $git init
}

Write-Output "Staging files..."
& $git add .

Write-Output "Checking status..."
& $git status --short
