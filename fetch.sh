#!/bin/bash
# modified for new API from https://lockewatts.medium.com/a-statistical-analysis-of-competitive-dancing-96765d15c01e
# before running, you need to obtain a token (open dev tools and check the payload of a find request) and then
# export token=_xxxxxxxxxxxxxxxx
for count in `seq 1 23119`
do
directory="./points/dancer${count}.txt"
touch $directory
curl --max-time 30 --retry 3 --retry-delay 5 -d "q=$count&_token=${token}" -X POST https://points.worldsdc.com/lookup2020/find >> "$directory"
done

