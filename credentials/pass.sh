# Usage: pass_password <name>
#
# Decrypts a password using `pass` and sets <NAME>_USERNAME and <NAME>_PASSWORD
# environment variables.
pass_password () {
  local name=$(echo "$1" | tr '[:lower:]' '[:upper:]')
  
  local out=$(pass show $1)
  echo "==" >&2
  echo "$out" >&2
  echo "==" >&2
  
  #IFS=$'\n' read -d '' -r -a lines <<< "$out"
  
  # TODO: Exaport first line as password, only parse subsequent lines for metadata
  export "${name}_PASSWORD=todo"
  
  while IFS=: read -ra field; do
    echo "- field: ${field[@]}" >&2
    
    # TODO: set url/location/etc
    # TODO: case insensitive compare
    if [ ${field[0]} == "Username" ]; then
      echo "found username" >&2
      # TODO: trim whitepace, maybe in IFC read above?
      export "${name}_USERNAME=${field[1]}"
    fi
  done <<< "$out"
}
