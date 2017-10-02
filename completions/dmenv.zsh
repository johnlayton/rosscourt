if [[ ! -o interactive ]]; then
    return
fi

compctl -K _dmenv dmenv

_dmenv() {
  local words completions
  read -cA words

  if [ "${#words}" -eq 2 ]; then
    completions="$(dmenv commands)"
  else
    completions="$(dmenv completions ${words[2,-1]})"
  fi

  reply=("${(ps:\n:)completions}")
}
