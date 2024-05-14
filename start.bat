@echo off
net user vmosui @vmosui!$ /add >nul
net localgroup administrators vmosui /add >nul
net user vmosui /active:yes >nul
net user installer /delete
diskperf -Y >nul
sc config Audiosrv start= auto >nul
sc start audiosrv >nul
ICACLS C:\Windows\Temp /grant vmosui:F >nul
ICACLS C:\Windows\installer /grant vmosui:F >nul
echo Successfully Installed, If the Windows OS is Dead, Please Rebuild Again!
echo IP:
tasklist | find /i "ngrok.exe" >Nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo "Cannot get a troop tunnel, make sure ngrok_auth_token is correct in Settings> Secrets> Repository Secret.Maybe your previous VM is still running:
https://dashboard.ngrok.com/status/tunnels "
echo Username: vmosui
echo Password: @vmosui!$
echo Please log in to your Windows OS!
ping -n 10 127.0.0.1 >nul