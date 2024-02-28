# Read current version from pubspec.yaml
current_version=$(awk '/version/{print $2}' pubspec.yaml | sed 's/["]//g')

# Increment version number (assuming semantic versioning)
major=$(echo $current_version | cut -d '.' -f 1)
minor=$(echo $current_version | cut -d '.' -f 2)
patch=$(echo $current_version | cut -d '.' -f 3)
new_version="$major.$minor.$((patch + 1))"

# Update pubspec.yaml with the new version number
sed -i "s/version: $current_version/version: $new_version/" pubspec.yaml

# Print the new version number
echo "New version: $new_version"