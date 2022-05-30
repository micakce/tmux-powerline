# Prints tmux session info.
# Assuems that [ -n "$TMUX"].

run_segment() {
  echo "#{?client_prefix,#[fg=#df0000],#[fg=$1]} $(tmux display-message -p '#S:#I.#P')"
	return 0
}
