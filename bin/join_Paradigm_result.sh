input_dir=$1
tmp_dir=$2
output_file=$3

get_sample_name() {
    header=$(head -1 $1)
    sample_suffix=${header#>}
    sample_name=${sample_suffix%-*-*}
    echo $sample_name
}

get_sample_properties() {
    grep -v "^>" $1
#    grep -v "^>" $1 | head -12
}

concat_header() {
    printf "%ls\t%ls" "$1" "$2"
}

if [ -f $tmp_dir/"tmp_merge_001" ];
then
    rm $tmp_dir/*
fi

count=1
header="dummy"
#for gene_file in $input_dir/paradigm_out_*
#for gene_file in $input_dir/paradigm_out_2*
for gene_file in $input_dir/paradigm_out_1*
do
    file_idx=$( printf "%03d" $count )
    last_tmp_file=$current_tmp_file
    current_tmp_file=$tmp_dir/"tmp_merge_"$file_idx
    sample_name=$(get_sample_name $gene_file)
    if [ $count -eq 1 ]
    then
        get_sample_properties $gene_file > $current_tmp_file
    else
        fields="1.{2..$count}"
        eval " join -t $'\t' -j1 -a1 -a2 -e NA -o 0 $fields 2.2 <( cat $last_tmp_file ) <( get_sample_properties $gene_file )"  > $current_tmp_file
    fi
    header=$(concat_header "$header" "$sample_name")
    let count++
done

echo "$header" > $output_file
cat $current_tmp_file | sed s/NA/0/g >> $output_file
