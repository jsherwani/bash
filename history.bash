function maybe_set_histfile(){
  if [[ "$HISTFILE" != *"bash_histories"* ]]; then
    # echo pre histfile: $HISTFILE
    export HISTFILE="$HOME/.bash_histories/$TERM_SESSION_CLASS_ID.bash"
    history -r
    # echo post histfile: $HISTFILE
  fi
}
PROMPT_COMMAND="maybe_set_histfile; $PROMPT_COMMAND"
