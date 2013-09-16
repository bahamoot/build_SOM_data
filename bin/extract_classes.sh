features_file=$1
raw_classes_file=$2
output_file=$3

head -1 $raw_classes_file > $output_file
while read line; do
    sample_name=`echo $line | awk '{print $1}'`
    grep $sample_name $raw_classes_file >> $output_file
done < <( grep -v "^dummy" $features_file )
