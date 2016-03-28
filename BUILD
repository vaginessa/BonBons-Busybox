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
#	Replace startdirs with ./
#
#-- Get current dir into a variable
STARTDIR=$PWD
#-- Process build directories
if [ -z "$STABLEDIR" ]; then
	STABLEDIR=./Busybox_Sources/Stable_*
fi
if [ -z "$SNAPDIR" ]; then
	SNAPDIR=./Busybox_Sources/Snapshot
fi
#-- Set necessary variables
IGNORE_INSTALLER="false"
CREATE_DETAILS="false"
DATE=$(date +%y%m%d)
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
		;;
		--all)	#-- Compile all builds with all default compilers
			ARC=("mips" "i686" "armv4tl"); BUILD=("full" "modular" "minimalistic" "snapshot")
		;;
		--ignore-installer)	#-- Disables AROMA installer building
			IGNORE_INSTALLER="true"
		;;
		--build-details)	#-- Creates BonBons_Busybox_Details.txt file
			CREATE_DETAILS="true"
		;;
		*)	#-- Report an error: Non recognized parameter
			ERROR "At $PAR" "parameter not recognized"
		;;
	esac
done
#-- If no Compilers given default to all of them
[ -z ${ARC[@]} ] && ARC=("mips" "i686" "armv4tl")
#-- If no builds in buildlist ERROR
[ -z ${BUILD[@]} ] && ERROR "At buildlist" "no build parameters given"
#-- Process the parameters and build the binaries
cd ${STARTDIR}/${STABLEDIR}
for BUILDS in ${BUILD[@]}; do
	if [ $BUILDS = "snapshot" ]; then
		#-- Download snapshot source
		echo -e "\n| GETTING LATEST SNAPSHOT SOURCE |\n"
		wget https://busybox.net/downloads/snapshots/busybox-snapshot.tar.bz2 || echo "Download failed, make sure you have root privilages and have an internet connection" && exit 1
		tar xjvf busybox-snapshot.tar.bz2
		mv ./busybox ${STARTDIR}/${SNAPDIR}
		rm -f busybox-snapshot.tar.bz2
		cp ${STARTDIR}/configs/modularconfig ${STARTDIR}/${SNAPDIR}/.config
	else
		cp ${STARTDIR}/configs/${BUILDS}config ${STARTDIR}/${STABLEDIR}/.config
	fi
	for ARCS in ${ARC[@]}; do
		echo -e "\n| BUILDING $BUILDS FOR $ARCS |\n"
		#-- Decompress needed Cross-Compilers and set them into the PATH variable
		rm -fr ${STARTDIR}/cross-compiler-${COMPILER}
		tar -xzvf ${STARTDIR}/BonBons-Busybox/Busybox_Compilers/${COMPILER}.tar.gz
		PATH=$PATH:${STARTDIR}/cross-compiler-${COMPILER}/bin
		#-- Build the binary
		make CROSS_COMPILE=${ARCS}-
		[ -e ${STARTDIR}/Busybox_Binaries/Busybox_${BUILDS}_${ARCS}* ] && rm -f ${STARTDIR}/Busybox_Binaries/Busybox_${BUILDS}_${ARCS}*
		if [ $BUILDS = "snapshot" ]; then
			mv ${STARTDIR}/${SNAPDIR}/busybox ${STARTDIR}/Busybox_Binaries/Busybox_snapshot_${ARCS}_${DATE}
		else
			mv ${STARTDIR}/${STABLEDIR}/busybox ${STARTDIR}/Busybox_Binaries/Busybox_${BUILDS}_${ARCS}_${DATE}
		fi
	done
	#-- 
done
#-- Make AROMA installer if IGNORE_INSTALLER is false
if [ "X$IGNORE_INSTALLER" = "Xfalse" ]; then
	echo -e "\n| BUILDING AROMA INSTALLER |\n"
	[ -e ${STARTDIR}/Busybox_Installers/Installer_AROMA.zip ] && rm -f ${STARTDIR}/Busybox_Installers/Installer_AROMA.zip
	cd ${STARTDIR}/Busybox_Installers/AROMA_Installer
	zip -r ${STARTDIR}/Installer_AROMA.zip /META-INF
	cd ${STARTDIR}
	zip -g ${STARTDIR}/Installer_AROMA.zip ${STARTDIR}/Busybox_Binaries
fi
#-- Create details.txt if enabled
if [ "X$CREATE_DETAILS" = "true" ]; then
	#-- Get stable source version from folder name
	STABLE_VER=$(echo $STABLEDIR | awk -F_ '{print $2}')
	echo "#-- BUILD VERSION DATE --#" > ${STARTDIR}/BonBons_Busybox_Details.txt
	echo "! INSTALLER $(${STARTDIR}/Busybox_Installers/Dynamic_Installer -v | awk '{print $2}')" >> ${STARTDIR}/BonBons_Busybox_Details.txt
	#-- Process old details.txt and update it
	if [ -e ${STARTDIR}/BonBons_Busybox_Details.txt ]; then
		for DETAILS in $(awk '{print $0}' ${STARTDIR}/BonBons_Busybox_Details.txt); do
			for BUILDS in ${BUILD[@]}; do
				[ $BUILDS = "snapshot" ] && echo "snapshot snapshot $DATE" >> ${STARTDIR}/BonBons_Busybox_Details.txt && continue
				if $(echo $DETAILS | grep "$BUILDS"); then
					echo "$BUILDS $STABLE_VER $DATE" >> ${STARTDIR}/BonBons_Busybox_Details.txt
				else
					echo "$DETAILS" >> ${STARTDIR}/BonBons_Busybox_Details.txt
				fi
			done
		done
	else	#-- No existing details.txt found, create one
		for DETAILS in full modular minimalistic snapshot; do
			for BUILDS in ${BUILD[@]}; do
				if $(echo $DETAILS | grep "$BUILDS"); then
					if [ $BUILDS = "snapshot" ]; then
						echo "snapshot snapshot $DATE" >> ${STARTDIR}/BonBons_Busybox_Details.txt
					else
						echo "$BUILDS $STABLE_VER $DATE" >> ${STARTDIR}/BonBons_Busybox_Details.txt
					fi
				else
					echo "$DETAILS 0 0" >> ${STARTDIR}/BonBons_Busybox_Details.txt
				fi
			done
		done
	fi
fi
#-- Done!
echo -e "\n| DONE |\n"
exit 0