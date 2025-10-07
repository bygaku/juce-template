param(
    [Parameter(HelpMessage="Enter your project name")]
    [string]$ProjectName = "MyPlugin",
    
    [Parameter(HelpMessage="Enter your company name")]
    [string]$CompanyName = "MyLab",
    
    [switch]$Help
)

if ($Help) {
    Write-Host ""
    Write-Host "============================" -ForegroundColor Cyan
    Write-Host " JUCE Project Setup Script" -ForegroundColor Cyan
    Write-Host "============================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Usage:" -ForegroundColor Yellow
    Write-Host "  .\bin\setup.ps1 -ProjectName <name> [-CompanyName <name>] [-Help]"
    Write-Host ""
    Write-Host "Parameters:" -ForegroundColor Yellow
    Write-Host "  -ProjectName   : Your project name (default: MyPlugin)"
    Write-Host "  -CompanyName   : Your company name (default: MyLab)"
    Write-Host "  -Help          : Show this help"
    Write-Host ""
    Write-Host "Example:" -ForegroundColor Green
    Write-Host "  .\bin\setup.ps1 -P 'SuperDelay' -C 'My Audio Labs'"
    Write-Host ""
    exit 0
}

$ErrorActionPreference = "Stop"
$ProjectRoot = Split-Path -Parent $PSScriptRoot
    
Write-Host ""
Write-Host "============================" -ForegroundColor Cyan
Write-Host " JUCE Project Setup" -ForegroundColor Cyan
Write-Host "============================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Project Name: $ProjectName" -ForegroundColor White
Write-Host "Company Name: $CompanyName" -ForegroundColor White
Write-Host "Location: $ProjectRoot" -ForegroundColor White
Write-Host ""

$confirm = Read-Host "Continue with these settings? Or Show setup guide? (Continue:y / Help:h / Cancel:n)"
if ($confirm -eq 'n') {
    Write-Host "Setup cancelled." -ForegroundColor Yellow
    exit 0
}

if ($confirm -eq 'h') {
    Write-Host ""
    Write-Host "============================" -ForegroundColor Cyan
    Write-Host " JUCE Project Setup Script" -ForegroundColor Cyan
    Write-Host "============================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Usage:" -ForegroundColor Yellow
    Write-Host "  .\bin\setup.ps1 [-ProjectName <name>] [-CompanyName <name>] [-Help]"
    Write-Host ""
    Write-Host "Parameters:" -ForegroundColor Yellow
    Write-Host "  -ProjectName (or -P) : Your project name (default: MyPlugin)"
    Write-Host "  -CompanyName (or -C) : Your company name (default: MyLab)"
    Write-Host "  -Help                : Show this help"
    Write-Host ""
    Write-Host "Example:" -ForegroundColor Green
    Write-Host "  .\bin\setup.ps1 -P 'SuperDelay' -C 'MyAudioLabs'"
    Write-Host ""
    exit 0
}

try {
    Write-Host "`nUpdating CMakeLists.txt..." -ForegroundColor Yellow
    
    $cmakePath = "$ProjectRoot\CMakeLists.txt"
    if (!(Test-Path $cmakePath)) {
        throw "CMakeLists.txt not found!"
    }
    
    $cmake = Get-Content $cmakePath -Raw
    
    $PluginCode = ($ProjectName -replace '[^a-zA-Z]', '').Substring(0, [Math]::Min(4, $ProjectName.Length)).ToUpper()
    if ($PluginCode.Length -lt 4) {
        $PluginCode = $PluginCode.PadRight(4, 'X')
    }
    
    $CompanyCode = ($CompanyName -replace '[^a-zA-Z]', '').Substring(0, [Math]::Min(4, $CompanyName.Length))
    if ($CompanyCode.Length -lt 4) {
        $CompanyCode = $CompanyCode.PadRight(4, 'X')
    }
    
    $cmake = $cmake -replace 'set\(PROJECT_NAME ".*?"\)', "set(PROJECT_NAME `"$ProjectName`")"
    $cmake = $cmake -replace 'set\(PRODUCT_NAME ".*?"\)', "set(PRODUCT_NAME `"$ProjectName`")"
    $cmake = $cmake -replace 'set\(COMPANY_NAME ".*?"\)', "set(COMPANY_NAME `"$CompanyName`")"
    $cmake = $cmake -replace 'set\(COMPANY_CODE ".*?"\)', "set(COMPANY_CODE `"$CompanyCode`")"
    $cmake = $cmake -replace 'set\(PLUGIN_CODE ".*?"\)', "set(PLUGIN_CODE `"$PluginCode`")"
    $cmake = $cmake -replace 'set\(BUNDLE_ID ".*?"\)', "set(BUNDLE_ID `"com.$($CompanyName -replace ' ','').$ProjectName`")"
    
    $cmake | Out-File $cmakePath -Encoding UTF8 -NoNewline
    Write-Host "CMakeLists.txt updated." -ForegroundColor Green
    
    Write-Host ""
    Write-Host "============================" -ForegroundColor Green
    Write-Host " Setup Complete!" -ForegroundColor Green
    Write-Host "============================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Next steps:" -ForegroundColor Cyan
    Write-Host "  1. Build the project:" -ForegroundColor White
    Write-Host ""
    Write-Host "  2. Open in your IDE:" -ForegroundColor White
    Write-Host "     code ." -ForegroundColor Gray
    Write-Host "     or" -ForegroundColor Gray
    Write-Host "     Open build\$ProjectName.sln in Visual Studio" -ForegroundColor Gray
    Write-Host ""
    
} catch {
    Write-Host ""
    Write-Host "Error: $_" -ForegroundColor Red
    Write-Host ""
    Write-Host "Troubleshooting:" -ForegroundColor Yellow
    Write-Host "  - Check if you're in the project root directory" -ForegroundColor Gray
    Write-Host "  - Ensure CMakeLists.txt exists" -ForegroundColor Gray
    Write-Host "  - Try running with -SkipGit if Git issues occur" -ForegroundColor Gray
    exit 1
}