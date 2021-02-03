#!/bin/bash
# Created By M Fauzan Romandhoni 
# Sshinjector.net
# For Bussines E-Mail: m.fauzan58@yahoo.com
# TELP/WA : +6283875176829

clear

MYIP=$(wget -qO- ipv4.icanhazip.com);
MYIP2="s/xxxxxxxxx/$MYIP/g";

	clear 
  echo "" 
  echo ""
  echo "<=------------- Selamat Datang di Server - IP: $MYIP -------------=>" | lolcat
  echo "<============================================================================>" | lolcat
	cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
	cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	tram=$( free -m | awk 'NR==2 {print $2}' )
	swap=$( free -m | awk 'NR==4 {print $2}' )
	up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')

	echo -e "\e[032;1mCPU model:\e[0m $cname"
	echo -e "\e[032;1mNumber of cores:\e[0m $cores"
	echo -e "\e[032;1mCPU frequency:\e[0m $freq MHz"
	echo -e "\e[032;1mTotal amount of ram:\e[0m $tram MB"
	echo -e "\e[032;1mTotal amount of swap:\e[0m $swap MB"
	echo -e "\e[032;1mSystem uptime:\e[0m $up"
	echo "<============================================================================>" | lolcat
	echo -e "                    \e[1;35;60mM Fauzan Romandhoni\e[0m | \e[1;35;60mSSHINJECTOR.NET\e[0m"
	date +"                             %A, %d-%m-%Y     " 
  date +"                                %H:%M:%S %Z          "
	echo "<============================================================================>" | lolcat
  PS3='Silahkan ketik nomor pilihan anda lalu tekan ENTER: '
  options=("Seputar SSH & OpenVPN" "Seputar PPTP VPN" "Seputar L2TP/IPsec VPN" "Seputar SSTP VPN" "Seputar Shadowsocks VPN" " Seputar ShadowsocksR VPN" "Seputar Trojan VPN" "Seputar Wireguard VPN" "Seputar V2Ray/Vmess" "Ganti Password VPS" "Edit Banner Login" "Speedtest Server" "Benchmark" "Penggunaan RAM" "Bersihkan Cache RAM" "Cek Online Port" "Cek Healthy Server" "About Script" "Reboot Server" "Quit")
  select opt in "${options[@]}"
  do
    case $opt in
     "Seputar SSH & OpenVPN")
     "Seputar PPTP VPN")
     "Seputar L2TP/IPsec VPN")
     "Seputar SSTP VPN")
     "Seputar Shadowsocks VPN")
     "Seputar ShadowsocksR VPN")
     "Seputar Trojan VPN")
     "Seputar Wireguard VPN")
     "Seputar V2Ray/Vmess VPN")
     "Ganti Password VPS")
     "Ganti Banner Login")
     "Speedtest Server")
     "Benchmark")
     "Penggunaan RAM")
     "Bersihkan Cache RAM")
     "Cek Online Port")
     "Cek Healthy Server")
     "Abou Script")
     "Reboot VPS")
     "Quit")
     break
     ;;
     *) menu;
	esac
done
