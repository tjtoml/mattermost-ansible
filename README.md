# mattermost-ansible
This is an ansible playbook that installs a standalone version of mattermost, which is an open-source Slack alternative. Built and tested on Ubuntu 14.04. This playbook installs Mattermost version 3.2.0 (Team Edition) by default which was the most current at the time of writing. It downloads the binary from [mattermost.org] (https://www.mattermost.org/download/). If you need to install the Enterprise edition, consult the mattermost documentation. 
## Usage
* Install ansible with your package manager of choice. This playbook was written and tested with Ansible 2.1.0. If you can, I would recommend running the most recent version of ansible.  


* Clone this repository.

* Make sure that the server you are installing Mattermost is properly configured with a FQDN. You should also have root access via ssh.


* Edit `play.yml` and change the `vars` to reflect any changes you may want to make for your system. This playbook does not do a complete installation with full configuration of all of the Mattermost options, but rather installs it to the point where you can edit the relevant settings from within the web browser. 


* **You should *always* edit the email address and db_password fields.** 


* Create a `hosts` file in the project directory. It only needs to contain one line, which is the IP address of the server you wish to install Mattermost on.

* Run `ansible-playbook play.yml -i hosts` from the top of level of the project directory.



* Navigate to the FQDN of your server in a web browser. Consult the Mattermost documentation for further configuration options. 
