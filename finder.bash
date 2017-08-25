#   -----------------------------
#   MAKE TERMINAL BETTER
#   -----------------------------

    alias cp='cp -iv'                           # Preferred 'cp' implementation
    alias mv='mv -iv'                           # Preferred 'mv' implementation
    alias less='less -FSRXc'                    # Preferred 'less' implementation
    alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
    alias ~="cd ~"                              # ~:            Go Home
    alias c='clear'                             # c:            Clear terminal display
    alias which='type -all'                     # which:        Find executables
    alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
    alias show_options='shopt'                  # Show_options: display bash options settings
    alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
    alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
    alias DT='tee ~/Desktop/terminalOut.txt'    # DT:           Pipe content to file on MacOS Desktop
    alias numFiles='echo $(ls -1 | wc -l)'      # numFiles:     Count of non-hidden files in current dir
    alias make1mb='mkfile 1m ./1MB.dat'         # make1mb:      Creates a file of 1mb size (all zeros)
    alias make5mb='mkfile 5m ./5MB.dat'         # make5mb:      Creates a file of 5mb size (all zeros)
    alias make10mb='mkfile 10m ./10MB.dat'      # make10mb:     Creates a file of 10mb size (all zeros)
    alias ..='cd ..'                            # ..            level up
    alias ...='cd ../..'                        # ...           2X level up
    alias ....='cd ../../..'                    # ....          3X level up
    

#   cd using "frecent" directory, https://github.com/rupa/z
    . ~/Documents/Code/z/z.sh 


#   Always list files/folders after cd
    cd () {
        if [ -z "$1" ]
        then
            command pwd
        else
            command cd "$@"; ls -l;
        fi
    }


#   Use graphical ls
    ls () {
        command ls -GFh "$@"
    }


#   'cd' to frontmost window of MacOS Finder
    cdf () {
        currFolderPath=$( /usr/bin/osascript <<EOT
            tell application "Finder"
                try
            set currFolder to (folder of the front window as alias)
                on error
            set currFolder to (path to desktop folder as alias)
                end try
                POSIX path of currFolder
            end tell
EOT
        )
        echo "cd to \"$currFolderPath\""
        cd "$currFolderPath"
    }

#   Show hidden files in Finder
	alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'


#   Hide hidden files in Finder
	alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'


#   Preferred implemntation of mkdir
    mkdir() { command mkdir -p "$1"; cd "$1"; }


#   Moves a file to the MacOS trash
    trash () { command mv "$@" ~/.Trash; ll; }


#   Opens any file in MacOS Quicklook Preview
    ql () { qlmanage -p "$*" >& /dev/null; }


#   Full Recursive Directory Listing
    alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'


#   Create a ZIP archive of a folder
    zipf () { zip -r "$1".zip "$1" ; }


#   extract:  Extract most know archives with one command
    extract () {
        if [ -f $1 ] ; then
          case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
             esac
         else
             echo "'$1' is not a valid file"
         fi
    }

#   Lazy publish blog
#   Only uploads files where filesize has changed, https://download.samba.org/pub/rsync/rsync.html
#   ------------------------------------------------------
    blog () { command rsync -r ~/Code/blog/_site/* ryanjsalva@ryanjsalva.com:www; }
