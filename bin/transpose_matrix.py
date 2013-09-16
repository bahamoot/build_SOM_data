import numpy as np
import sys


def filter_zeros_features(join_result):
    #print join_result
    out = np.array([join_result[0]])
    for row in join_result[1:len(join_result)]:
        passed = False
        features = row[1:len(row)].astype(np.float)
        #print
        #print row
        for feature in features:
            if feature != 0:
                passed = True
                break
        if passed:
            #print row
            out = np.append(out, [row], axis=0)
    return out


raw_join_paradigm_result_file = sys.argv[1]
output_file = sys.argv[2]

join_result = np.genfromtxt(raw_join_paradigm_result_file, dtype='str', delimiter="\t")
join_result = filter_zeros_features(join_result)
np.savetxt(output_file, join_result.T, fmt='%s', delimiter="\t")


