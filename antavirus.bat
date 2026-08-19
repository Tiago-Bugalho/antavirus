@echo off
setlocal

:: ============================================================
:: TROLL - FAKE SYSTEM ERROR
:: ============================================================

:: 1. Abrir 20 caixas de erro
for /L %%i in (1,1,20) do (
    start "" mshta "javascript:var s=new ActiveXObject('WScript.Shell');s.Popup('ERRO: System32 não encontrado',0,'ALERTA',16);close();"
    ping 127.0.0.1 -n 1 -w 50 >nul
)

:: 2. Mostrar imagem em fullscreen por 7 segundos
powershell.exe -NoProfile -WindowStyle Hidden -Command ^
"Add-Type -AssemblyName System.Windows.Forms; ^
Add-Type -AssemblyName System.Drawing; ^
$f=New-Object System.Windows.Forms.Form; ^
$f.WindowState='Maximized'; ^
$f.FormBorderStyle='None'; ^
$f.TopMost=$true; ^
$f.BackColor='Black'; ^
$f.KeyPreview=$true; ^
$fechar=$false; ^
$f.Add_FormClosing({if(-not $fechar){$_.Cancel=$true}}); ^
$p=New-Object System.Windows.Forms.PictureBox; ^
$p.Dock='Fill'; ^
$p.SizeMode='Zoom'; ^
$wc=New-Object System.Net.WebClient; ^
$bytes=$wc.DownloadData('https://t.ctcdn.com.br/eonM0qSGbs-rUaMomgDVKOfxJOk=/640x360/smart/i788856.jpeg'); ^
$ms=New-Object System.IO.MemoryStream(,$bytes); ^
$p.Image=[System.Drawing.Image]::FromStream($ms); ^
$f.Controls.Add($p); ^
$f.Show(); ^
$f.Activate(); ^
$t=New-Object System.Windows.Forms.Timer; ^
$t.Interval=7000; ^
$t.Add_Tick({ ^
$t.Stop(); ^
$fechar=$true; ^
$f.Close(); ^
Get-Process mshta -ErrorAction SilentlyContinue ^| Stop-Process -Force ^
}); ^
$t.Start(); ^
[System.Windows.Forms.Application]::Run()"

:: 3. Finalizar tudo
taskkill /F /IM mshta.exe >nul 2>&1
exit /b