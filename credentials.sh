credential () {
  echo "todo"
}

echo "hello from credentials"

username () {
  local provider="pass"
  eval "username_$provider" "$@"
}

password () {
  local provider="pass"
  eval "password_$provider" "$@"
}


password_pass () {
  local out=$(pass show $1)
  echo "$out"
}

username_pass () {
  local out=$(pass show $1)
  
  while IFS=';' read -ra ADDR; do
    for i in "${ADDR[@]}"; do
      # process "$i"
      echo "i is $i" >&2
    done
  done <<< "$out"
  
  echo "todo-username_pass"
}
