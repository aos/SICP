# This creates a bash alias for scheme
# If given an argument it runs the file
# Otherwise starts REPL with the scheme_completion text file

scm () {
  if [[ -z $1 ]]; then
    rlwrap -r -c -f scheme_completion.txt mit-scheme
  else
    mit-scheme --quiet < $1
  fi
}
