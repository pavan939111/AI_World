$git = "C:\Program Files\Git\cmd\git.exe"

Write-Output "Committing staged files..."
& $git commit -m "Initial commit: AI World Master Knowledge Base (Providers, Services, Comparisons)"

Write-Output "Setting default branch to main..."
& $git branch -M main

Write-Output "Checking remote configuration..."
& $git remote -v
