#!/bin/bash
# "BONBON'S DYNAMIC BUSYBOX BUILDER"
#Made by _Bon_Bon(@XDA)
#All parts of this SCRIPT and all the code in it
#are protected by GNU GPL, version 3
#Copyright (C) 2016 Francisco Pulido Garces (_Bon_Bon)
#see <http://www.gnu.org/licenses/> for details
#TO-DO
#	Clean up the code
#	Make the ERROR function return proper codes
#	When in debug mode don't download, build, etc. if not specifically told so
#	Shorten some commands, by movinf the dir (example: ${STARTDIR}/Busybox_Installers/BonBons_Busybox_Details.txt) into a var
#	Move from VAR to ${DESIGNATION_varname}
#	Only  clean up at the end if needed
#	Features!
#		- Add a .config updater / menuconfig thingy
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
#-- Process build directories
[ -z "$STABLEDIR" ] && STABLEDIR=$(echo ${STARTDIR}/Busybox_Sources/Stable_*)
[ -z "$SNAPDIR" ] && SNAPDIR=${STARTDIR}/Busybox_Sources/Snapshot
#-- Set necessary variables
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
			#-- Make sure that all output is directed to the console
			OUTPUT=/dev/tty
		;;
		--mips|-M)	#-- Add mips to compilerlist
			ARC+="mips"
		;;
		--x86|-X)	#-- Add x86 to compilerlist
			ARC+="i686"
		;;
		--arm|-A)	#-- Add arm to compilerlist
			ARC+="armv4tl"
		;;
		--custom=*)	#-- Add a custom compier to compilerlist
			ARC+="$(echo $PAR | awk -F= '{print $2}')"
		;;
		--full|-f)	#-- Add full build to buildlist
			BUILD+="full"
		;;
		--modular|-o)	#-- Add modular build to buildlist
			BUILD+="modular"
		;;
		--minimal|-m)		#-- Add minimal build to buildlist
			BUILD+="minimal"
		;;
		--snapshot|-s)	#-- Add snapshot to build list
			BUILD+="snapshot"
			#-- Latest snapshot source will now be downloaded
			UPD_SNAP="true"
		;;
		--all)	#-- Compile all builds with all default compilers
			ARC=("mips" "i686" "armv4tl"); BUILD=("full" "modular" "minimalistic" "snapshot")
			#-- Latest snapshot source will now be downloaded
			UPD_SNAP="true"
		;;
		--build-installer)	#-- Enables static installer building
			BUILD_INSTALLER="true"
		;;
		--build-details)	#-- Enables BonBons_Busybox_Details.txt file creation
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
	wget https://busybox.net/downloads/snapshots/busybox-snapshot.tar.bz2 || ERROR "Download failed, make sure you have an internet connection"
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
	fi
done
#-- Process the parameters and build the binaries
for BUILDS in ${BUILD[*]}; do
	for ARCS in ${ARC[*]}; do
		if [ $BUILDS = "snapshot" ]; then
			if [ ! -e ${SNAPDIR}/.config ]; then
				cp ${STARTDIR}/Busybox_Sources/configs/modularconfig ${SNAPDIR}/.config
				clear
				echo "| UPDATING OLD CONFIG FILE FOR SNAPSHOT |"
				echo "Note, you might have to chooce if to include new features"
				echo "And everything might not work"
				read -n 1 -p "Press somekey to continue"
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
		make CROSS_COMPILE=${ARCS}-
		[ -e ${STARTDIR}/Busybox_Binaries/Busybox_${BUILDS}_${ARCS}* ] && rm -f ${STARTDIR}/Busybox_Binaries/Busybox_${BUILDS}_${ARCS}*
		if [ $BUILDS = "snapshot" ]; then
			mv ${SNAPDIR}/busybox ${STARTDIR}/Busybox_Binaries/Busybox_snapshot_${ARCS}_${DATE}
		else
			mv ${STABLEDIR}/busybox ${STARTDIR}/Busybox_Binaries/Busybox_${BUILDS}_${ARCS}_${DATE}
		fi
	done
