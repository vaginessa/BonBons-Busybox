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
#	Replace startdirs with ./ ?
#
#-- Get current working dir into a variable
STARTDIR=$PWD
#-- Place parameters inside an array
PARAMETER=( $(for PAR in $@; do echo $PAR; done) )
#-- ERROR processing
ERROR () {
	echo "| ERROR |"
	echo "| BUILD ${PARAMETER[@]} |"
	echo "| $1 |"
	echo "| REASON: $2 |"
	exit 1
}
#-- Check if working directory is correct
[[ ! $STARTDIR = */BonBons-Busybox ]] && ERROR "$STARTDIR" "Wrong working directory"
#-- Process build directories
[ -z "$STABLEDIR" ] && STABLEDIR=$(echo ${STARTDIR}/Busybox_Sources/Stable_*)
[ -z "$SNAPDIR" ] && SNAPDIR=${STARTDIR}/Busybox_Sources/Snapshot
#-- Set necessary variables
DYN_VER=$($(echo ${STARTDIR}/Busybox_Installers/Dynamic_Installer_*) -v | awk '{print $2}')
OUTPUT=/dev/null
DATE=$(date +%y%m%d)
#
#	Dynamic installer name inside a variable and then the version
#	To be used with Details.txt
#
#-- Process parameters
for PAR in ${PARAMETER[*]}; do
	case $PAR in
		-d|--debug)	#-- Debugging
			set -x
		;;
		--mips|-M)	#-- Add mips to compilerlist
			ARC[$(((${#ARC[@]})+1))]="mips"
		;;
		--x86|-X)	#-- Add x86 to compilerlist
			ARC[$(((${#ARC[@]})+1))]="i686"
		;;
		--arm|-A)	#-- Add arm to compilerlist
			ARC[$(((${#ARC[@]})+1))]="armv4tl"
		;;
		--custom=*)	#-- Add a custom compier to compilerlist
			ARC[$(((${#ARC[@]})+1))]="$(echo $PAR | awk -F= '{print $2}')"
		;;
		--full|-f)	#-- Add full build to buildlist
			BUILD[$(((${#BUILD[@]})+1))]="full"
		;;
		--modular|-o)	#-- Add modular build to buildlist
			BUILD[$(((${#BUILD[@]})+1))]="modular"
		;;
		--minimal|-m)		#-- Add minimal build to buildlist
			BUILD[$(((${#BUILD[@]})+1))]="minimal"
		;;
		--snapshot|-s)	#-- Add snapshot to build list
			BUILD[$(((${#BUILD[@]})+1))]="snapshot"
			#-- Latest snapshot source will now be downloaded
			UPD_SNAP="true"
		;;
		--all)	#-- Compile all builds with all default compilers
			ARC=("mips" "i686" "armv4tl"); BUILD=("full" "modular" "minimalistic" "snapshot")
			#-- Latest snapshot source will now be downloaded
			UPD_SNAP="true"
		;;
		--silent)	#-- Disable silence
			OUTPUT=/dev/tty
		;;
		--ignore-installer)	#-- Disables AROMA installer building
			BUILD_INSTALLER="true"
		;;
		--build-details)	#-- Disables BonBons_Busybox_Details.txt file creation
			BUILD_DETAILS="true"
		;;
		*)	#-- Report an error: Non recognized parameter
			ERROR "At $PAR" "parameter not recognized"
		;;
	esac
done
#-- Download and setup snapshot source if needed
if [ "X$UPD_SNAP" = "Xtrue" ]; then
	clear
	echo "| GETTING LATEST SNAPSHOT SOURCE |"
	[ -d $SNAPDIR ] && rm -fr $SNAPDIR
	wget https://busybox.net/downloads/snapshots/busybox-snapshot.tar.bz2  >$OUTPUT || ERROR "Download failed, make sure you have right privilages and have an internet connection"
	tar xjvf busybox-snapshot.tar.bz2 >$OUTPUT
	mv ./busybox ${SNAPDIR}
	rm -f busybox-snapshot.tar.bz2
fi
#-- Decompress needed Cross-Compilers and set them into the PATH variable
for ARCS in ${ARC[@]}; do
	if [ -e ${STARTDIR}/Busybox_Compilers/${ARCS}.tar.gz ]; then
		rm -fr ${STARTDIR}/cross-compiler-${ARCS}
		tar -xzvf ${STARTDIR}/Busybox_Compilers/${ARCS}.tar.gz >$OUTPUT
		PATH=$PATH:${STARTDIR}/cross-compiler-${ARCS}/bin
	else
		echo "Desired compiler couldn't be found in ./Busybox_Compilers, disabling silent mode incase of errors"
		OUTPUT=/dev/tty
	fi
done
#-- Process the parameters and build the binaries
for BUILDS in ${BUILD[*]}; do
	for ARCS in ${ARC[*]}; do
		if [ $BUILDS = "snapshot" ]; then
			if [ ! -e ${SNAPDIR}/.config ]; then
				cp ${STARTDIR}/Busybox_Sources/configs/modularconfig ${SNAPDIR}/.config
				clear
				echo "| UPDATING OLD CONFIG FILE |"
				echo "Note, you might have to chooce if to include new features"
				sleep 4
				make oldconfig
			fi
			cd ${SNAPDIR}
		else
			cp ${STARTDIR}/Busybox_Sources/configs/${BUILDS}config ${STABLEDIR}/.config
			cd ${STABLEDIR}
		fi
		clear
		echo "| BUILDING $BUILDS FOR $ARCS |"
		#-- Build the binary
		make CROSS_COMPILE=${ARCS}- >$OUTPUT
		[ -e ${STARTDIR}/Busybox_Binaries/Busybox_${BUILDS}_${ARCS}* ] && rm -f ${STARTDIR}/Busybox_Binaries/Busybox_${BUILDS}_${ARCS}*
		if [ $BUILDS = "snapshot" ]; then
			mv ${SNAPDIR}/busybox ${STARTDIR}/Busybox_Binaries/Busybox_snapshot_${ARCS}_${DATE}
		else
			mv ${STABLEDIR}/busybox ${STARTDIR}/Busybox_Binaries/Busybox_${BUILDS}_${ARCS}_${DATE}
		fi
	done
done
#-- Make AROMA installer if BUILD_INSTALLER is true
if [ "X$BUILD_INSTALLER" = "Xtrue" ]; then
	clear
	echo -e "| BUILDING AROMA INSTALLER |"
	[ -e ${STARTDIR}/Busybox_Installers/Installer_AROMA.zip ] && rm -f ${STARTDIR}/Busybox_Installers/Installer_AROMA.zip
	cd ${STARTDIR}/Busybox_Installers/AROMA_Installer
	zip -r ${STARTDIR}/Installer_AROMA.zip ./META-INF
	cd ${STARTDIR}
	zip -gr ${STARTDIR}/Installer_AROMA.zip ./Busybox_Binaries/*
fi
#-- Create details.txt if BUILD_DETAILS is true
if [ "X$BUILD_DETAILS" = "Xtrue" ]; then
	echo -e "| CREATING UPDATED Details.txt |"
	#-- Get stable source version from folder name
	STABLE_VER=$(echo $STABLEDIR | awk -F_ '{print $2}')
	echo "#-- | BUILD | VERSION | DATE | --#" > ${STARTDIR}/BonBons_Busybox_Details.txt
	echo "! INSTALLER $DYN_VER" >> ${STARTDIR}/BonBons_Busybox_Details.txt
	#-- Process old details.txt and update it
	for DETAILS in $(awk '{print $0}' ${STARTDIR}/BonBons_Busybox_Details.txt); do
		for BUILDS in ${BUILD[*]}; do
			if [ "$BUILDS" = "snapshot" ]; then
				echo "snapshot snapshot $DATE" >> ${STARTDIR}/BonBons_Busybox_Details.txt
			elif [[ -n $(echo $DETAILS | grep "$BUILDS") || -z "$DETAILS" ]]; then
				echo "$BUILDS $STABLE_VER $DATE" >> ${STARTDIR}/BonBons_Busybox_Details.txt
			else
				echo "$DETAILS" >> ${STARTDIR}/BonBons_Busybox_Details.txt
			fi
		done
	done
fi
echo "| CLEANING UP |"
rm -fr ${SNAPDIR}
for ARCS in ${ARC[*]}; do
	[ -d ${STARTDIR}/cross-compiler-${ARCS} ] && rm -fr ${STARTDIR}/cross-compiler-${ARCS}
done
#-- Done!
echo -e "\n| DONE |\n"
exit 0