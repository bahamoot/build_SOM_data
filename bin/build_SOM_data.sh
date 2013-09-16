join_script_file=/home/jessada/development/scilifelab/assignments/20130911_build_SOM_data/bin/join_Paradigm_result.sh
transpose_script_file=/home/jessada/development/scilifelab/assignments/20130911_build_SOM_data/bin/transpose_matrix.py
extract_classes_script_file=/home/jessada/development/scilifelab/assignments/20130911_build_SOM_data/bin/extract_classes.sh

input_dir=/home/jessada/development/scilifelab/master_data/TCGA/COAD/Paradigm/
tmp_dir=/home/jessada/development/scilifelab/assignments/20130911_build_SOM_data/tmp
tmp_join_result="$tmp_dir/tmp_join"
join_output_file=/home/jessada/development/scilifelab/assignments/20130911_build_SOM_data/out/out_join_Paradigm
raw_classes_file=/home/jessada/development/scilifelab/master_data/TCGA/COAD/clinical/TCGA_CRC_Suppl_Table1_Data_20120718.csv
classes_output_file=/home/jessada/development/scilifelab/assignments/20130911_build_SOM_data/out/out_classes


echo "join paradigm" 1>&2
bash $join_script_file $input_dir $tmp_dir $tmp_join_result
echo "transpose" 1>&2
python $transpose_script_file $tmp_join_result $join_output_file
echo "extract classes" 1>&2
bash $extract_classes_script_file $join_output_file $raw_classes_file $classes_output_file