done
#-- Make STATIC installer if BUILD_INSTALLER is true
if [ "X$BUILD_INSTALLER" = "Xtrue" ]; then
	clear
	echo -e "| BUILDING INSTALLERS |"
	for FILE in full modular minimalistic snapshot; do
		[ -e ${STARTDIR}/Busybox_Installers/Installer_${FILE}.zip ] && rm -f ${STARTDIR}/Busybox_Installers/Installer_${FILE}.zip
		#-- Zip the META-INF folder
		cd ${STARTDIR}/Busybox_Installers/Static_Installer
		zip -r ${STARTDIR}/Busybox_Installers/Installer_${FILE}.zip ./META-INF
		cd ${STARTDIR}/Busybox_Binaries/
		#-- (Maybe) this could be done better
		for FILES in armv4tl:arm i686:x86 mips:mips; do
			NAME[1]=$(echo $FILES | awk -F: '{print $1}')
			NAME[2]=$(echo $FILES | awk -F: '{print $2}')
			NAME[3]=$(echo ${STARTDIR}/Busybox_Binaries/Busybox_${FILE}_${NAME[1]}_*)	#-- Get zip filename into a variable
			NAME[4]=busybox_${NAME[2]}	#-- Get the correct file name into a variable
			mv ${NAME[3]} ${STARTDIR}/Busybox_Binaries/${NAME[4]}
			zip -g ${STARTDIR}/Busybox_Installers/Installer_${FILE}.zip ${NAME[4]}	#-- Include the file into the zip
			mv ${STARTDIR}/Busybox_Binaries/${NAME[4]} ${NAME[3]}
		done
	done
fi
#-- Create details.txt if BUILD_DETAILS is true
if [ "X$BUILD_DETAILS" = "Xtrue" ]; then
	echo -e "| CREATING UPDATED Details.txt |"
	echo "You'll see what the file contains bellow"
	echo "#-- | BUILD | ARC | VERSION | DATE | --#"  | tee ${STARTDIR}/Busybox_Installers/BonBons_Busybox_Details.txt
	#-- Get dynamic installer version
	DYN_VER=$(echo ${STARTDIR}/Busybox_Installers/Dynamic_Installer_* | awk -F_ '{print $2}')
	echo "! INSTALLER $DYN_VER" | tee -a ${STARTDIR}/Busybox_Installers/BonBons_Busybox_Details.txt
	#-- Process binaries from /Busybox_Binaries and update the  details.txt
	for FILE in $(ls ${STARTDIR}/Busybox_Binaries); do
		if [[ "${FILE}" =~ "Busybox_" ]]; then	#-- Check if the file is a busybox binary, if not, skip it
			#-- Get BUILD, ARC and DATE from the file name
			#-- New variable format, rest of the variables will be converted to follow this >at some point< :P
			DE_build=$(echo ${FILE} | awk -F_ '{print $2}' )
			DE_arc=$(echo ${FILE} | awk -F_ '{print $3}' )
			DE_date=$(echo ${FILE} | awk -F_ '{print $4}' )
			#-- Determine the version
			if [ "${DE_build}" = "snapshot" ]; then
				#-- Binary is a snapshot build, mark it as one
				DE_version="snapshot"
			else
				#-- Binary is a stable build, get stable source version from folder name
				DE_version=$(echo $STABLEDIR | awk -F_ '{print $3}')
			fi
			#-- Write the info into the details.txt
			echo "${DE_build} ${DE_arc} ${DE_version} ${DE_date}" | tee -a ${STARTDIR}/Busybox_Installers/BonBons_Busybox_Details.txt
		else
			echo "File: ${FILE} is not a busybox binary, skipping it"
		fi
	done
	echo "| DONE! See the updated details above |"
	read -n 1 -p "Press somekey to continue"
fi
#-- Clean up after yourself!
echo "| CLEANING UP |"
rm -fr ${SNAPDIR}
for ARCS in ${ARC[*]}; do
	[ -d ${STARTDIR}/cross-compiler-${ARCS} ] && rm -fr ${STARTDIR}/cross-compiler-${ARCS}
done
#-- Done!
echo -e "\n| DONE |\n"
exit 0