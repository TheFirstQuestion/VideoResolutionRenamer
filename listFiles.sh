shopt -s extglob
shopt -s globstar

FILE_EXTENSIONS="mp4|mkv|mov|flv|wmv|avi"
SOURCE_FOLDER=$1

# Set directory to current working folder if no input parameter
if [ -z "$SOURCE_FOLDER" ]; then
   SOURCE_FOLDER=$(pwd)
fi

# Enter blank lines and time and date into file
echo "" >> currentNames.txt
echo "" >> currentNames.txt
echo "" >> currentNames.txt
echo "" >> currentNames.txt
echo "" >> currentNames.txt
echo "" >> currentNames.txt
echo "" >> currentNames.txt
echo "" >> currentNames.txt
echo "" >> currentNames.txt
echo "" >> currentNames.txt
echo "" >> currentNames.txt
echo "" >> currentNames.txt
echo "" >> currentNames.txt
echo "================================================================" >> currentNames.txt
echo $(date '+%Y-%m-%d %H:%M:%S') >> currentNames.txt



# Do the rename for every file in folder, recursively
for file in "$SOURCE_FOLDER"/**/*.*($FILE_EXTENSIONS)
do
    echo "$file"
    echo "$file" >> currentNames.txt
done
