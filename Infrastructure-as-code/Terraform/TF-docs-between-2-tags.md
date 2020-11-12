# TF-Docs between 2 Tags
* for preserving custom docs, but using generated terraform-docs

```bash
#! /bin/bash

# this script puts the generated terraform-docs between 2 tags
#
## <!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## <generated content>
##<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
FILENAME="README.md"


add_tags(){
    echo -e "\n\n# Terraform Docs\n<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->\n<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->" >> $i/${FILENAME} 
}

create_docs(){
    TMP0=$(mktemp)
    TMP1=$(mktemp)

    echo -n "Create tf-docs for $i %" > $TMP1
    awk "
    BEGIN       {p=1}
    /^<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->/   {print;system(\"terraform-docs markdown table --no-sort ./$i\");p=0}
    /^<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->/     {p=1}
    p" ${i}/${FILENAME} > ${TMP0} &&
    mv ${TMP0} ${i}/${FILENAME} &&
    echo -e "[${GREEN}OK${NC}]" >> $TMP1 || echo -e "[${RED}ERROR${NC}]" >> $TMP1
    awk -F% '{ print $2 "\t" $1}' $TMP1
    rm $TMP1
    # echo "DEBUG | create_docs"
}




for i in $(ls -d */); do
    if grep '<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->' $i/${FILENAME} > /dev/null; then
        create_docs
    else
        add_tags
        create_docs
    fi
done



```
