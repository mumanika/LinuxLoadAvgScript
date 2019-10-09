#!/bin/bash

cd /home/LoadAvgScript/Logs
ls -t | tail -n +4 | xargs rm --
