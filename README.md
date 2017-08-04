# pwned-passwords

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

Usage:

```
$ docker run --rm -v $(pwd):/data pwned-passwords yourpassword
Hash is B48CF0140BEA12734DB05EBCDB012F1D265BED84
Found 1 occurrences in /data/pwned-passwords-1.0.txt
```

Run the container without network

```
$ docker run --rm -v $(pwd):/data --network none pwned-passwords yourpassword
```

## Acknowledgement

* Stephen C. Losen, University of Virginia for `sgrep`
* Troy Hunt for https://haveibeenpwned.com
