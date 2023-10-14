
#!/bin/bash

# List all directories with the "casa-" pattern
directories=(casa-*)

# Check if any matching directories are found
if [ ${#directories[@]} -eq 0 ]; then
  echo "No directories with the 'casa-release' pattern found."
  exit 1
fi

# Iterate through each directory
for dir in "${directories[@]}"; do
  data_dir="$dir/data"
  
  # Check if the "data" directory exists in the current directory
  if [ -d "$data_dir" ]; then
    echo "Updating geodetic data in $data_dir..."
 
    # Determine the appropriate update command based on the CASA version
    if [[ "$dir" == *"4."* ]]; then
      cd "$data_dir"
      rsync -avz rsync://casa-rsync.nrao.edu/casa-data .
      cd ../../
    elif [[ "$dir" == *"5."* ]]; then
      cd "$data_dir"
      rsync -avz rsync://casa-rsync.nrao.edu/casa-data .
      cd ../../
    elif [[ "$dir" == *"6."* ]]; then
      cd "$dir"  # Move up to <CASA-distro>
      if [ -d "bin" ]; then
        ./bin/python3 -m casadata --update
        echo "Using pip to update runtime data..."
        ./bin/pip3 install --upgrade --extra-index-url https://go.nrao.edu/pypi casadata
        cd ../
      fi
    fi
    # Go back to the original directory
    echo "Geodetic data updated in $dir."
  else
    echo "No 'data' directory found in $dir. Skipping..."
  fi
done

echo "Geodetic data update completed for all 'casa-release' directories."


