# ==========================================
# 🧹 DOCKER CLEANUP PRO v1.1 - Windows Wrapper
# ==========================================
# Script profissional para limpeza Docker
# Compatível com Docker & Portainer
# PowerShell wrapper para Windows
# Criado por: Matheus Névoa
# Linkedin: https://www.linkedin.com/in/matheusnevoa/
# Github: https://github.com/matheusnevoa
# Contribuição para suporte a Windows de: David Molizane
# Linkedin: https://www.linkedin.com/in/david-molizane/
# Github: https://github.com/Molizanee
# Atualizado em: Julho de 2025
# ==========================================

param(
    [switch]$UseWSL = $false,
    [switch]$UseGitBash = $false
)

Write-Host "🐳 Docker Cleanup Pro - Windows Launcher" -ForegroundColor Cyan
Write-Host "===========================================" -ForegroundColor Cyan
Write-Host ""

$scriptPath = Join-Path $PSScriptRoot "docker-cleanup-pro.sh"

if (-not (Test-Path $scriptPath)) {
    Write-Host "❌ Script principal não encontrado: $scriptPath" -ForegroundColor Red
    exit 1
}

# Verificar se Docker está disponível
try {
    docker --version | Out-Null
    Write-Host "✅ Docker encontrado!" -ForegroundColor Green
} catch {
    Write-Host "❌ Docker não encontrado! Instale o Docker Desktop primeiro." -ForegroundColor Red
    exit 1
}

# Função para converter caminho Windows para WSL usando wslpath
function Convert-ToWSLPath {
    param([string]$WindowsPath)
    
    try {
        $wslPath = wsl wslpath -u $WindowsPath
        return $wslPath.Trim()
    } catch {
        # Fallback manual se wslpath falhar
        $drive = $WindowsPath.Substring(0, 1).ToLower()
        $pathWithoutDrive = $WindowsPath.Substring(3).Replace('\', '/')
        return "/mnt/$drive/$pathWithoutDrive"
    }
}

# Tentar diferentes métodos para executar o script bash
if ($UseWSL) {
    Write-Host "🔄 Executando via WSL..." -ForegroundColor Yellow
    $wslPath = Convert-ToWSLPath $scriptPath
    wsl bash $wslPath
} elseif ($UseGitBash) {
    Write-Host "🔄 Executando via Git Bash..." -ForegroundColor Yellow
    & "C:\Program Files\Git\bin\bash.exe" $scriptPath
} else {
    # Auto-detectar o melhor método
    if (Get-Command wsl -ErrorAction SilentlyContinue) {
        Write-Host "🔄 WSL detectado - Executando via WSL..." -ForegroundColor Yellow
        $wslPath = Convert-ToWSLPath $scriptPath
        wsl bash $wslPath
    } elseif (Test-Path "C:\Program Files\Git\bin\bash.exe") {
        Write-Host "🔄 Git Bash detectado - Executando via Git Bash..." -ForegroundColor Yellow
        & "C:\Program Files\Git\bin\bash.exe" $scriptPath
    } elseif (Get-Command bash -ErrorAction SilentlyContinue) {
        Write-Host "🔄 Bash encontrado no PATH - Executando..." -ForegroundColor Yellow
        bash $scriptPath
    } else {
        Write-Host "❌ Nenhum ambiente bash encontrado!" -ForegroundColor Red
        Write-Host "Instale uma das seguintes opções:" -ForegroundColor Yellow
        Write-Host "- WSL (Windows Subsystem for Linux)" -ForegroundColor White
        Write-Host "- Git for Windows (inclui Git Bash)" -ForegroundColor White
        Write-Host "- MSYS2 ou similar" -ForegroundColor White
        Write-Host ""
        Write-Host "Ou execute com parâmetros específicos:" -ForegroundColor Yellow
        Write-Host "  .\docker-cleanup-pro.ps1 -UseWSL" -ForegroundColor White
        Write-Host "  .\docker-cleanup-pro.ps1 -UseGitBash" -ForegroundColor White
        exit 1
    }
}

Write-Host ""
Write-Host "Script concluído! Pressione qualquer tecla para continuar..." -ForegroundColor Green
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
