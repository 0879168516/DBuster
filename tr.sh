#!/usr/bin/env bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

sh_ver=1.0.1
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[informasi]${Font_color_suffix}"
Error="${Red_font_prefix}[kesalahan]${Font_color_suffix}"
Tip="${Green_font_prefix}[catatan]${Font_color_suffix}"
set -euo pipefail

Install_tj(){

	function prompt() {
    while true; do
        read -p "$1 [y/N] " yn
        case $yn in
            [Yy] ) return 0;;
            [Nn]|"" ) return 1;;
        esac
    done
	}

if [[ $(id -u) != 0 ]]; then
    echo Please run this script as root.
    exit 1
fi

if [[ $(uname -m 2> /dev/null) != x86_64 ]]; then
    echo Please run this script on x86_64 machine.
    exit 1
fi

NAME=trojan
VERSION=$(curl -fsSL https://api.github.com/repos/trojan-gfw/trojan/releases/latest | grep tag_name | sed -E 's/.*"v(.*)".*/\1/')
TARBALL="$NAME-$VERSION-linux-amd64.tar.xz"
DOWNLOADURL="https://github.com/trojan-gfw/$NAME/releases/download/v$VERSION/$TARBALL"
TMPDIR="$(mktemp -d)"
INSTALLPREFIX=/usr/local
SYSTEMDPREFIX=/etc/systemd/system

BINARYPATH="$INSTALLPREFIX/bin/$NAME"
CONFIGPATH="$INSTALLPREFIX/etc/$NAME/default.json"
SYSTEMDPATH="$SYSTEMDPREFIX/$NAME@.service"

echo Entering temp directory $TMPDIR...
cd "$TMPDIR"

echo Downloading $NAME $VERSION...
curl -LO --progress-bar "$DOWNLOADURL" || wget -q --show-progress "$DOWNLOADURL"

echo Unpacking $NAME $VERSION...
tar xf "$TARBALL"
cd "$NAME"

echo Installing $NAME $VERSION to $BINARYPATH...
install -Dm755 "$NAME" "$BINARYPATH"

echo Installing $NAME server config to $CONFIGPATH...
if ! [[ -f "$CONFIGPATH" ]] || prompt "Timpa konfigurasi asli？ $CONFIGPATH"; then
    install -Dm644 examples/server.json-example "$CONFIGPATH"
else
    echo Skipping installing $NAME server config...
fi

`rm -rf /usr/lib/systemd/trojan@.service`
`wget -N  --no-check-certificate https://raw.githubusercontent.com/SNSLogty/Tunnel-backup/master/Trojan-cpp/trojan@.service  && chmod -R 777 trojan@.service && mv trojan@.service /usr/lib/systemd/system`

echo Reloading systemd daemon...
systemctl daemon-reload
 

echo Deleting temp directory $TMPDIR...
rm -rf "$TMPDIR"

echo Done!
}

Uninstall_ct(){
             `rm -rf /usr/local/bin/trojan`
             `rm -rf /usr/lib/systemd/trojan@.service`
             `rm -rf /usr/local/etc/trojan`
             
             echo "${Red_font_prefix} tj berhasil menghapus ${Font_color_suffix}"
}



echo && echo -e "  Sccript manajemen satu-klik trojan ${Red_font_prefix}[v${sh_ver}]${Font_color_suffix}
  ---- CLIENT BY sncat    ----
  ---- 2020/6-------------
  
 ${Green_font_prefix}1.${Font_color_suffix} Instal / perbarui trojan
 ${Green_font_prefix}2.${Font_color_suffix} Hapus instalan trojan sepenuhnya, termasuk file konfigurasi
————————————
 ${Green_font_prefix}3.${Font_color_suffix} Siapkan terminal transfer trojan [tidak tertulis]
 ${Green_font_prefix}4.${Font_color_suffix} Siapkan klien trojan [tidak tertulis]
————————————" && echo
read -e -p " Harap masukkan angka [1-7]:" num
case "$num" in
	1)
	Install_tj
	;;
	2)
	Uninstall_ct
	;;
	3)
	openfile_rr
	;;
	4)
	openfile_rr1
	;;	
	*)
	echo "Harap masukkan nomor yang benar [1-5]"
	;;
esac

