# Check if we're running inside GitHub Actions
if [ -n $CI ]; then
    # back up the lectures folder
    cp -r content/lecture lecture_tmp
fi

# Remove shortcodes, _index, and draft lectures
# also remove blockquote hints
rm content/lecture/_index.md
for doc in content/lecture/*.md; do 
    if grep -q "draft:\s*true" $doc; then
        rm $doc
    else
        sed -i 's!{{%.*%}}!!g' $doc
        sed -r 's/> \[\!(NOTE|TIP|IMPORTANT|WARNING|CAUTION)\]//g' -i $doc
    fi
done

# Convert to PDF
npx @marp-team/marp-cli@latest --theme assets/marp-mru.css --input-dir content/lecture --allow-local-files --pdf --html -o static/slides

# Replace image paths
# temporarily replace paths to ../../static to point to ../
for doc in `ls content/lecture/*.md`; do
    sed -i 's!../../static/!../!g' $doc
done

# Convert to HTML
npx @marp-team/marp-cli@latest --theme assets/marp-mru.css --input-dir content/lecture/ --allow-local-files --bespoke.progress --html -o static/slides

# Restore the original lectures folder
if [ -n $CI ]; then
    rm -rf content/lecture
    mv lecture_tmp content/lecture
fi