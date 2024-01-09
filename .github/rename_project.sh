#!/usr/bin/env bash
while getopts a:n:u:d: flag
do
    case "${flag}" in
        a) author=${OPTARG};;
        n) name=${OPTARG};;
        u) urlname=${OPTARG};;
        d) description=${OPTARG};;
    esac
done

echo "Author: $author";
echo "Project Name: $name";
echo "Project URL name: $urlname";
echo "Description: $description";

echo "Renaming project..."

original_author="ketabi"
original_name="my_python_template_2"
original_urlname="my-python-template-2"
original_description="Awesome my_python_template_2 created by ketabi"
# for filename in $(find . -name "*.*") 
for filename in $(git ls-files) 
do
    sed -i "s/$original_author/$author/gI" $filename
    sed -i "s/$original_name/$name/gI" $filename
    sed -i "s/$original_urlname/$urlname/gI" $filename
    sed -i "s/$original_description/$description/gI" $filename
    echo "Renamed $filename"
done

mv my_python_template_2 $name

# This command runs only once on GHA!
rm -rf .github/template.yml
