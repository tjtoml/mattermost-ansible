#!/bin/bash

rm /etc/nginx/sites-enabled/mattermost
ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
service nginx restart
/opt/letsencrypt/letsencrypt-auto renew --quiet --no-self-upgrade
rm /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/mattermost 
/etc/nginx/sites-enabled/mattermost
service nginx restart
