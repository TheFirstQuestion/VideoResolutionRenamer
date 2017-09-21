getInfo () {
	# Extract file name
	filename=$(basename "$1")
	extension="${filename##*.}"
	filename="${filename%.*}"
	pathname="$(dirname "$1")"


	# Split filename on " - " to allow removing of old resolution
	# http://www.humbug.in/2010/bash-tricks-split-cut-a-string-with-multi-character-delimiters-using-awk/

	showName=$(echo "$filename" | awk 'BEGIN {FS=" - "} {print $1}')
	epNum=$(echo "$filename" | awk 'BEGIN {FS=" - "} {print $2}')
	epName=$(echo "$filename" | awk 'BEGIN {FS=" - "} {print $3}')

	# Get height
	info=$(mediainfo --Inform="Video;%Height%" "$1");

	# Match resolution (less than or equal to)
	if [ "$info" -le "144" ]
	then
		res="144p"
	elif [ "$info" -le "240" ]
	then
		res="240p"
	elif [ "$info" -le "360" ]
	then
		res="360p"
	elif [ "$info" -le "480" ]
	then
		res="SD-480p"
	elif [ "$info" -le "720" ]
	then
		res="HD-720p"
	elif [ "$info" -le "1080" ]
	then
		res="HD-1080p"
	elif [ "$info" -le "1440" ]
	then
		res="UHD-1440p (2k)"
	elif [ "$info" -le "2160" ]
	then
	    res="UHD-2160p (4k)"
	else
		res="idk"
	fi

	# Rename file
	echo $pathname/$showName - $epNum - $epName	- $res.$extension
	echo $pathname/$showName - $epNum - $epName	- $res.$extension >> newNames.txt
	#mv "$1" "$pathname/$showName - $epNum - $epName	- $res.$extension"
};


# https://stackoverflow.com/questions/24708041/how-to-recursively-get-all-files-filtered-by-multiple-extensions-within-a-folder
shopt -s extglob
shopt -s globstar

FILE_EXTENSIONS="mp4|mkv|mov|flv|wmv|avi"
SOURCE_FOLDER=$1

# Set directory to current working folder if no input parameter
if [ -z "$SOURCE_FOLDER" ]; then
   SOURCE_FOLDER=$(pwd)
fi

# Enter blank lines and time and date into file
echo "" >> newNames.txt
echo "" >> newNames.txt
echo "" >> newNames.txt
echo "" >> newNames.txt
echo "" >> newNames.txt
echo "" >> newNames.txt
echo "" >> newNames.txt
echo "" >> newNames.txt
echo "" >> newNames.txt
echo "" >> newNames.txt
echo "" >> newNames.txt
echo "" >> newNames.txt
echo "" >> newNames.txt
echo "================================================================" >> newNames.txt
echo $(date '+%Y-%m-%d %H:%M:%S') >> newNames.txt

# Do the rename for every file in folder, recursively
for file in "$SOURCE_FOLDER"/**/*.*($FILE_EXTENSIONS)
do
    getInfo "$file"
done


# To do:
# Add a Sonarr refresh
# https://github.com/Sonarr/Sonarr/wiki/Manually-Triggering-Imports
