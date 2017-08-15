function fish_right_prompt
  set -l exit_code $status
  if test $exit_code -ne 0
    set_color red
  else
    set_color green
  end
  printf '%d' $exit_code
  set_color green
  printf " « %s [" (date +%H:%M:%S)
  set_color yellow
  printf "$BATTERY_TIME_LEFT"
  set_color green
  printf ']'
  set_color normal
end