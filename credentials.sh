# use password google
# use password google/foo FOO
# TODO: add support for passing envvar prefix
use_password() {
  echo "Password $1"
  local provider="pass"
  eval "${provider}_password" "$@"
}


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
  local prefix=$(echo "$1" | tr '[:lower:]' '[:upper:]')
  #echo "prefix is $prefix" >&2
  
  local out=$(pass show $1)
  
  IFS=$'\n' read -d '' -r -a lines <<< "$out"
  
  # TODO: Exaport first line as password, only parse subsequent lines for metadata
  export "${prefix}_PASSWORD=todo"
  
  while IFS=: read -ra arr; do
    echo "arr is $arr[@]" >&2
    echo "arr0 is ${arr[0]}" >&2
    echo "arr1 is ${arr[1]}" >&2
    
    # TODO: set url/location/etc
    # TODO: case insensitive compare
    if [ ${arr[0]} == "Username" ]; then
      echo "found username" >&2
      # TODO: trim whitepace, maybe in IFC read above?
      export "${prefix}_USERNAME=${arr[1]}"
    fi
  done <<< "$out"
}

x_pass_username () {
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
