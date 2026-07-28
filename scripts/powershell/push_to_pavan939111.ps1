$git = "C:\Program Files\Git\cmd\git.exe"

$remoteUrl = "https://github.com/pavan939111/AI_World.git"

Write-Output "Updating remote origin URL to $remoteUrl..."
& $git remote remove origin 2>$null
& $git remote add origin $remoteUrl

Write-Output "Pushing main branch to $remoteUrl..."
& $git push -u origin main
