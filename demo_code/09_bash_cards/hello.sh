echo "Downloading Hansards $1 to $2"

for (( n=$1; n<=$2; ++n )); do
    han=$(printf "%03d" $n)
    curl -O https://www.ourcommons.ca/Content/House/451/Debates/$han/HAN$han-E.XML
done

echo "Done"