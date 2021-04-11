# Prints the CPU usage, depends on `sensors`

run_segment() {
  if shell_is_linux; then
    cpu_temp=$(sensors | grep -oP 'Package.*?\+\K[0-9]+')

    if [ $cpu_temp -gt 80 ]; then
      widget="#[fg=colour233,bg=colour9,bold] $cpu_temp°C";
    elif [ $cpu_temp -gt 65 ]; then
      widget="#[fg=colour233,bg=colour3,bold] $cpu_temp°C";
    elif [ $cpu_temp -gt 40 ]; then
      widget="#[fg=colour233,bg=colour2,bold] $cpu_temp°C";
    elif [ $cpu_temp -gt 30 ]; then
      widget="#[fg=colour233,bg=colour12,bold] $cpu_temp°C";
    fi
  elif shell_is_osx; then 
    echo "Not configured for OSX"
  fi

  if [ -n "$widget" ]; then
    echo "$widget"
    return 0
  else
    return 1
  fi
}
