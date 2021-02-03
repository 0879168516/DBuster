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
    echo -e "============================================================================"
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
    echo -e "\e[032;1mServer IP:\e[0m $MYIP"
	echo -e "============================================================================"
	echo -e "                    \e[1;35;60mM Fauzan Romandhoni\e[0m | \e[1;35;60mSSHINJECTOR.NET\e[0m"
    date +"                             %A, %d-%m-%Y     " 
    date +"                                %H:%M:%S %Z          "
	echo -e "============================================================================"
    echo -e " Apa Yang Ingin Anda Lakukan \e[033;1mAdmin\e[0m...???"
    echo -e "----------------------------------------"
    echo -e "   \e[034;1m1\e[0m) \e[031;1mSeputar SSH & OpenVPN\e[0m"
    echo -e "   \e[034;1m2\e[0m) \e[031;1mSeputar PPTP VPN\e[0m"
    echo -e "   \e[034;1m3\e[0m) \e[031;1mL2TP IPsec VPN\e[0m"
    echo -e "   \e[034;1m4\e[0m) \e[031;1mSeputar SSTP VPN\e[0m"
    echo -e "   \e[034;1m5\e[0m) \e[031;1mSeputar Shadowsocks VPN\e[0m"
    echo -e "   \e[034;1m6\e[0m) \e[031;1mSeputar ShadowsocksR VPN\e[0m"
    echo -e "   \e[034;1m7\e[0m) \e[031;1mSeputar Trojan VPN\e[0m"
    echo -e "   \e[034;1m8\e[0m) \e[031;1mSeputar Wireguard VPN\e[0m"
    echo -e "   \e[034;1m9\e[0m) \e[031;1mSeputar V2Ray/Vmess VPN\e[0m"
    echo -e "  \e[034;1m10\e[0m) \e[031;1mGanti Password VPS\e[0m"
    echo -e "  \e[034;1m11\e[0m) \e[031;1mEdit Banner Login\e[0m"
    echo -e "  \e[034;1m12\e[0m) \e[031;1mSpeedtest Server\e[0m"
    echo -e "  \e[034;1m13\e[0m) \e[031;1mBenchmark\e[0m"
    echo -e "  \e[034;1m14\e[0m) \e[031;1mPenggunaan Ram\e[0m"
    echo -e "  \e[034;1m15\e[0m) \e[031;1mHapus Chahce Ram Manual\e[0m"
    echo -e "  \e[034;1m16\e[0m) \e[031;1mCheck Online Port\e[0m"
    echo -e "  \e[034;1m17\e[0m) \e[031;1mCheck Healthy Server\e[0m"
    echo -e "  \e[034;1m18\e[0m) \e[031;1mAbout Auto Script\e[0m"
    echo -e "  \e[034;1m19\e[0m) \e[031;1mReboot VPS\e[0m"
    echo ""
    echo -e "    \e[034;1mx\e[0m) Exit"
    read -p "Masukkan pilihan anda, kemudian tekan tombol ENTER: " option1
  case $option1 in
  1)
  clear
  menu-ssh
  ;;
  2)
  clear
  menu-pptp
  ;;
  3)
  clear
  menu-l2tp
  ;;
  4)
  clear
  menu-sstp
  ;;
  5)
  clear
  menu-ss
  ;;
  6)
  clear
  menu-ssr
  ;;
  7)
  clear
  menu-tr
  ;;
  8)
  clear
  menu-wg
  ;;
  9)
  clear
  menu-vmess
  ;;
  10)
  clear
  read -p "Silahkan isi password baru untuk VPS anda: " pass
  echo "root:$pass" | chpasswd
  ;;
  11)
  clear
  edit-banner
  service ssh restart && service ropbear restart
  ;;
  12)
  clear
  speedtest --share
  13)
  clear
  benchmark
  ;;
  14)
  clear
  ps-mem
  ;;
  15)
  clear
  echo "Sebelum..." | lolcat
  free -h
  echo 1 > /proc/sys/vm/drop_caches
  sleep 1
  echo 2 > /proc/sys/vm/drop_caches
  sleep 1
  echo 3 > /proc/sys/vm/drop_caches && swapoff -a && swapon -a
  sleep 1
  echo ""
  echo "Sesudah..." | lolcat
  free -h
  echo "SUKSES..!!!Cache ram anda sudah di bersihkan."
  ;;
  16)
  clear
  opensshport="$(netstat -ntlp | grep -i ssh | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
  dropbearport="$(netstat -nlpt | grep -i dropbear | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
  stunnel4port="$(netstat -nlpt | grep -i stunnel | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
  openvpnport="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
  squidport="$(cat /etc/squid/squid.conf | grep -i http_port | awk '{print $2}')"
  echo -e ""
  echo -e "=================================================="
  echo -e ""
  echo -e "         Port OpenSSH   :  "$opensshport
  echo -e "         Port Dropbear  :  "$dropbearport
  echo -e "         Port SSL       :  "$stunnel4port
  echo -e "         Port OpenVPN   :  "$openvpnport
  echo -e "         Port Squid     :  "$squidport
  echo -e ""
  echo -e "=================================================="
  ;;
  17
  clear
  health
  ;;
  18
  clear
  about
  ;;
  19
  clear
  reboot
  ;;
  x)
  bash
  ;;
  *) menu;;
  esac
