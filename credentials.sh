credential () {
  echo "todo"
}

echo "hello from credentials"

username () {
  local provider="pass"
  eval "${provider}_username" "$@"
}

password () {
  local provider="pass"
  eval "${provider}_password" "$@"
}


pass_password () {
  echo "pass_password ---" >&2
  
  local out=$(pass show $1)
  echo "password: $out" >&2
  echo "$out"
}

pass_username () {
  echo "pass_username ---" >&2
  local out=$(pass show $1)
  
  echo "$out" >&2
  echo "---" >&2
  
  
  #IFS= read -ra LINES <<< "$out"
  IFS=$'\n' read -d '' -r -a lines <<< "$out"
  
  echo "${lines[@]}" >&2
  
  for i in "${lines[@]}"; do
    echo "i is $i" >&2
  done
  
  
  #while IFS=';' read -ra ADDR; do
  #  echo "$ADDR" >&2
  #  for i in "${ADDR[@]}"; do
  #    # process "$i"
  #    echo "i is $i" >&2
  #  done
  #done <<< "$out"
  
  echo "todo-username_pass"
}
