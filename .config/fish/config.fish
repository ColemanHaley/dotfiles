
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval $HOME/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

set --global hydro_symbol_prompt λ
set TERM xterm-256color
alias vi nvim
alias ls exa

function fuck -d "Correct your previous console command"
  set -l fucked_up_command $history[1]
  env TF_SHELL=fish TF_ALIAS=fuck PYTHONIOENCODING=utf-8 thefuck $fucked_up_command THEFUCK_ARGUMENT_PLACEHOLDER $argv | read -l unfucked_command
  if [ "$unfucked_command" != "" ]
    eval $unfucked_command
    builtin history delete --exact --case-sensitive -- $fucked_up_command
    builtin history merge
  end
end

