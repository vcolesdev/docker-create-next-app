# Check for npm
if ! [ -x "$(command -v npm)" ]; then
  echo 'Error: npm is not installed.' >&2
  exit 1
fi

# Install global packages
npm i -g

# We're checking for node_modules here
ls -la node_modules || echo "No node_modules directory found." && exit 1

# Check for create-next-app
if ! [ -x "$(command -v create-next-app)" ]; then
  echo 'Error: create-next-app is not installed.' >&2
  echo 'Installing create-next-app...'
  npm install -g create-next-app
fi

# create-next-app exists, great!  Let's continue...
echo "Installing next application in the ./next directory..."

# Run create-next-app and install to .next directory on container
create-next-app ./next \
  --ts \
  --tailwind \
  --eslint \
  --app \
  --empty \
  --src-dir "No" \
  --import-alias "@/*" \
  --use-npm \
  --disable-git \
  --yes

# Echo the success message
echo "Next app created in the ./next directory."

# Let's check out our files
ls -la ./next

# Change to the next directory and exit script
cd ./next || exit