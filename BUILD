#!/bin/bash
# "BONBON'S DYNAMIC BUSYBOX BUILDER"
#Made by _Bon_Bon(@XDA)
#All parts of this SCRIPT and all the code in it
#are protected by GNU GPL, version 3
#Copyright (C) 2016 Francisco Pulido Garces (_Bon_Bon)
#see <http://www.gnu.org/licenses/> for details
#TO-DO
#	Clean up the code
#  Make the ERROR function return proper codes
#
#Delete next comment to enable debuging
#set -x
STARTDIR=$PWD
#-- Set the Cross-Compilers to PATH variable
PATH=$PATH:$STARTDIR/Busybox_Compilers/armv4tl/bin
PATH=$PATH:$STARTDIR/Busybox_Compilers/i686/bin
PATH=$PATH:$STARTDIR/Busybox_Compilers/mips/bin
#-- Process build directories
if [ -z "$STABLEDIR" ]; then
	STABLEDIR=./Busybox_Sources/Stable
fi
if [ -z "$SNAPDIR" ]; then
	SNAPDIR=./Busybox_Sources/Snapshot
fi
#-- Snapshot builder function thingy
snapshot () {
	#-- If no Compilers given default to all of them
	if [ -z ${ARC[@]} ]; then
		ARC=("mips" "i686" "armv4tl")
	fi
	echo -e "\n| GETTING LATEST SNAPSHOT SOURCE |\n"
	wget https://busybox.net/downloads/snapshots/busybox-snapshot.tar.bz2 || echo "Download failed, make sure you have root privilages and have an internet connection" && exit 1
	tar xjvf busybox-snapshot.tar.bz2.tar.bz2
	mv ./busybox ${STARTDIR}/${SNAPDIR}
	rm -f busybox-snapshot.tar.bz2
	cp ${STARTDIR}/configs/${BUILDS}config ${STARTDIR}/${STABLEDIR}/.config
	for ARCS in ${ARC[@]}; do
		echo -e "\n
		| BUILDING SNAPSHOT FOR $ARCS |
		\n"
		make CROSS_COMPILE=${ARCS}-
		if [ -e ${STARTDIR}/Busybox_Binaries/Busybox_${BUILDS}_${ARCS} ]; then
			rm -f ${STARTDIR}/Busybox_Binaries/Busybox_${BUILDS}_${ARCS}
		fi
		mv ${STARTDIR}/${SNAPDIR}/busybox ${STARTDIR}/Busybox_Binaries/Busybox_${BUILDS}_${ARCS}
	done
	echo ""
}
#-- Get the parrameters
for PAR in $@; do
	case $PAR in
		--mips) ARC[$(((${#ARC[@]})+1))]="mips";;
		--x86) ARC[$(((${#ARC[@]})+1))]="i686";;
		--arm) ARC[$(((${#ARC[@]})+1))]="armv4tl";;
		--custom=*) ARC[$(((${#ARC[@]})+1))]="$(echo $PAR | awk -F= '{print $2}')";;
		--full) BUILD[$(((${#BUILD[@]})+1))]="full";;
		--modular) BUILD[$(((${#BUILD[@]})+1))]="modular";;
		--minimal) BUILD[$(((${#BUILD[@]})+1))]="minimal";;
		--buinst) BUILD[$(((${#BUILD[@]})+1))]="buin";;
		--snapshot) BUILD[$(((${#BUILD[@]})+1))]="snapshot";;
		--all) ARC=("mips" "i686" "armv4tl"); BUILD=("full" "modular" "minimal" "snapshot");;
		*) echo "ERROR: Parameter not valid"; exit;;
	esac
done
#-- If no Compilers given default to all of them
if [ -z ${ARC[@]} ]; then
	ARC=("mips" "i686" "armv4tl")
fi
#-- Process the parameters and build the binaries
cd ${STARTDIR}/${STABLEDIR}
for BUILDS in ${BUILD[@]}; do
	if [ $BUILDS = "snapshot" ]; then
	
	else
		cp ${STARTDIR}/configs/${BUILDS}config ${STARTDIR}/${STABLEDIR}/.config
	fi
	for ARCS in ${ARC[@]}; do
		echo -e "\n
		| BUILDING $BUILDS FOR $ARCS |
		\n"
		make CROSS_COMPILE=${ARCS}-
		if [ -e ${STARTDIR}/Busybox_Binaries/Busybox_${BUILDS}_${ARCS} ]; then
			rm -f ${STARTDIR}/Busybox_Binaries/Busybox_${BUILDS}_${ARCS}
		fi
		mv ${STARTDIR}/${STABLEDIR}/busybox ${STARTDIR}/Busybox_Binaries/Busybox_${BUILDS}_${ARCS}
	done
done
#-- Prepare the installers
echo -e "\n
		| BUILDING DYNAMIC INSTALLERS |
		\n"
cp ${STARTDIR}/configs/buinconfig ${STARTDIR}/${STABLEDIR}/.config
for ARCS in ${ARC[@]}; do
	make CROSS_COMPILE=${ARCS}-
	mv ${STARTDIR}/${STABLEDIR}/busybox ${STARTDIR}/Busybox_Installers/Installer_Busybox
	if [ -e ${STARTDIR}/Busybox_Installers/Installer_${ARCS}.zip ]; then
		rm -f ${STARTDIR}/Busybox_Installers/Installer_${ARCS}.zip
	fi
	zip ${STARTDIR}/Busybox_Installers/Installer_${ARCS}.zip ${STARTDIR}/Busybox_Installers/Installer_Busybox ${STARTDIR}/Busybox_Installers/Installer
	rm -f ${STARTDIR}/Busybox_Installers/Installer_Busybox
done
#-- Done!
echo -e "\n
		| DONE |
		\n"
exit 0
