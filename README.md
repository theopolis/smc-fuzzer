## SMC Fuzzer

*devnull*'s SMC read/write code, along with simple fuzz options.

### Help / Usage

```
$ ./smc -h
Apple System Management Control (SMC) tool 1.01
Usage:
./smc [options]
    -q         : attempt to determine 'hidden' keys
    -z         : fuzz all possible keys (or one key using -k)
    -f         : fan info decoded
    -h         : help
    -k <key>   : key to manipulate
    -l         : list all keys and values
    -r         : read the value of a key
    -w <value> : write the specified value to a key
    -v         : version
 ```

### Discover unreported keys

Use the `-q` switch to brute force discover ((125-33)^4) readable keys.

#### Results

On a few Mac Pros this has found:

```
  CRDP  [flag]  (bytes 00)
  FPOR  [ch8*]  (bytes 00 00 00 00 00 00 00 00)
  KPPW  [ch8*]  (bytes 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00)
  KPST  [ui8 ]  0 (bytes 00)
  MOJO  [ch8*]  (bytes 00)
  MSSN  [ui16]  5 (bytes 05)
  OSK0  [ch8*]
  OSK1  [ch8*]
  zCRS  [ui8 ]  (bytes 00)
```

`OSK0` and `OSK1` are the 64-byte [binary protection key](http://osxbook.com/book/bonus/chapter7/tpmdrmmyth/).

### A bad time

Changing simple values as the super user will halt your machine.
Example: if you set `DSUB` to `1` your machine will instant-halt.

```
$ make
$ sudo ./smc -z
```

### A disappointing time

No value should be writable as a non-privileged user.

```
$ make
$ ./smc -z
```


