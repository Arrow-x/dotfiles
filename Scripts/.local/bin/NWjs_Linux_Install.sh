#!/bin/bash
if [ ! -d "www" ] || [ ! -f "package.json" ] #test to avoid accidental and irreversible deletion of files and directories
then
	echo "This doesn't look like a NW.js program."
	exit 1
fi

create_sh=0
create_dt=0
start_game=1
use_beta=0

usage() #help message
{
	echo "Syntax:"
	echo "  ./Install_Linux.sh [[-xs] [-xd] [-b] [-ns] | [-h] | [-v]]"
	echo ""
	echo "This program converts a Windows version of an NW.js program into its Linux counterpart."
	echo "The Linux version is not guaranteed to work and a backup of the Windows version is always advised. You've been warned!"
	echo "The installation process takes a while. Don't worry if almost everything disappears from the directory and then nothing seems to happen. It's normal."
	echo ""
	echo "Parameters:"
	echo "  -h, --help        Shows this message and exits"
	echo "  -v, --version     Prints the version and exits"
	echo "  -xs, --exe-sh     Creates a .sh executable after the installation"
	echo "  -xd, --exe-dt     Creates a .desktop executable after the installation"
	echo "  -b, --beta        Uses latest version of NW.js, even if it's a beta"
	echo "  -ns, --no-start   Doesn't start the game after the installation"
}

while [ "$1" != "" ] #positional parameters
do
	case $1 in
		-h | --help )
			usage
			exit
			;;
		-v | --version )
			echo "Linux Installer for NW.js, version 1.5"
			exit
			;;
		-xs | --exe-sh ) #creates .sh executable to run the game
			create_sh=1
			;;
		-xd | --exe-dt ) #creates .desktop executable to run the game
			create_dt=1
			;;
		-ns | --no-start ) #doesn't start the game after the installation
			start_game=0
			;;
		-b | --beta ) #downloads a beta, if it's the last version of NW.js available
			use_beta=1
			;;
		* )
			usage
			exit 1
	esac
	shift
done

#removes unneeded files
find . -maxdepth 1 -type f -not -name "." -not -name ".." -not -name "nw.pak" -not -name "package.json" -not -name "www" -not -name "NWjs_Linux_Install.sh" -not -name "patch.sh" -print0 | xargs -0 -r rm --
find . -maxdepth 1 -type d -not -name "." -not -name ".." -not -name "nw.pak" -not -name "package.json" -not -name "www" -not -name "NWjs_Linux_Install.sh" -not -name "patch.sh" -print0 | xargs -0 -r rm -r --

#gets the latest version of NW.js
#the code downloads the page, then reverses it, gets the first reversed version number and reverses it again
#content=$(wget https://dl.nwjs.io/ -q -O -)
#if [ $use_beta -eq 1 ]
#then
#	version=$(echo $content | rev | grep -m1 -o -E "/([0-9]*(ateb|ahpla|cr)-)?[0-9]+\.[0-9]+\.[0-9]+v" | head -1 | rev | sed "s/\///")
#else
#	version=$(echo $content | rev | grep -m1 -o -E "/[0-9]+\.[0-9]+\.[0-9]+v" | head -1 | rev | sed "s/\///")
#fi
#
#cpu=$(uname -p)
#if [ $cpu="x86_64" ] #gets CPU architecture
#then #64-bit version
#	cpu="x64"
#else #32-bit version
#	cpu="ia32"
#fi
dir_name=nwjs-v0.76.0-linux-x64
file_name=$dir_name.tar.gz
#downloading the correct NW.js for your computer
#wget https://dl.nwjs.io/$version/$file_name -q -O $file_name
echo 'copying NWjs'
cp "$HOME"/File/Homework/H-Games/tools/"$file_name" .
#unpacking archive
echo 'extracting ...'
tar -xzf "$file_name"
#files are in a directory, moving them in the right place
echo "moving files around"
mv $dir_name/* .
#cleaning useless file and directory
echo "cleaning up"
rm -r $dir_name
rm $file_name

if [ ! -x "nw" ] #checks if the game launcher is actually executable
then
	chmod +x nw
fi

if [ -f "patch.sh" ] #checks if there is a special patch for this installation
then
	chmod +x patch.sh
	./patch.sh
fi

if [ $create_sh -eq 1 ] #creates an executable
then
	echo "#!/bin/bash" > nw.sh
	echo "./nw" >> nw.sh
	chmod +x nw.sh
fi

if [ $create_dt -eq 1 ] #creates an executable
then
	echo "[Desktop Entry]" > Game.desktop
	echo "Name=Game" >> Game.desktop
	echo 'Exec=sh -c "$(dirname %k)/nw"' >> Game.desktop
	echo "Terminal=false" >> Game.desktop
	echo "Type=Application" >> Game.desktop
	chmod +x Game.desktop
fi

if [ $start_game -eq 1 ] #starts the game
then
	./nw
fi
