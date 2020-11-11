# HowTo - Split PDFs in separate files



```bash
# all pages as separate files
$ pdfseparate input.pdf output-page%d.pdf

# page 1-5 as separate files
$ pdfseparate -f 1 -l 5 input.pdf output-page%d.pdf

```


----
## Links
* https://superuser.com/questions/345086/split-pdf-document-from-command-line-in-linux