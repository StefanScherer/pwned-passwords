# pwned-passwords
[![CircleCI](https://circleci.com/gh/StefanScherer/pwned-passwords.svg?style=svg)](https://circleci.com/gh/StefanScherer/pwned-passwords)
[![This image on DockerHub](https://img.shields.io/docker/pulls/stefanscherer/pwned-passwords.svg)](https://hub.docker.com/r/stefanscherer/pwned-passwords/)

This Docker image can be used to search through the 320 million pwned passwords.
See [https://haveibeenpwned.com/Passwords](https://haveibeenpwned.com/Passwords) for details.

If you want to check your passwords locally in a secure environment, use
this Docker image. It will download the huge pwned-passwords files and
will extract it for you.

Once the files are downloaded you can run the container again and again
with your passwords that you also are currently using. No passwords or SHA1
sums will leave your computer. If you don't trust me, run the container
without a network.

Build the image:

```
docker build -t pwned-passwords .
```

## Usage

### Mac / Linux

```
$ mkdir pwned
$ cd pwned
$ docker run --rm -v $(pwd):/data stefanscherer/pwned-passwords yourpassword
Hash is B48CF0140BEA12734DB05EBCDB012F1D265BED84
Found 1 occurrences in /data/pwned-passwords-1.0.txt
```

Run the container without network and with read-only mounted volume (works after you have downloaded all files).

```
$ docker run --rm -v $(pwd):/data:ro --network none stefanscherer/pwned-passwords yourpassword
```

#### Paranoid mode

Typing passwords in your terminal stores them in your shell history. You can remove that from your shell history, for example with `sed -i 's/docker run.*pwned-passwords.*//' ~/.bash_history` on Linux.

You can also run the container interactively to work inside a save place. The commands you type into the container isn't leaked to the host's shell history.

```
$ docker run --rm -it --entrypoint sh --network none -v $(pwd):/data:ro stefanscherer/pwned-passwords
/ # search secret
Hash is E5E9FA1BA31ECD1AE84F75CAAA474F3A663F05F4
Oh no - pwned! Found 1 occurences in /data/pwned-passwords-1.0.txt
/ # search supersecret123
Hash is 21DDE79B804497E122F38DABC393F8E94F103CA6
Oh no - pwned! Found 1 occurences in /data/pwned-passwords-1.0.txt
/ # search absolutesupersecret123
Hash is 9F14B0EBAE2CF106A8C8998B669BDC75DE5E1A2B
Good news - no pwnage found!
/ # exit
```

### Windows

#### PowerShell

```
mkdir pwned
cd pwned
docker run --rm -v "$(pwd):/data" stefanscherer/pwned-passwords yourpass
```

#### CMD Shell

```
mkdir pwned
cd pwned
docker run --rm -v "%cd%:/data" stefanscherer/pwned-passwords yourpass
```

## Acknowledgement

* Stephen C. Losen, University of Virginia for `sgrep`
* Troy Hunt for https://haveibeenpwned.com
