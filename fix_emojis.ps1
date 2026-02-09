# Fix corrupted UTF-8 emojis in all HTML files
# Uses proper UTF-8 encoding without BOM

$emojiMap = @{
    'ðŸ"§' = '🔧'
    'ðŸ¤' = '🤝'
    'âš¡' = '⚡'
    'ðŸ—ï¸' = '🏗️'
    'ðŸŒ' = '🌐'
    'ðŸ—‚ï¸' = '🗂️'
    'ðŸ"Š' = '📊'
    'ðŸ"„' = '🔄'
    'ðŸŒ‰' = '🌉'
    'ðŸ"'' = '🔒'
    'ðŸ§©' = '🧩'
    'ðŸ¢' = '🏢'
    'ðŸ¤–' = '🤖'
}

$htmlFiles = Get-ChildItem -Path . -Recurse -Include *.html

foreach ($file in $htmlFiles) {
    Write-Host "Processing: $($file.Name)" -ForegroundColor Cyan
    
    # Read with UTF-8 encoding
    $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.UTF8Encoding]::new($false))
    $originalContent = $content
    
    # Replace all corrupted emojis
    foreach ($pair in $emojiMap.GetEnumerator()) {
        if ($content.Contains($pair.Key)) {
            $content = $content.Replace($pair.Key, $pair.Value)
            Write-Host "  Fixed: $($pair.Key) -> $($pair.Value)" -ForegroundColor Green
        }
    }
    
    # Write back only if changes were made
    if ($content -ne $originalContent) {
        [System.IO.File]::WriteAllText($file.FullName, $content, [System.Text.UTF8Encoding]::new($false))
        Write-Host "  ✓ Saved $($file.Name)" -ForegroundColor Yellow
    } else {
        Write-Host "  No emojis to fix" -ForegroundColor Gray
    }
}

Write-Host "`n✓ All emojis fixed!" -ForegroundColor Green
