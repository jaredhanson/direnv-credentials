# load credential providers
for lib in "$direnv_config_dir/lib/credentials/"*.sh; do
  source "$lib"
done



# use password google
# use password google/foo FOO
# TODO: add support for passing envvar prefix
use_password() {
  local provider="pass"
  eval "${provider}_password" "$@"
}
