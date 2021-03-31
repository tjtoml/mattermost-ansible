# Maintainer Wanted
If someone would like to take over the maintenance of this repo, please submit an issue or PR. I originally wrote this as a way to learn ansible when I was in college, and no longer have the time/inclination to maintain it now that I have a real job - mostly working with ansible. 

# mattermost-ansible
This is an Ansible Playbook that installs a standalone version of Mattermost, which is an open-source Slack alternative.
This playbook installs Mattermost version 4.3.2 (Team Edition) by default.

It downloads the binary from [mattermost.org](https://www.mattermost.org/download/). If you need to install the Enterprise
edition, consult the Mattermost documentation. This playbook installs
 * `postgresql` - Database Server
 * `nginx` - Web Server (acts as a reverse proxy)
 * SSL certificates are automatically generated from the [letsencrypt](https://letsencrypt.org) project. A cron job is
 created that automatically renews the SSL certificates once a month.

---


This playbook currently works with
- [x] Ubuntu 14.04.5 LTS, Trusty Tahr (DigitalOcean)
- [x] Ubuntu 16.04.2 LTS, Xenial Xerus (DigitalOcean)
- [x] CentOS 6.9  (DigitalOcean)
- [x] CentOS 7.3 (DigitalOcean)
- [x] Red Hat Enterprise Linux 6.9 (Santiago) (Installed from RedHat DVD on a Vultr VPS)
- [x] Red Hat Enterprise Linux 7.3 (Maipo) (Installed from RedHat DVD on a Vultr VPS)
- [ ] Debian 7.11 Wheezy
- [x] Debian 8.8 Jessie (thanks [fgbreel](https://github.com/fgbreel)!)


---
I have no reason to think that versions of these operating systems installed locally or by other providers will not work,
but I have not tested them. If you are going to run into an issue, it will probably be with the firewall, as DigitalOcean
has very permissive firewall rules by default. If you are having an issue, try opening port `80` and `443`.

### Distro Specific Instructions/Info
#### RHEL 6.8
The playbook completely disables the `iptables` firewall. This is not strictly necessary, but I hate `iptables` with my
 whole body and I was tired of fighting with it. If you want or need it, you should re-enable it, but none of the required
 ports will be open. Even better, submit a PR that fixes this issue (so I don't have to do it).

---

## Usage
* Install ansible with your package manager of choice. Ansible can also be installed via `pip`. This playbook was tested with Ansible 2.3.1 If you can, I would recommend running the most recent version of ansible.


* Clone this repository.

* Make sure that the server you are installing Mattermost is properly configured with a FQDN. You should also have root
 access via ssh. Reverse DNS should also be properly configured for letsencrypt to work. If you are using a cloud
 hosting provider, this should be trivial.


* Edit `play.yml` and change the `vars` to reflect any changes you may want to make for your system. This playbook does
not do a complete installation with full configuration of all of the Mattermost options, but rather installs it to the
point where you can edit the relevant settings from within the web browser.


* **You should *always* edit the email address and db_password fields.**


* Create a `hosts` file in the project directory. It only needs to contain one line, which is the IP address of the server
you wish to install Mattermost on.

* Run `ansible-playbook play.yml -i hosts` from the top of level of the project directory.



* Navigate to the FQDN of your server in a web browser. Consult the Mattermost documentation for further configuration
options.

---

## Post-Install
If you are planning to use MatterMost for any length of time, you should probably change the location of the
data directory. A large volume of attached block storage would not be a bad idea. A working email server should also
be configured for email notifications and invites.  You can do most of this from within the browser without manually editing
configuration files.

---

### Contributing
Please submit pull requests! They make my day.

### Moving Forward
I am currently working on porting this standalone playbook into a more defined Ansible role with a complete implementation of all the options in the Mattermost `config` file. You can check on the status of this project [here.](https://github.com/tjtoml/ansible-role-mattermost)
