# gra query

An example of using XQuery for getting `%gra` information in CHAT XML file.

## Run

Tested with [Saxon](http://saxon.sourceforge.net/)-HE 9.6.05J
installed on Mac OS X with Homebrew.

```
$ java -cp /usr/local/opt/saxon/libexec/saxon9he.jar \
  net.sf.saxon.Query -q:sample.xq -s:gra.xml
```
