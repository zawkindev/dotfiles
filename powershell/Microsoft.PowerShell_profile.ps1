oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\takuya.omp.json" | Invoke-Expression

$PSStyle.FileInfo.Directory = "`e[38;2;255;255;255m"

Set-Alias vim nvim
