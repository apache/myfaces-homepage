## Verifying checksums

It is essential that you verify the integrity of the downloaded
files using the PGP and MD5/SHA512 signatures.  MD5/SHA512 verification ensures the
file was not corrupted during the download process.  PGP verification
ensures that the file came from a certain person.
  
To verify the MD5 signature on the files, you need to use a program
called _md5_ or _md5sum_, which is
included in many unix distributions.  It is also available as part of
[GNU Textutils](http://www.gnu.org/software/textutils/textutils.html).  
Windows users can get binary md5 programs from [here](http://www.fourmilab.ch/md5/),
[here](http://www.pc-tools.net/win32/freeware/console/), or
[here](http://www.slavasoft.com/fsum/).

To verify the SHA512 signature on the files, you need to use a program called
e.g. _sha, shasum, sha512sum_ which is included in many unix distributions, MacOS
and Windows.  
  
## Verifying signatures

Signature verification ensures that the file came from a certain person.  We strongly recommend 
you verify your downloads. 
 
The PGP signatures can be verified using tools that implement the [OpenPGP](http://www.pgpi.org/) standard, such as 
[GnuPG](http://www.gnupg.org/).  First download the Apache MyFaces 
[KEYS](https://www.apache.org/dist/myfaces/KEYS) as well as the _asc_ signature file 
for the particular distribution. It is important that you get these files from the ultimate
trusted source - the main ASF distribution site, rather than from a mirror.
Then, to verify the signatures through the gpg command line, use the following command:

```
% gpg --import KEYS
% gpg --verify myfaces-core-X.Y.Z-bin.tar.gz.asc myfaces-core-X.Y.Z-bin.tar.gz
```

More can be read about verifying downloads [here](https://www.apache.org/info/verification.html#CheckingSignatures). 