#!/bin/bash
clear
shopt -s nocasematch

help_menu()
{
    echo "$(basename "$0") - Yelp Menu :)"
    echo " "
    echo "$(basename "$0") [OPTION] -- a command line tool to search for a keyword in all files within a folder"
    echo " "
    echo "OPTION:"
    echo "-c, --case-sensitive       Enable case sensitive search (Default case insensetive search)"
    echo "-e, --extension            Specify the Extension of the file to be search (Default select all Extensions)"
    echo "-f, --folder               Specify the Directory (Default seach in PWD)" 
    echo "-k, --keyword              Specify the Keyword or a Regex (check man $(basename "$0"))"
    echo "-h, --help                 Prints program usage information and exits successfully."
    echo "-v, --version              Prints the program version number and exits successfully." 
    echo " "
}

while test $# -gt 0; do
           case "$1" in
                -c | --case-sensitive) 
                    shift
                    shopt -u nocasematch
                    shift
                    ;;
                -e | --extension)
                    shift
                        extension=$1
                        if [ "$extension" == "" ] || [[ "$extension" = "-"* ]]; then
                            echo "No file extension found!"
                            exit 1;
                        fi
                    shift
                    ;;
                -f | --folder)
                    shift
                    folder=$1
                    if [ "$folder" == "" ] || [ ! -d "$folder" ]; then
                        echo "No such folder found!"
                        exit 1;
                    fi
                    shift
                    ;;
                -k | --keyword)
                    shift
                    keyword=$1
                    if [[ "$keyword" = "-"* ]]; then
                        echo "Keyword flag is empty!"
                        exit 1;
                    fi
                    shift
                    ;;
                -h | --help)
                   help_menu
                   exit 0
                   ;;
                -v | --version)
                   echo "File XSearch Version 1.0"
                   exit 0
                   ;;
                *)
                   echo "$1 is not a recognized flag!"
                   exit 1
                   ;;
          esac
done  

if [ "$folder" == "" ]; then
    folder=$PWD 
fi

if [ "$keyword" == "" ] ; then
    echo "Choose a Keyword using -k|--keyword option"
    exit 1;
fi

if [ "$extension" == "" ] ; then
    extension=*;
fi

# search function
search_in_file() {
for file in "$1"/*; do
    if [ -d "$file" ]; then
        search_in_file "$file"
    else
        case "$file" in *.$extension)
            #cat "$file" | awk '/hey/{print NR}'
            i=0;
            while read -r line; do
                let "i++"
                if [[ $line =~ $keyword ]] 
                then
                    #echo "File Name: $(readlink -f $file):$i =>"
                    #echo $(ls test/test4.txt --hyperlink=auto)
                    echo -n "File Name:";ls $file --hyperlink=always;
                    echo "Line $i:"
                    echo "${line}" | grep -i --color=always -E $keyword
                    echo "-------------------------------------------"
                  
                fi
            done < "$file"
            
        esac
    fi
done |more
}


search_in_file "$folder"

