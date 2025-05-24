#!/usr/bin/env bash

# tmux-powerline segment: ping_latency
# Shows round-trip ping time to 8.8.8.8 or a "no net" icon on failure.
#
run_segment() {

  local ping_output latency latency_val

  if shell_is_osx; then
    ping_output=$(ping -c 1 -t 1 8.8.8.8 2>/dev/null)
  else
    ping_output=$(ping -c 1 -W 1 8.8.8.8 2>/dev/null)
  fi

  # Extract latency using sed (works on Linux/macOS)
  latency=$(echo "$ping_output" | sed -n 's/.*time=\([0-9.]*\).*/\1/p')

  if [[ -z "$latency" ]]; then
    echo "#[fg=red]🔌 No net"
    return
  fi

  latency_val=${latency%.*}

  if ((latency_val < 50)); then
    echo "#[fg=white]${latency}ms"
    # echo "#[fg=white,bg=colour208,bold] ${latency}ms"
  elif ((latency_val < 150)); then
    echo "#[fg=white,bg=colour208,bold] ${latency}ms"
  else
    echo "#[fg=white,bg=colour196,bold] ${latency}ms"
  fi

}
