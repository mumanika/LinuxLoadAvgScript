# LinuxLoadAvgScript
Shell scripts that compute the load average of systems

####################### Load Average Script ###########################

Steps to run the script: 
1. Place the files LoadAverageScript.sh, ClearLogs.sh and UserInput.sh in a convenient directory. 
2. Run the UserInput.sh script using the command "sudo <path_to_script>/UserInput.sh" or "sudo ./UserInput.sh" if you are in the same directory where the script is placed.
   The reason for giving root privileges to this program is to allow it to create a directory for the log files to be written in by the load average measuring script. 
3. Run the load average measuring script using the command "sudo <path_to_script>/LoadAverageScript.sh" or "sudo ./LoadAverageScript.sh" if you are in the same directory where the script is placed.
   Again the root privileges are needed for the script in order for it to create a file and write to the /home/LoadAvgScript/ directory that was created in step 2. 
4. You can retrieve the logs from /home/LoadAvgScript/ directory. 


Steps to add the scripts to crontab: 
1. Since the script will need root privileges, we will be installing the cronjob in the root user space. Switch to the root user using the command "su root".
2. In order to insert the cronjob, enter the command "crontab -l". Once here, you will need to press the key "i", and enter the following lines: 
*/15 * * * * /home/LoadAverageScript.sh



0 * * * * /home/ClearLogs.sh

Once done, press the escape key, and then the ":" key. Type in "wq!" and hit enter.
3. That's it, you can now check the /home/LoadAvgScript/ directory for the logs. However, note that the logs will be lost after the hour since there is a log cleaning script that is being run as part of the cron job. 

####################### Load Average Script ###########################

