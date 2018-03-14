# INSTALL


## before you beginn
- clone the repo
```
git clone https://github.com/dtnpnk/docs
```

- install dependencies
```
npm install gitbook
npm install gitbook-cli
ebook-convert
gitbook install         # installs Plugins and dependencies from the book.json
```

## static site 
- build static site to `_book` as source for a webroot
```
gitbook build
```

## run locally 
```
gitbook serve --port 4000./
```


## export as {pdf,epub,mobi}
```
gitbook pdf ./
gitbook epub ./
gitbook mobi ./
```
