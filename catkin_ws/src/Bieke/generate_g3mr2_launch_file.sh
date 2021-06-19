#!/bin/bash

echo "The raw json file is: gpal_g3mr2_20190604.json"

python src/data_collection/tf_calibration/utils/calibJson2Launch.py --file src/data_collection/tf_calibration/launch/dataset/gpal_g3mr2_20190604.json > src/data_collection/tf_calibration/launch/dataset/gpal_g3mr2_20190604.launch

python src/data_collection/tf_calibration/utils/calibJson2Launch.py --file src/data_collection/tf_calibration/launch/dataset/gpal_g3mr2_20190604.json > gpal_g3mr2_20190604.launch

echo "Generated launch file is: gpal_g3mr2_20190604.launch"

