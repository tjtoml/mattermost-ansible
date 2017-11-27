# mattermost-ansible
This repository contains several playbooks that will allow for the quick, automated
install of Mattermost, which is an open-source, self-hosted alternitave to Slack.

All of these playbooks implement my ansible role [tjtoml.mattermost](https://github.com/tjtoml/ansible-role-mattermost).
Most development will take place in that repository, while this one will be maintained
to demonstrate the usage of the role and provide quick and easy installs for people
wishing to try out Mattermost.

## Prerequisites
* A server with a FQDN configured: `mattermost.example.com`, `www.example.com`, etc.
* If you want to use letsencrypt, you will need reverse DNS configured. Check it for your server [here](https://www.whatismyip.com/reverse-dns-lookup/).
* Internet Access
* Root access to the server, either directly or via `sudo`.
* `ansible 2.4` or newer (`pip install ansible`). This can be installed on your
local machine that has access to the server via ssh, or on the server itself.

## Usage
Clone this repository.
First, decide what type of install you would like to perform:
* If you just want to try Mattermost out, and aren't planning on using it for any length of time, use `quickAndDirty.yml`.
* If you don't have a local install of ansible and need insall Mattermost on the same machine that runs ansible, use `local.yml`
* To install a ready to use MatterMost server with an SSL cert from letsencrypt, use `production.yml`. (This is intended more as a jumping-off point than an actual production install.)

Then,

```
ansible --version                          ## Should return 2.4.1 or higher

ansible-galaxy install -r requirements.yml

echo "[[your_servers_fqdn]]" >> hosts      ## Use localhost for local install

ansible-playbook [[selected_playbook]]
```
After the install completes, navigate to the FQDN of your server in a web browser.
Mattermost should be ready to use.

## Advanced
For a complete listing of all available variables and their default values, see [`defaults/main.yml`](https://github.com/tjtoml/ansible-role-mattermost/blob/v4.3.2/defaults/main.yml) in the role repository.


## Contributing
Please submit pull requests! They make my day.
