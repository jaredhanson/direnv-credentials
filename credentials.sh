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
  local out=$(pass show $1)
  
  while IFS=';' read -ra ADDR; do
    for i in "${ADDR[@]}"; do
      # process "$i"
      echo "i is $i" >&2
    done
  done <<< "$out"
  
  echo "todo-username_pass"
}
