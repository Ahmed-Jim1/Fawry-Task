#!/bin/bash

# --- Function to print usage/help ---
usage() {
  echo "Usage: $0 [-n] [-v] search_string filename"
  echo "Options:"
  echo "  -n    Show line numbers for each match"
  echo "  -v    Invert the match (show lines that do NOT match)"
  echo "  --help Show this help message"
}

# --- Argument Validation ---
if [[ "$1" == "--help" ]]; then
  usage
  exit 0
fi

if [ "$#" -lt 2 ]; then
  echo "Error: Not enough arguments."
  usage
  exit 1
fi

# --- Initialize variables ---
show_line_numbers=false
invert_match=false

# --- Option Parsing ---
while getopts ":nv" opt; do
  case $opt in
    n)
      show_line_numbers=true
      ;;
    v)
      invert_match=true
      ;;
    \?)
      echo "Invalid option: -$OPTARG"
      usage
      exit 1
      ;;
  esac
done

shift $((OPTIND - 1))  # Move to next arguments after options

# --- Assign search string and filename ---
search_string=$1
filename=$2

# --- File existence check ---
if [ ! -f "$filename" ]; then
  echo "Error: File '$filename' not found."
  exit 1
fi

# --- Read file line by line ---
line_number=0
while IFS= read -r line; do
  line_number=$((line_number + 1))
  
  # Check for case-insensitive match
  if echo "$line" | grep -qi "$search_string"; then
    match=true
  else
    match=false
  fi

  # Decide whether to print based on invert flag
  if { [ "$match" = true ] && [ "$invert_match" = false ]; } || \
     { [ "$match" = false ] && [ "$invert_match" = true ]; }; then
    if [ "$show_line_numbers" = true ]; then
      echo "${line_number}:$line"
    else
      echo "$line"
    fi
  fi

done < "$filename"

