# GitHub 업로드 준비 스크립트
# 1) Git이 설치되어 있어야 합니다.
# 2) Git 설치 후 이 스크립트를 실행하면 로컬 저장소 초기화 및 원격 연결을 시도합니다.

$repoUrl = 'https://github.com/laonspeech01-beep/laonzena.git'

function Check-Git {
    $git = Get-Command git -ErrorAction SilentlyContinue
    if (-not $git) {
        Write-Host 'Git이 설치되어 있지 않습니다. 먼저 Git을 설치해주세요.' -ForegroundColor Yellow
        Write-Host 'https://git-scm.com/downloads' -ForegroundColor Cyan
        return $false
    }
    return $true
}

if (-not (Check-Git)) { return }

Write-Host 'Git이 감지되었습니다. 로컬 저장소 초기화를 진행합니다...' -ForegroundColor Green

git init
git branch -M main
git add .
git commit -m 'Initial website build'
git remote remove origin 2>$null
git remote add origin $repoUrl
git push -u origin main

Write-Host '작업이 완료되었습니다. 문제가 있으면 출력 메시지를 확인해주세요.' -ForegroundColor Green
