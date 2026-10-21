$ErrorActionPreference = "Stop"
$env:JAVA_HOME = "C:\Program Files\Eclipse Adoptium\jdk-17.0.19.10-hotspot"
$env:PATH = "$env:JAVA_HOME\bin;$env:PATH"
$env:ANDROID_HOME = "C:\Users\Nikola\AppData\Local\Android\Sdk"

Set-Location "C:\Users\Nikola\Desktop\GAMEMODDING\YUNO PROJECT\YUNO_ANDROID"

Write-Host "Building YU-NO Android APK..." -ForegroundColor Cyan
cmd.exe /c "gradlew.bat assembleDebug"

if ($LASTEXITCODE -eq 0) {
    Write-Host "`nBUILD SUCCESSFUL!" -ForegroundColor Green
    $apk = Get-ChildItem "app\build\outputs\apk\debug\*.apk" | Select-Object -First 1
    if ($apk) {
        $rootApk = Join-Path (Get-Location) "YuNo.apk"
        Copy-Item $apk.FullName $rootApk -Force
        Write-Host "Output APK: $($apk.FullName)" -ForegroundColor Yellow
        Write-Host "Ready at root: $rootApk" -ForegroundColor Green
    }
} else {
    Write-Host "`nBUILD FAILED with exit code $LASTEXITCODE" -ForegroundColor Red
}
