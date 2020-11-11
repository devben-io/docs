# Rename Files

## Capital Case
```bash
for f in *; do 
    mv "$f" "$(perl -lpe 's/.*/lc($&)/e; s/(^| )./uc($&)/ge' <<<"$f")"
done
```

## Remove Prefixes
for `bla_` prefix. e.g. `bla_file1.txt`, `bla_file2.txt`
```bash
for file in bla_*; do mv "$file" "${file#bla_}"; done;
```