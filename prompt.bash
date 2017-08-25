#   Text Color Variables
#   ------------------------------------------------------------
    txtblk='\e[0;30m' # Black - Regular
    txtred='\e[0;31m' # Red
    txtgrn='\e[0;32m' # Green
    txtylw='\e[0;33m' # Yellow
    txtblu='\e[0;34m' # Blue
    txtpur='\e[0;35m' # Purple
    txtcyn='\e[0;36m' # Cyan
    txtwht='\e[0;37m' # White
     
    bldblk='\e[1;30m' # Black - Bold
    bldred='\e[1;31m' # Red
    bldgrn='\e[1;32m' # Green
    bldylw='\e[1;33m' # Yellow
    bldblu='\e[1;34m' # Blue
    bldpur='\e[1;35m' # Purple
    bldcyn='\e[1;36m' # Cyan
    bldwht='\e[1;37m' # White
     
    unkblk='\e[4;30m' # Black - Underline
    undred='\e[4;31m' # Red
    undgrn='\e[4;32m' # Green
    undylw='\e[4;33m' # Yellow
    undblu='\e[4;34m' # Blue
    undpur='\e[4;35m' # Purple
    undcyn='\e[4;36m' # Cyan
    undwht='\e[4;37m' # White
     
    bakblk='\e[40m'   # Black - Background
    bakred='\e[41m'   # Red
    badgrn='\e[42m'   # Green
    bakylw='\e[43m'   # Yellow
    bakblu='\e[44m'   # Blue
    bakpur='\e[45m'   # Purple
    bakcyn='\e[46m'   # Cyan
    bakwht='\e[47m'   # White
     
    txtrst='\e[0m'    # Text Reset

#   Change Prompt
#   ------------------------------------------------------------
    PROMPT_TXT="$txtgrn"
    function my_prompt(){
        PROMPT=''
        GIT=''
        BRANCH=`git branch 2> /dev/null | grep \* | awk '{print $2}'`

        if [[ "$BRANCH" != "" ]]; then
            GIT=":$BRANCH"
            STATUS=$(git status --porcelain 2> /dev/null)
            if [[ "$STATUS" != "" ]]; then
                EMOJI=''
                ANY_STAGED=$(git status --porcelain | grep '^M' 2> /dev/null)
                ANY_NEW=$(git status --porcelain | grep '^A' 2> /dev/null)
                ANY_UNSTAGED=$(git status --porcelain | grep '^.M' 2> /dev/null)
                ANY_UNTRACKED=$(git status --porcelain | grep '^??' 2> /dev/null)
                if [[ "$ANY_STAGED" != "" ]]; then
                    EMOJI=$EMOJI'👍🏻 '
                fi
                if [[ "$ANY_NEW" != "" ]]; then
                    EMOJI=$EMOJI'😮 '
                fi
                if [[ "$ANY_UNSTAGED" != "" ]]; then
                    EMOJI=$EMOJI'😱 '
                fi
                if [[ "$ANY_UNTRACKED" != "" ]]; then
                    EMOJI=$EMOJI'🤔 '
                fi
                GIT=$GIT' '$EMOJI
            fi
        fi
        printf "\n$PROMPT_TXT$PWD$txtwht$GIT$txtrst\n"
    }
    export PS1="\$ "
    PROMPT_COMMAND="my_prompt; $PROMPT_COMMAND"
