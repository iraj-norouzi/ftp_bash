#!/bin/bash

##############################
##    daily_upload_ftp.sh   ##
##        Version 0.3       ##
##############################
## This program upload IBSng complete backup
## to a ftp server. in ibsng-tools 19.5 and later upload backups to
## a ftp server DON'T work. for this reason i written this script.
## for any question about this program contact to:
## support-team@parspooyesh.com

#####################
##  Notifications  ##
#####################
# ebteda check konid ke server roozane dar che sa'ati full backup
# migirad, config an ra mitavanid dar file /etc/cron.d/ibs_backup moshahede konid.
# hala upload backup be ftp server ra mitavanid 1 ela 2 sa'at bad tanzim konid, ta
# motmaen shavid backup va ftp tadakhol nadashte bashand.
# make a directory in ftp server same as complete directory in /var/backups/IBSng/ .

#######################
##  Initializations  ##
#######################
# Complete backups
ftp_ip="188.136.200.211"
ftp_user="ibsng"
ftp_pass="@B^cupIBS96614"
ftp_backup_dir="/IBSng/complete/"

# IBSng backup complete directory
IBSng_bup_dir="/var/backups/IBSng/complete/"

####################################################
#          Upload Complete backup to Server        #
####################################################

# Last backup from IBSng complete database
last_backup=$(cat /var/backups/IBSng/complete/pre_end)

# keep last backup date ( log )
last_backup_date="/var/log/last_backup_date.log"
echo "####################################" >> $last_backup_date
echo -e "last complete backup is in '${last_backup}' directory." >> $last_backup_date
echo "        $(date +%Y-%m-%d_%H-%M)         " >> $last_backup_date
echo "####################################" >> $last_backup_date
echo "Starting upload complete backup in $(date +%Y-%m-%d_%H-%M)" >> $last_backup_date

# upload backup to ftp server
curl -T $IBSng_bup_dir$last_backup/IBSng_dump ftp://${ftp_ip}/${ftp_backup_dir}/${last_backup}/ --user ${ftp_user}:${ftp_pass}

# Continue keep last backup date ( log )
if [ "$?" == "0" ]; then
  echo "Uplade complete backup to Server '${ftp_ip}' Successfully $(date +%Y-%m-%d_%H-%M)." >> $last_backup_date
  echo "---------------------------------------" >> $last_backup_date
  echo -e "\n" >> $last_backup_date
else
   echo "Upload complete backup to server '${ftp_ip}' Failed." >> $last_backup_date
   echo -e "\n" >> $last_backup_date
fi

# upload last backup date to ftp server
#curl -T $last_backup_date ftp://${ftp_ip}/${ftp_backup_dir}/ --user ${ftp_user}:${ftp_pass}

#####################
#  Initializations  #  
#####################
# Custom backups
ftp_ip_custom="188.136.200.211"
ftp_user_custom="ibsng"
ftp_pass_custom="@B^cupIBS96614"
ftp_backup_dir_custom="/IBSng/custom/"

# IBSng backup complete directory
IBSng_bup_dir_custom="/var/backups/IBSng/custom/"

####################################################
#          Upload Complete backup to Server        #
####################################################

# Last backup from IBSng custom database
last_backup_custom=$(cat /var/backups/IBSng/custom/pre_end)

# keep last backup date ( log )
last_backup_date="/var/log/last_backup_date.log"
echo "####################################" >> $last_backup_date
echo -e "last custom backup is in '${last_backup_custom}' directory." >> $last_backup_date
echo "        $(date +%Y-%m-%d_%H-%M)         " >> $last_backup_date
echo "####################################" >> $last_backup_date
echo "Starting upload custom backup in $(date +%Y-%m-%d_%H-%M)" >> $last_backup_date

# upload backup to ftp server
curl -T $IBSng_bup_dir_custom$last_backup_custom/IBSng_dump_$(date +"%Y_%m_%d").custom  ftp://${ftp_ip_custom}/${ftp_backup_dir_custom}/${last_backup_custom}/ --user ${ftp_user_custom}:${ftp_pass_custom}

# Continue keep last backup date ( log )
if [ "$?" == "0" ]; then
  echo "Uplade hourly backup to Server '${ftp_ip}' Successfully $(date +%Y-%m-%d_%H-%M)." >> $last_backup_date
  echo "---------------------------------------" >> $last_backup_date
  echo -e "\n" >> $last_backup_date
else
   echo "Upload hourly backup to server '${ftp_ip}' Failed." >> $last_backup_date
   echo -e "\n" >> $last_backup_date
fi

# upload last backup date to ftp server
#curl -T $last_backup_date_custom ftp://${ftp_ip_custom}/${ftp_backup_dir_custom}/ --user ${ftp_user_custom}:${ftp_pass_custom}

#####################
#  Initializations  #  
#####################
# Hourly backups
#ftp_ip_hourly_hourly=""
#ftp_user_hourly_hourly=""
#ftp_pass_hourly_hourly=""
#ftp_backup_dir_hourly="/ftp_shares/hourly/IBSng"

# IBSng backup complete directory
#IBSng_bup_dir_hourly="/var/backups/IBSng/hourly/"

####################################################
#          Upload Complete backup to Server        #
####################################################

# Last backup from IBSng complete database
#last_backup_hourly=$(cat /var/backups/IBSng/hourly/pre_end)

# keep last backup date ( log )
#last_backup_date="/var/log/last_backup_date.log"
#echo "####################################" >> $last_backup_date
#echo -e "last hourly backup is in '${last_backup_hourly}' directory." >> $last_backup_date
#echo "        $(date +%Y-%m-%d_%H-%M)         " >> $last_backup_date
#echo "####################################" >> $last_backup_date
#echo "Starting hourly backup in $(date +%Y-%m-%d_%H-%M)" >> $last_backup_date

# upload backup to ftp server
#curl -T $IBSng_bup_dir_hourly$last_backup_hourly/IBSng_dump ftp://${ftp_ip_hourly}/${ftp_backup_dir_hourly}/${last_backup_hourly}/ --user ${ftp_user_hourly}:${ftp_pass_hourly}

# Continue keep last backup date ( log )
#if [ "$?" == "0" ]; then
#  echo "Uplade hourly backup to Server '${ftp_ip_hourly}' Successfully $(date +%Y-%m-%d_%H-%M)." >> $last_backup_date
#  echo "---------------------------------------" >> $last_backup_date
#  echo -e "\n" >> $last_backup_date
#else
#   echo "Upload hourly backup to server '${ftp_ip_hourly}' Failed." >> $last_backup_date
#   echo -e "\n" >> $last_backup_date
#fi
#
# upload last backup date to ftp server
#curl -T $last_backup_date_hourly ftp://${ftp_ip_hourly}/${ftp_backup_dir_hourly}/ --user ${ftp_user_hourly}:${ftp_pass_hourly}


