function maybe_set_histfile(){
  if [[ "$HISTFILE" != *"bash_histories"* ]]; then
    # echo pre histfile: $HISTFILE
    export HISTFILE="$HOME/.bash_histories/`pwd | sed 's/\//-/g'`.`echo $TERM_SESSION_ID | cut -d't' -f2 | cut -d'p' -f1`.bash"
    history -r
    # echo post histfile: $HISTFILE
  fi
}
PROMPT_COMMAND="maybe_set_histfile; $PROMPT_COMMAND"
