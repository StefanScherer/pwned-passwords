#!/bin/bash -e

echo 'BBD0671EB6682D5050508AF7E3D9A464BEFF1A6D' >  pwned-passwords-1.0.txt
echo 'F0D4031B7FBA0204D7DFF0D63198FA9369AE7073' >> pwned-passwords-1.0.txt
touch pwned-passwords-update-1.txt
echo "pwned-passwords-update-2.txt will be downloaded by container"

docker run -v $(pwd):/data pwned-passwords CirclePassword | grep -c "Oh no"
docker run -v $(pwd):/data pwned-passwords NotFound
docker run -v $(pwd):/data pwned-passwords 'bad spaced password' | grep -c "Oh no"
