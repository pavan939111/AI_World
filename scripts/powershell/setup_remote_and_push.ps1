$git = "C:\Program Files\Git\cmd\git.exe"

$remoteUrl = "https://github.com/pavan939/AI_World.git"

Write-Output "Adding remote origin: $remoteUrl..."
& $git remote remove origin 2>$null
& $git remote add origin $remoteUrl

Write-Output "Pushing branch 'main' to origin..."
& $git push -u origin main
