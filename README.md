# mattermost-ansible
This is an ansible playbook that installs a standalone version of mattermost, which is an open-source Slack alternative. Built and tested on Ubuntu 14.04.
## Usage
* Install ansible with your package manager of choice. This playbook was written and tested with Ansible 1.9.3. 


* Clone this repository.

* Make sure that the server you are installing Mattermost is properly configured with a FQDN. You should also have root access via ssh.


* Edit `play.yml` and change the `vars` to reflect any changes you may want to make for your system. This playbook does not do a complete installation with full configuration of all of the Mattermost options, but rather installs it to the point where you can edit the relevant settings from within the web browser. If you are planning to run this in production, it is *strongly* recommended that you do not use the snakeoil certs that the playbook creates. Once you have aquired a signed SSL cert, you can either replace the snakeoil certs in `/etc/nginx/ssl/` or edit `/etc/nginx/sites-available/mattermost` to reflect a custom location. If you run the playbook again, these changes may be overwritten. 

* Create a `hosts` file in the project directory. It only needs to contain one line, which is the IP address of the server you wish to install Mattermost on.

* Run `ansible-playbook play.yml -i hosts` from the top of level of the project directory.

* Navigate to the FQDN of your server in a web browser. Consult the Mattermost documentation for further configuration options. 
