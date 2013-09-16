join_script_file=/home/jessada/development/scilifelab/assignments/20130911_build_SOM_data/bin/join_Paradigm_result.sh
transpose_script_file=/home/jessada/development/scilifelab/assignments/20130911_build_SOM_data/bin/transpose_matrix.py
zerolize_script_file=/home/jessada/development/scilifelab/assignments/20130911_build_SOM_data/bin/zerolize_features.py
extract_classes_script_file=/home/jessada/development/scilifelab/assignments/20130911_build_SOM_data/bin/extract_classes.sh

input_dir=/home/jessada/development/scilifelab/master_data/TCGA/COAD/Paradigm/
tmp_dir=/home/jessada/development/scilifelab/assignments/20130911_build_SOM_data/tmp

out_join_file=/home/jessada/development/scilifelab/assignments/20130911_build_SOM_data/out/out_join_Paradigm

out_transpose_file=/home/jessada/development/scilifelab/assignments/20130911_build_SOM_data/out/out_transpose

out_zerolize_file=/home/jessada/development/scilifelab/assignments/20130911_build_SOM_data/out/out_zerolize

raw_classes_file=/home/jessada/development/scilifelab/master_data/TCGA/COAD/clinical/TCGA_CRC_Suppl_Table1_Data_20120718.csv
out_extract_classes_file=/home/jessada/development/scilifelab/assignments/20130911_build_SOM_data/out/out_classes


#echo "join paradigm" 1>&2
#bash $join_script_file $input_dir $tmp_dir $out_join_file
#echo "transpose" 1>&2
#python $transpose_script_file $out_join_file $out_transpose_file
echo "zerolize" 1>&2
cmd="python $zerolize_script_file $out_transpose_file $out_zerolize_file"
echo "$cmd" 1>&2
eval "$cmd"
#echo "extract classes" 1>&2
#bash $extract_classes_script_file $out_zerolize_file $raw_classes_file $out_extract_classes_file
