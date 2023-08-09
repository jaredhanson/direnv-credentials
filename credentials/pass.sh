echo "Loaded pass lib!"

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
