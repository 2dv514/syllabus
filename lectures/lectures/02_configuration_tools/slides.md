<!-- Content -->

---
## So configuration management tools...

or server configuration management
or Automation tools
or server orchestration

--
![confuse](../images/confusion.png)


--

![What](../images/how.gif)

---
## Some words

* Provisioning
  * Getting host/servers to use (installed and ready)
* Orchestration
  * Arranging or coordinating multiple systems
  * Running same task on many servers at once
* Configuration Management
  * Part of Provisioning
  * Configure your server Repeatedly


---
![overview](../images/overview.gif)

---
## Dynamic Infrastructure Platform

* public/private IaaS, CaaS...
* Programmable
  * GUI is nice but we want APIs (REST-APIs)
* On-demand
  * Create and destroy immediately (Minutes at the most!)
* Self-Service
  * Customize the resources for own use (vs. central solutions)
  * IaC gives the alternative to automatically create network-, compute and storage resources
    * Compute resource => servers
    * storage resources - Block storage, Object storage, Network filesystems
    * Network resources - Internal and external networks

(Morris - chapter 2)


---
# Infrastructure Definitions tools

Specifying what infrastructure resources should be allocated
Cloud formation (AWS), Terraform, OpenStack Heat
Configuration files describe the components needed to run a single application or your entire datacenter.
May create servers but is not responsible on whats on them
May pass configuration info to a server configuration tool (network addresses)

Some requirements:
- Scriptable & Powerful command-line tools
  * CLI that is easy to script
  * Take input from other tools (stdin, environment variables, command-line parameters)
  * Output should be able to be used by other tools
  * Like a Unix CLI
- Support for unattended execution
  * No manual steps in the scripts, avoid ad Hoc solutions
  * Triggable scripts, notifications
    * testable, auto-scaling and recovery routines
- Externalized configurations
  * Treated as software source code
  * Transparently, consistently, accurate test instances
  * version control


---
## About scripts

* Idempotent
  * The script should be able to execute many times without bad effects
* Pre-checks, Post-checks
* Visible failures
  * The team must get the notice
* Parameterized


## Configuration Definition files

* Tool-spcific files that drives infrastructure automation tools
  * Playbooks, manifest, templates...
* Own DSL (Domain specific languages)

```bash
#!/bin/bash
  sudo useradd -m EllenNu -p PASSWORD
  sudo usermod -a -G students EllenNu
```

```yaml
user "EllenNu"
  state active
  gid   "students"
  home  "/home/ellennu"
  shell "/bin/csh"
```
* clarity, easy to debug
* Using predefined libraries (working over many platforms)
* Easy to reuse over different environments - Use parameters
* Declarative vs imperative
  * First do X, then do Y
  * Should be Z

---
## Server configuration tools
* Create, provision and update servers - new generation tools

goals

* Configuration enforcement
  * Desired state, prevent configuration drift
* Enables cooperation
  * One change, updates the whole infrastructure
  * Configuration repository
* Version control friendly
* Abstraction

* New servers can be provisioned on demand without waiting
* Provisioned without human involvement
* When server is changed, it should be applied without human envolvment
* Automated testing is run with every changed
* Change are repeatable, consistent, self-documented and Transparently
*  changes is reflected to all servers it is relevant for.

---
## Tools for configuring servers

* Ansible
* CFEngine
* Chef
* Puppet
* SaltStack

Pull model: Central repository, agents on every node pulling configuration
Push model: Central server pushing changes (through SSH keys)

---
## How to configure our servers
In a dynamic infrastructure

1. Manual Configuration and written documentation
   - Simple and works in very small situations
   - Documentation get easy stale
2. Some manual, many small scripts
   - Hard to manage, share, configuration drift, ad-hoc
   - Writing script code that do stuff step-by-step
3. Configure the state rather then step-by-step
   - Out of state with notify the systems
   - Using modern configuration tools
   - Using Domain-specific languages (DSL) instead of script
   - Self-documention

---
<!-- DevOps -->
## Infrastructure definition tools

* Orchestration
* Cloud computing

--
#Configuration register


---
## Server configuration tools
* State of the server

## Image of different tools


--
## List of prefereables

* Repeatable
* Testable
* reusable
* self-documenting


--
# Scriptable Interface


--
## Support for unattended executions


--
## Conf definition files

--


---
## Server change management models

* Ad hoc management
* Configuration synchronisation
  * hourly schedules for Examples
  * push or pull changes
* Immutable Infrastructure
  * Completely replacing servers
  * Changes are made by building new servers
  * Minimal drift between environments
  * Containerized Infrastructure


---
## Puppet
Created in 2005
Open Source, built on top of Ruby
Requires a central server
Writing manifests

```Ruby
node 'host2' {
  class { 'apache': }             # use apache module
  apache::vhost { 'example.com':  # define vhost resource
    port    => '80',
    docroot => '/var/www/html'
  }
}

```
--
## Chef
Created in 2008
Open source, mostly Ruby
Written by developers from Puppet
Writing cookbook and recipes

```Ruby
include_recipe "apache2"
include_recipe "mysql::client"
include_recipe "mysql::server"
include_recipe "php"
include_recipe "php::module_mysql"
include_recipe "apache2::mod_php5"

apache_site "default" do
  enable true
end

```


--
#Ansible
Created in 2012
SSH keys, no master server
Playbooks
Using YAML-configurations

```YAML
---
- hosts: webservers
  vars:
    http_port: 80
    max_clients: 200
  remote_user: root
  tasks:
  - name: ensure apache is at the latest version
    yum: name=httpd state=latest
  - name: write the apache config file
    template: src=/srv/httpd.j2 dest=/etc/httpd.conf
    notify:
    - restart apache
  - name: ensure apache is running (and enable it at boot)
    service: name=httpd state=started enabled=yes
  handlers:
    - name: restart apache
      service: name=httpd state=restarted
```


---
## Written Report
Dont set up, try to present your findings with relevance to the literature
