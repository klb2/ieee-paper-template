#!/bin/sh

templatePath=$(dirname "$(realpath $0)")
newPaperDir="$1"
if [ -a "$templatePath/config.json" ]; then
	configFile="$templatePath/config.json"
else
	configFile="$templatePath/config_default.json"
fi

mkdir -p "$newPaperDir"
mkdir "$newPaperDir/figures"

strings=(
	"main.tex"
	"setup-*.tex"
	"acronyms.tex"
	"literature.bib"
	".gitignore"
	"Makefile"
)
for i in "${strings[@]}"; do
    echo "Copying file: $i"
	cp -u "$templatePath/"$i "$newPaperDir"
done

currDir=$(pwd)
cd "$newPaperDir"

echo "Inserting default values..."
replace=(
	"author"
	"affiliation"
	"funding"
)
for i in "${replace[@]}"; do
	echo "Replacing $i from $configFile"
	replacement=$(jq -r ".$i" $configFile)
	replacement=$(echo "$replacement" | sed 's/\\/\\\\/g')
	sed -i -e 's={{'"$i"'}}='"$replacement"'=g' main.tex
done
git init
git add .
git commit -m "Initial commit"
cd "$currDir"
