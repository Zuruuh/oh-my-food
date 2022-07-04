# Uploads all built html files to w3c's validator & logs the validation results.
# If at least one file triggers an error, program will exit 1
function ci() {
  local out_dir=$1

  if [[ ! -d "$out_dir" ]]; then
    echo "$out_dir is not a directory!"
    exit 1;
  fi

  local files;
  files=$(find "$1" -name "*.html");

  local errors=()
  local warnings=()

  for file in $files; do
     local output
     output=$(./scripts/w3c.sh "$file")

     if grep -qE "error" <<< "$output"; then
       errors+=("$file: \n$output\n\n")
     elif grep -qE "warning" <<< "$output"; then
       warnings+=("$file: \n$output\n\n")
     fi
  done

  echo "${errors[@]}"
  echo "${warnings[@]}"

  if [ ${#errors[@]} -eq 0 ]; then
    exit 0
  fi

  exit 1;
}

ci "$1";
