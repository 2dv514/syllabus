## Content

* About automation
  * Principles and patterns
* Configuration management/provisioning tools
  * Requirements
  * Examples



---
## Automation

<div>
![automation](../images/automation_comic.png)
</div><!-- {_class="center"} -->

Source: https://xkcd.com/1319/



--
## Some automation principles
* Left-over principle
  * Automate everything you can - with reason!
* Compensatory Principle<!-- {_class="fragment"} -->
  * Fitt's list (1951) of attributes "decides" what to automate
* The Complementary Principle<!-- {_class="fragment"} -->
  * More from human perspective. Analyze how people solve tasks and complement with automation
  * Give human the knowledge of tasks before automating it
* Automation bring stability to the system but can take away the skills maintaining the systems<!-- {_class="fragment"} -->   
* Automation programmers?<!-- {_class="fragment"} -->

Source: The practice of cloud system administration

<!-- {_style="text-align: right; font-size:70%"} -->


--
### When talking about automation scripts
  * Idempotent
   * The script should be able to execute many times without bad effects
  * Pre-checks, Post-checks<!-- {_class="fragment"} -->
   * Testable
  * Visible failures <!-- {_class="fragment"} -->
   * We must know!
  * Parametrized <!-- {_class="fragment"} -->
    * Do not hard code stuff
  * Big complex system, many script files, hard to manage, API versioning <!-- {_class="fragment"} -->
    * Manage code... 


---
## Automation...

  ...in a dynamic infrastructure

  * Manual Configuration and written documentation
    * Simple and (only?) works in very small situations
    * Documentation get easy stale
    * Configuration drift, snowflake servers and so on...
  * Some manual, many automation scripts<!-- {_class="fragment"} -->
     - Hard to manage, share, ad-hoc
     - May need lots of written documentation
  * Configure the state rather then step-by-step<!-- {_class="fragment"} -->
     - Out of state with notify the systems
     - Using modern provisioning/configuration tools
     - Using Domain-specific languages (DSL) instead of scripts
     - Self-documentation!



--
## Handling automated updates...

* Configuration synchronization
 * "Hourly" schedules
* Immutable Infrastructure <!-- {_class="fragment"} -->
 * Completely replacing servers
 * Changes are made by building new servers
 * Minimal drift between environments
 * Containerized Infrastructure



---
## Tools for IaC
  * Create, destroy, configure and update infrastructure - new generation tools
  - Programmable <!-- {_class="fragment"} -->
    - We want APIs or declarative languages
      * Triggable scripts, notifications
      * Testable and recovery routines
  - Support for unattended execution<!-- {_class="fragment"} -->
    * No manual steps in the scripts
  - Externalized configurations<!-- {_class="fragment"} -->
  * Define desired state, prevent configuration drift<!-- {_class="fragment"} -->
  * Enables collaboration <!-- {_class="fragment"} -->
    * Version control friendly
    * Configuration repository 
  * Strive for abstraction, high-level definitions<!-- {_class="fragment"} -->



--
## Configuration Definition files

* Tool-specific files that drives server configuration tools
  * Own DSL (Domain specific languages), not script languages
    * Playbooks, manifest, templates, recipes...

```bash
sudo useradd -m EllenNu -p PASSWORD
sudo usermod -a -G students EllenNu
``` 
<!-- {_class="fragment"} -->
```yaml
user "EllenNu"
  state active
  gid   "students"
  home  "/home/ellennu"
  shell "/bin/csh"
```
<!-- {_class="fragment"} -->
* Declarative vs imperative <!-- {_class="fragment"} -->
  * First do X, then do Y vs. should be Z
  * Using predefined libraries/providers (working over many platforms)
  * Easy to reuse over different environments - Use parameters


---
### Configuration management tools
* Designed to install and manage software on existing servers
* Ansible, Chef, Puppet, SaltStack...<!-- {_class="fragment"} -->
* Pull model<!-- {_class="fragment"} -->
  * Central repository, agents on every node pulling configuration
* Push model<!-- {_class="fragment"} -->
  * Central server pushing changes (through SSH keys)

<img src="../images/CMTlogos.jpg" width="35%" />

<!-- {_class="center"} -->


--
### Provisioning tools
* Designed to build your infrastructure (servers, load balancers, databases, networking configuration, etc)
  * Leaving the job of configuring those servers to other tools.
* CloudFormation and Terraform<!-- {_class="fragment"} -->


--
## Tools for IaC
* These two categories are not exact definitions
  * Most configuration management tools can do some provisioning and most provisioning tools can do some configuration management. 
  * Docker (or Packer), the most configuration management are taken care of. With Docker and Packer<!-- {_class="fragment"} -->
    * Images with configured software



---
<br><br>
<div class="center">
![bye](../images/bye02.gif)
</div>
