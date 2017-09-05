## Configuration management tools...

* or server configuration management
* or Automation tools
* or server orchestration tools


--
![confuse](../images/confusion.png)


--
<div class="center">
![What](../images/how.gif)
</div>


---
## Some definitions

* Provisioning (by the books)
  * "making an infrastructure element"
  * Getting network device/servers ready to use (installed, configured and registered)
* Orchestration
  * Arranging or coordinating multiple systems
  * Provisioning many servers at once
  * Running same task on many servers at once
  * Setting up a Dynamic Infrastructure Platform
* Configuration Management
  * Part of Provisioning
  * Configure your server repeatedly, consistently, transparent...


---
![overview](../images/overview.png)


---
## Dynamic Infrastructure tools

* Public/Private IaaS, CaaS...
  * Cloud formation (AWS), Terraform, OpenStack (Heat)
  * On-demand
  * Create and destroy immediately (Minutes at the most!)
  * Self-Service
* Specifying what infrastructure resources should be allocated  
* Configuration files describe the components needed to run a single application or your entire datacenter.
* May create servers but is not responsible on whats on them (but could be)
* May pass configuration info to a server configuration tool (network addresses)

(Morris - chapter 2, Should be recap)

--
## Tools requirements

  - Programmable
    - GUI is nice but we want APIs (REST-APIs)
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
    * Transparently, consistently, accurate test instances, version control


---
## How to configure our servers...

  ...in a dynamic infrastructure

  1. Manual Configuration and written documentation
     - Simple and works in very small situations
     - Documentation get easy stale
  2. Some manual, many automation scripts
     - Hard to manage, share, configuration drift, ad-hoc
     - Writing script code that do stuff step-by-step

  3. **Configure the state** rather then step-by-step
     - Out of state with notify the systems
     - Using modern configuration tools
     - Using Domain-specific languages (DSL) instead of script
     - Self-documention


---
## About automation scripts
   * Idempotent
     * The script should be able to execute many times without bad effects
   * Pre-checks, Post-checks
     * Testable
   * Visible failures
     * The team must get the notice
   * Parameterized
   * Big complex system, many script files, hard to manage  


---
## Server change management models

* Ad hoc management
* Configuration synchronization
 * hourly schedules
 * push or pull changes
* **Immutable** Infrastructure
 * Completely replacing servers
 * Changes are made by building new servers
 * Minimal drift between environments
 * Containerized Infrastructure


---
## Server configuration tools
  * Create, provision and update servers - new generation tools
    * Ansible, Chef, Puppet, Salt(Stack)
  * Configuration enforcement
    * Desired state (not step-by-step), prevent configuration drift
  * Enables cooperation
    * One change, updates the whole infrastructure
    * Configuration repository
  * Version control friendly
  * Abstraction, high-level definitions








---
## Configuration Definition files

* Tool-specific files that drives server configuration tools
  * Own DSL (Domain specific languages), not script languages
    * Playbooks, manifest, templates, recipes...

```bash
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
* Declarative vs imperative
  * First do X, then do Y vs. should be Z
  * Clarity, easy to debug
  * Using predefined libraries (working over many platforms)
  * Easy to reuse over different environments - Use parameters


---
## Tools for configuring servers

* Ansible, CFEngine, Chef, Puppet, SaltStack
* Pull model
  * Central repository, agents on every node pulling configuration
* Push model
  * Central server pushing changes (through SSH keys)


---
## Puppet
* Created in 2005
* Open Source, built on top of Ruby
* Requires a central server
* Writing modules and manifests

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
* Created in 2008
* Open source, mostly Ruby
* Written by developers from Puppet
* Writing cookbook and recipes

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
# Ansible
* Created in 2012
* SSH keys, no master server
* Playbooks, using YAML-configurations

```YAML
- hosts: webservers
  vars:
    http_port: 80
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
* Investigate and compare these techniques
* No need to set up, try to present your findings with relevance to the literature
* Explain it as if you were talking to your classmates
* A couple of pages per technique
* Think about one of these you want to use to set up a system in the project assignment


---
<br><br>
<div class="center">
![bye](../images/bye02.gif)
</div>
