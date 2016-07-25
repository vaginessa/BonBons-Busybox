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
#	When in debug mode don't download, build, etc. if not specifically told so ?
#	Shorten some commands, by moving the dir (example: ${STARTDIR}/Busybox_Installers/BonBons_Busybox_Details.txt) into a var
#	Move from VAR to ${DESIGNATION_varname} (PRE & BUILD & POST and some others too)
# Make the variable names understandable
#	Build installers: only build the installer if atleast one binary exists
# Make sure the folder where BUILD is has the correct structure (Make it an option?)
# Allow BUILD to be directed to some dir, so it can be ran from other locations as well (--dir=/some/path/to/source)
# Don't hard code anything and seriously clean up the code, it's hard to understand and ugly
# Start using the OUTPUT variable !!!
# Add support for the Unstable dir !!!
#	If make errors, handle it
#	Features!
#		- Add a .config updater / menuconfig thingy
#		- When updating old config on snapshot have an option to say y or n to all of them
#
#-- Set script name and all arguments into variables
PRE_script=${0##*/}
PRE_arguments[0]=${@}
#PRE_whole_dir${0}
#PRE_parent_dir=${0%/*}
#-- Get current working dir into a variable
BUILD_dir[START]=${PWD}
#-- Set default output to silent
BUILD_output=/dev/null
#-- Set build date
BUILD_date=$(date +%y%m%d)
#-- Reserve first value of build arrays for later use
BUILD_compilers[0]="dummy"
BUILD_config[0]="dummy"
#-- ERROR processing (needs to be improved)
ERROR () {
	echo "| ERROR |"
	echo "| ${PRE_script} ${@} |"
	echo "| ${1} |"
	echo "| REASON: ${2} |"
	exit 1
}
#-- Process parameters
for PRE_arguments[1] in ${@}; do
	case ${PRE_arguments[1]} in
		-d|--debug)	#-- Debugging
			set -x
			#-- Make sure that all output is directed to the console
			OUTPUT=/dev/tty
		;;
		--mips)	#-- Add mips to compilerlist
			BUILD_compilers[${#BUILD_compilers[*]}]="mips"
		;;
		--mips64)	#-- Add mips to compilerlist
			BUILD_compilers[${#BUILD_compilers[*]}]="mips64"
		;;
		--x86)	#-- Add i686 to compilerlist
			BUILD_compilers[${#BUILD_compilers[*]}]="i686"
		;;
		--x86_64)	#-- Add x86_64 to compilerlist
			BUILD_compilers[${#BUILD_compilers[*]}]="x86_64"
		;;
		--arm)	#-- Add arm to compilerlist
			BUILD_compilers[${#BUILD_compilers[*]}]="armv4tl"
		;;
		--custom=*)	#-- Add a custom compier to compilerlist
			BUILD_compilers[${#BUILD_compilers[*]}]="$(echo $PAR | awk -F= '{print $2}')"
		;;
		--full|-f)	#-- Add full build to buildlist
			BUILD_config[${#BUILD_config[*]}]="full"
		;;
		--modular|-o)	#-- Add modular build to buildlist
			BUILD_config[${#BUILD_config[*]}]="modular"
		;;
		--minimal|-m)		#-- Add minimalistic build to buildlist
			BUILD_config[${#BUILD_config[*]}]="minimalistic"
		;;
		--snapshot|-s)	#-- Add snapshot to build list
			BUILD_config[${#BUILD_config[*]}]="snapshot"
		;;
		--all)	#-- Compile all builds with all default compilers
			BUILD_compilers=("mips" "mips64" "i686" "armv4tl" "x86_64")
			BUILD_config=("full" "modular" "minimalistic" "snapshot")
		;;
		--build-installer)	#-- Enables static installer building
			BUILD_installer="true"
		;;
		--build-details)	#-- Enables Dynamic_Details.txt file creation
			BUILD_details="true"
		;;
		--stable-build=*)	#-- Change the default STABLE build directory
			BUILD_dir[STABLE]="$(echo ${PRE_arguments} | awk -F= '{print $2}')"
		;;
		--unstable-build=*)	#-- Change the default UNSTABLE build directory
			BUILD_dir[UNSTABLE]="$(echo ${PRE_arguments} | awk -F= '{print $2}')"
		;;
		--snapshot-build=*)	#-- Change the default SNAPSHOT build directory
			BUILD_dir[SNAPSHOT]="$(echo ${PRE_arguments} | awk -F= '{print $2}')"
		;;
		*)	#-- Report an error: Non recognized parameter
			ERROR "At ${PRE_arguments}" "parameter not recognized"
		;;
	esac
done
#-- Process build directories (Make this a function?)
[ -z "${BUILD_dir[STABLE]}" ] && BUILD_dir[STABLE]=$(echo ${BUILD_dir[START]}/Busybox_Sources/Stable_*)
[ -z "${BUILD_dir[UNSTABLE]}" ] && BUILD_dir[UNSTABLE]=$(echo ${BUILD_dir[START]}/Busybox_Sources/Unstable_*)
[ -z "${BUILD_dir[SNAPSHOT]}" ] && BUILD_dir[SNAPSHOT]=${BUILD_dir[START]}/Busybox_Sources/Snapshot
#-- Go trough all build configs
for BUILD_config in ${BUILD_config[*]}; do
	case ${BUILD_config} in
		full|modular|minimalistic)
			#-- Copy the appropriate config to stable dir
			cp ${BUILD_dir[START]}/Busybox_Sources/configs/${BUILD_config}config ${BUILD_dir[STABLE]}/.config
			cd ${BUILD_dir[STABLE]}
		;;
		snapshot)
			#-- Download and setup snapshot source if needed
			if [ ! -e busybox-snapshot.tar.bz2 ]; then
				clear
				echo "| GETTING LATEST SNAPSHOT SOURCE |"
				[ -d ${BUILD_dir[SNAPSHOT]} ] && rm -fr ${BUILD_dir[SNAPSHOT]}
				wget https://busybox.net/downloads/snapshots/busybox-snapshot.tar.bz2 || ERROR "Download failed, make sure you have an internet connection"
				tar xjvf busybox-snapshot.tar.bz2 >${OUTPUT}
				mv ./busybox ${BUILD_dir[SNAPSHOT]}
			fi
			#-- Copy modularconfig to snapshot dir
			if [ ! -e ${BUILD_dir[SNAPSHOT]}/.config ]; then
				cp ${BUILD_dir[START]}/Busybox_Sources/configs/modularconfig ${BUILD_dir[SNAPSHOT]}/.config
				clear
				echo "| UPDATING OLD CONFIG FILE FOR SNAPSHOT |"
				echo "Note, you might have to chooce if to include new features"
				echo "Aaaaand stuff might not work"
				read -n 1 -p "Press somekey to continue"
				make oldconfig
			fi
			cd ${BUILD_dir[SNAPSHOT]}
		;;
		*)	#-- It's the dummy value or some other error, skip it
		;;
	esac
	#-- Go trough all compilers and build the binaries
	for BUILD_compilers in ${BUILD_compilers[*]}; do
		clear
		echo "| BUILDING ${BUILD_config} FOR ${BUILD_compilers} |"
		#-- If the compiler hasn't been setup yet, do it
		if [ -e ${BUILD_dir[START]}/Busybox_Compilers/${BUILD_compilers}.tar.gz && ! -e ${BUILD_dir[START]}/cross-compiler${BUILD_compilers} ]; then
			tar -xzvf ${BUILD_dir[START]}/Busybox_Compilers/${BUILD_compilers}.tar.gz >$OUTPUT
			PATH=${BUILD_dir[START]}/cross-compiler-${BUILD_compilers}/bin:${PATH}
		fi
		#-- Build the binary, move it and cleanup
		make -j 4 CROSS_COMPILE=${BUILD_compilers}-
		[ -e ${BUILD_dir[START]}/Busybox_Binaries/Busybox_${BUILDS}_${BUILD_compilers}* ] && rm -f ${BUILD_dir[START]}/Busybox_Binaries/Busybox_${BUILD_config}_${BUILD_compilers}*
		mv ${PWD}/busybox ${BUILD_dir[START]}/Busybox_Binaries/Busybox_${BUILD_config}_${BUILD_compilers}_${BUILD_date}
		make clean
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
		#-- Move all the binaries for compression
		if [ -e ${STARTDIR}/Busybox_Binaries/Busybox_${FILE}* ]; then
			for FILES in armv4tl i686 x86_64 mips mips64; do
				#-- Include the file into the zip
				BI_OrigName=${STARTDIR}/Busybox_Binaries/Busybox_${FILE}_${FILES}*
				mv ${BI_OrigName} ${STARTDIR}/Busybox_Binaries/Busybox_${FILES}
				zip -g ${STARTDIR}/Busybox_Installers/Installer_${FILE}.zip Busybox_${FILES}
				mv ${STARTDIR}/Busybox_Binaries/Busybox_${FILES} ${BI_OrigName}
			done
		else
			echo "| Can't find any ${FILE} binaries |"
		fi
	done
fi
#-- Create details.txt if BUILD_DETAILS is true
if [ "X$BUILD_DETAILS" = "Xtrue" ]; then
	clear
	echo -e "| CREATING UPDATED Details.txt |"
	echo -e "You'll see what the file contains bellow \n"
	echo "#-- | BUILD | ARC | VERSION | DATE | --#"  | tee ${STARTDIR}/Busybox_Installers/BonBons_Busybox_Details.txt
	#-- Get dynamic installer version
	DYN_VER=$(echo ${STARTDIR}/Busybox_Installers/DynamicInstaller_* | awk -F_ '{print $3}')
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
				DE_version=$(echo ${BUILD_dir[STABLE]} | awk -F_ '{print $3}')
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
#-- Remove the compilers and snapshot source
echo "| CLEANING UP |"
rm -fr ${BUILD_dir[SNAPSHOT]}
rm -f busybox-snapshot.tar.bz2
for ARCS in ${ARC[*]}; do
	[ -d ${STARTDIR}/cross-compiler-${ARCS} ] && rm -fr ${STARTDIR}/cross-compiler-${ARCS}
done
#-- Done!
echo -e "\n| DONE |\n"
exit 0
