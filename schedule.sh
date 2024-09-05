#!/bin/bash

#making etl executable
chmod +x etl.sh

#make a cron job to run daily by 12am

(crontab -l; echo "0 0 * * * /bin/bash etl.sh") | crontab -

echo "Cron job schedule to run daily at 12 am"