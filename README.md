# File XSearch 


<img src="https://github.com/islem19/File-XSearch/blob/master/res/img/icon.png?raw=true" align="left" hspace="10" vspace="10"></a>

Search for any Keyword on a spesific folder using Bash commands.

<a target="_blank" href="LICENSE"><img src="https://img.shields.io/github/license/islem19/File-XSearch.svg" alt="License" /></a>
<a target="_blank" href="SIZE"><img src="https://img.shields.io/github/repo-size/islem19/File-XSearch.svg"/></a>


<br>

Download [the Pre-Release Version](https://github.com/islem19/File-XSearch/releases/tag/V1.0-beta)
<br>
<br>
<br>
<br>
<br>
> Note: Command Line is still in Alpha Version. Feel Free to [Contribute](https://gist.github.com/MarcDiethelm/7303312)


## Installation

###	Manual

```shell
#####clone the project
git clone "https://github.com/islem19/File-XSearch.git"
#####copy the xsearch to /usr/bin
sudo cp $(pwd)/xsearch.sh /usr/bin/xsearch
sudo chmod 0755 /usr/bin/xsearch
#####copy the man page to the right target man(1)
sudo cp $(pwd)/man/xsearch.1 /usr/share/man/man1/xsearch.1
sudo gzip /usr/share/man/man1/xsearch.1
sudo mandb
```

###	Auto

```shell
#####clone the project and run the install.sh
git clone "https://github.com/islem19/File-XSearch.git"
sh install.sh
############ 
```

## Usage

```shell
xsearch [options] [-f|--folder] [-k|--keyword]
```

You can check the man page using:
```shell
########### Help on XSearch
man xsearch
###########
```

To check the available commands you can run also:
```shell
############
xsearch [-h|--help ]
############
```

Basic command to search for a Keyword in a Directory: 
```shell
xsearch -f <path_to_folder> -k <word_to_be_search> 
####### or you can use
xsearch --folder <path_to_folder> --keyword <word_to_be_search> 

```

if no folder is selected, the command will look into the current directory running. 

The command search will be case insensitive, if you want to seach with case sensitive enable, use:
```shell
xsearch --folder <path_to_folder> --keyword <word_to_be_search> --case-sensitive
####### or you can use [-c] option
```
By default, the command will search through all file extenstions, if you can to spesify and target a file extension, use:
```shell
xsearch --folder <path_to_folder> --keyword <word_to_be_search> --extension
####### or you can use [-e] option
```









## Man Page

Manual (man) pages should obey a particular layout. This isn’t strictly necessary, but will help make your man page similar to every other in your system and not confuse or surprise your users.

### Install Man Page

The name of the man page should be <name_of_command>.1 

Check out [man/xsearch.1](https://github.com/islem19/File-XSearch/blob/V1.0-beta/man/xsearch.1) as a demo file.
```shell
############ copy man page to the man(1) category- User Command Man Pages
sudo cp xsearch.1 /usr/share/man/man1/xsearch.1
############ Compress the file using Gzip
sudo gzip /usr/share/man/man1/xsearch.1
############ Source and refresh the Man Database
sudo mandb
```

For more on how to write a man page check out (Medium.com)


# License
-------
    Copyright (C) 2007 Free Software Foundation, Inc.
    <https://fsf.org/> Everyone is permitted to copy and distribute verbatim copies of this license document, but changing it is not allowed.

    The GNU General Public License is a free, copyleft license for software and other kinds of works.

    The licenses for most software and other practical works are designed to take away your freedom to share and change the works.  By contrast,
    the GNU General Public License is intended to guarantee your freedom to share and change all versions of a program


