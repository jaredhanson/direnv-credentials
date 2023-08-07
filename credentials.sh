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
  
  #IFS= read -ra LINES <<< "$out"
  IFS=$'\n' read -d '' -r -a lines <<< "$out"
  
  while IFS=: read -ra arr; do
    echo "arr is $arr[@]" >&2
    echo "arr0 is ${arr[0]}" >&2
    echo "arr1 is ${arr[1]}" >&2
    
    # TODO: case insensitive compare
    if [ ${arr[0]} == "Username" ]; then
      echo "found username" >&2
      # TODO: trim whitepace, maybe in IFC read above?
      echo "${arr[1]}"
      exit
    fi
  done <<< "$out"
}
