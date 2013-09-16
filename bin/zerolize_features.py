import numpy as np
import sys


raw_features_file = sys.argv[1]
output_file = sys.argv[2]

def get_test_features(features):
    no_test_features = 11
    no_test_samples = 9
    out = np.array([features[0][0:no_test_features+1]])
    for idx in xrange(1, no_test_samples+1):
        out = np.append(out, [features[idx][0:no_test_features+1]], axis=0)
    return out

def zerolize(features):
    out = np.array([features[0]])
    for row in features[1:len(features)]:
        content = row[1:len(row)].astype(np.float)
        content[content==0] = 0
        content = np.append([row[0]], [content])
        out = np.append(out, [content], axis=0)
    return out


raw_features = np.genfromtxt(raw_features_file, dtype='str', delimiter="\t")
#raw_features = get_test_features(raw_features)
zerolize_features = zerolize(raw_features)
np.savetxt(output_file, zerolize_features, fmt='%s', delimiter="\t")


