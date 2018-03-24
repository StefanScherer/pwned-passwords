#!/bin/bash -e

echo 'BBD0671EB6682D5050508AF7E3D9A464BEFF1A6D' >  pwned-passwords-ordered-2.0.txt
echo 'F0D4031B7FBA0204D7DFF0D63198FA9369AE7073' >> pwned-passwords-ordered-2.0.txt

docker run -v $(pwd):/data pwned-passwords CirclePassword | grep -c "Oh no"
docker run -v $(pwd):/data pwned-passwords NotFound
docker run -v $(pwd):/data pwned-passwords 'bad spaced password' | grep -c "Oh no"
