# name: Zish

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function fish_prompt
  set_color blue
  printf "┌─["
  set_color red
  printf "$BATTERY_PCT%%"
  set_color blue
  printf "]["
  set_color green
  printf '%s' (whoami)
  set_color blue
  printf ']['
  set_color green
  printf '%s' (hostname|cut -d . -f 1)
  set_color blue
  printf ']['
  set_color green
  printf '%s' (prompt_pwd)
  set_color blue
  printf ']'
  
  echo
  set_color blue
  printf '└─['
  set_color yellow
  printf '%s' (__fish_git_prompt)
  if [ (_is_git_dirty) ]
    set_color blue
    printf '* '
  end
  set_color blue
  printf ']'
  set_color yellow
  printf '» '
  set_color normal
end