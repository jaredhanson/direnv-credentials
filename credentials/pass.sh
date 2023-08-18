# Usage: pass_password <name>
#
# Decrypts a password using `pass` and sets <NAME>_USERNAME and <NAME>_PASSWORD
# environment variables.
pass_password () {
  # Uppercase the name of the password, which will be prefixed to the
  # environment variables being set.
  local name=$(echo "$1" | tr '[:lower:]' '[:upper:]')
  
  local out=$(pass show $1)
  echo "==" >&2
  echo "$out" >&2
  echo "==" >&2
  
  {
    # Read the first line of the output as the password.
    read -r password
    export "${name}_PASSWORD=${password}"
    
    # Split each line of the output into a field and value using a colon
    # separator.  Note that the value itself may contain a colon, which should
    # not be split.  Due to that, the `-a` argument is not used to read into an
    # array.  Rather, all characters after the first colon are assigned to
    # value.
    while IFS=: read -r field value; do
      echo "- ${field}: ${value}" >&2
    
      # TODO: set url/location/etc
      # TODO: case insensitive compare
      if [ ${field} == "Username" ]; then
        # TODO: trim whitepace, maybe in IFC read above?
        export "${name}_USERNAME=${value}"
      fi
    done
  } <<< "$out"
}
