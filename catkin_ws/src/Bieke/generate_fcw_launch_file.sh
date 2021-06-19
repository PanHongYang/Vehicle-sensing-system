#!/bin/bash

echo "The raw json file is: gpal_fcw_20190604.json"

python src/tf_calibration/utils/calibJson2Launch.py --file src/tf_calibration/launch/dataset/gpal_fcw_20190604.json > src/tf_calibration/launch/dataset/gpal_fcw_20190604.launch

python src/tf_calibration/utils/calibJson2Launch.py --file src/tf_calibration/launch/dataset/gpal_fcw_20190604.json > gpal_fcw_20190604.launch

echo "Generated launch file is: gpal_fcw_20190604.launch"

