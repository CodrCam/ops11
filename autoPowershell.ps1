#Script: Ops 201 Class 11 Ops Challenge Solution
#Author: Cameron Griffin
#Date of latest revision: 11-21-2022
#Purpose: A Powershell that automates Ping hits, Printer Sharing, Enable ICMP, Remote Manage, Remove Bloatware, Enable Hyper-V, Toggle SMBv1
# Google Doc: https://docs.google.com/document/d/1UKTJe_1x2XBdJgBwcbzdAeRatPc0K3HNJCqDOEoD-cM/edit?usp=sharing

#Code Copied from https://github.com/superswan/Powershell-SysAdmin

#ping listens
"Pong Command" - Listen for Pings. Uses WinDump.exe
.\WinDump.exe -i 3 icmp and icmp[icmp-echoreply]=icmp-echo

#Enable File and Printer Sharing
Set-NetFirewallRule -DisplayGroup "File And Printer Sharing" -Enabled True

#Enable ICMP
netsh advfirewall firewall add rule name="Allow incoming ping requests IPv4" dir=in action=allow protocol=icmpv4

#Remote Manage
#RDP
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f

#Bloatware Remover
iex ((New-Object System.Net.WebClient).DownloadString('https://git.io/debloat'))

#Enable Hyper-V
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All

#Toggle SMBv1
Set-SmbServerConfiguration -EnableSMB1Protocol $false -Force
