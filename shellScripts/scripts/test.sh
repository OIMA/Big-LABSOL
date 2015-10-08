regexResult=$(cat /proc/cpuinfo | grep '\<cpu cores' | grep -o -m 1 [0-9.]*)
python yarn-utils.py -c $regexResult -m 5 -d 1
