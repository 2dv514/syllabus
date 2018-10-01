### Contents

* Some content will also be accessed in 2DV611, Continuous Delivery
* Software Engineering Practices for operating infrastructure
  * System quality
  * VCS for infrastructure
    * Branching
    * Handling features/changes
* Testing the infrastructure
  * Test pyramid
  * Operational qualities
* Continuous availability
* Prepare for **when** things go wrong


---
#### Software Engineering Practices for infrastructure
* Chapter 10
* Use proven tools and strategies to build quality into the process
* Expect that the system and its requirements will change
* Start delivering working, useful code fast
  * Continuous delivering necessary and simple increments
* Ensure that each change is well tested
  * Get fast feedback on every change
* ...Agile manifesto


--
#### What is system quality?

> The true measure of the quality of a system, and its code, is how quickly and safely changes are made to it

* The tools (or language or framework) doesn't make the quality any better by it self
* Easy to understand, simple to change, fast feedback from problems.
* Minimal required documentation

Note:
Code that are difficult to understand is difficult to change<br>
New to team should understand - first day, code into production<br>
Minimal documentation


--
#### CI and CD for infrastructure

* Continuous testing changes made to definition files, scripts and other configuration files written for the infrastructure.
  * Managed by the VCS
* Make sure everything "always" is production ready
* Testing the whole infrastructure
  * Change pipeline for infrastructure
  * Increases level of complexity from when just talking applications
  * Test environment should be the same (looked down) as production
* Chapter 12 & 13 - Save the most for next course


Note: Looked down - security levels


--
#### VCS for infrastructure

* Everything but artifacts that can be build from the code already in the VCS repository, data, log files, passwords, security secrets.
* Not only version control - Work processes in the team
  * Many team members - how to check in code
  * Coordinate changes
* Branching
  * Make a branch to keep work isolated
  * Lots of different branch patterns
    * feature branching, release branching...
  * Never have long-lived branches
* Continuous Integration
  * All work is committed to the trunc, fully tested and working in production.
  * Merge code as fast as possible to detect problems fast (with tests)


Note: uncomet tests, timepressure...


--
#### Manage major infrastructure changes
* Delivering complex systems in an agile way
  * Break down into smaller changes (can´t always be done)
* Parallel systems, old and new
  * Slowly replaces old system  
  * Start with "non-critical services"  
  * Select "candidate-service"


--
#### Patterns for Zero-Downtime
* Blue-Green replacement
* Phoenix replacement
  * Impractical on bigger infrastructures
    * Sub-sections, loosely coupled services
* Canary replacement



--
#### Blue-Green replacement
![Blue-Green](../images/blue-green.png)

* Two instances - One for testing, one for production
* Switching, fail back to the old if problem
* If proven, hold the old to prepare next change
* Intelligent routing

Source: Infrastructure as Code

<!-- {_style="text-align: right; font-size:60%"} -->


--
#### Phoenix Replacement
* A new instance of infrastructure is created when a change is made
  * Don´t need two parallel running instances all the time
* Create the new, testing, switch to it
  * Keeping the old one until the new proven in use.
* Basis for immutable infrastructure


--
#### Canary replacement
* Used by larger organizations (Google, Facebook...)
* Deploying the new version of an element alongside the old one, and then routing some portion of usage to the new elements.
* More effective use of resources

![canary](../images/canary.png)


Source: Infrastructure as Code

<!-- {_style="text-align: right; font-size:60%"} -->

---

#### Testing your infrastructure

* Agile approach to testing, TDD, Automated testing for fast feedback
* Test pyramid
  * Many, fast running low level test, syntax validation, unit tests
  * Medium-level test, build and test server instances
  * High-level tests, deploy and test multi-tier services

![test pyramid from book](../images/testing-pyramid.png)

<!-- {_class="center" _style="width: 10%"} -->

Source: Infrastructure as Code

<!-- {_style="text-align: right; font-size:60%"} -->


--
#### Low-level testing

  * Syntax checking
    * checking syntax of a Ansible playbook
  * Static code analysis
    * Linting, ex [ansible-lint](https://github.com/willthames/ansible-lint)
    * "coding hygiene", Simple, readable, Code standard
    * Unit testing, ex. ChefSpec
    * running configuration definitions to be run without actually applying (emulate)


--
#### Middle-level testing
* Building templates, create instance and validate it is running by running some tests
  * OS-level checks
* Should not test individual components. Making servers ready to integrate
* The resources (servers, networking ect) should be disposed after each test
  * Rebuild from scratch before every test
* Local virtualized test
  * Vagrant - catching problem fast
* [kitchen.ci](http://kitchen.ci/)
  * Plugins for Puppet, Chef and Ansible


--
#### High-level testing
* Testing multiple elements of infrastructure so that they work when integrated
* Testing integrating external systems
* Should using the same structure and tooling as in production
* Slowest testing - keep it effective
* [ServerSpec](http://serverspec.org/)


--
#### Testing operational quality
* Performance, availability, security...
  * Defining targets and thresholds
  * Performance tests
    * [ab - Apache HTTP server benchmarking tool](https://httpd.apache.org/docs/2.4/programs/ab.html)
  * Scanning for common programming errors
  * Scanning for known security errors (Common vulnerabilities and Exposures system - CVE)
    * https://cve.mitre.org/cve/cve.html
* Should take place at all layers but is most important at the high-level
* **Monitoring**


--
#### Configuration management tools and testing

* [Ansible-lint](https://github.com/willthames/ansible-lint), [Puppet-lint](http://puppet-lint.com/), [foodcritic](http://www.foodcritic.io/) [RuboCop](https://github.com/bbatsov/rubocop)
* [Unit test - Ansible](http://docs.ansible.com/ansible/latest/dev_guide/testing_units.html)
* [Unit test - Chef](https://learn.chef.io/modules/unit-test-with-chefspec#/)
* [Unit test - Puppet](https://puppet.com/blog/unit-testing-rspec-puppet-for-beginners)



---

#### Continuously availability
* How to handle change without taking the service down?
  * If something go wrong - fast detection and recovery
* Traditional solution - Avoid changes!


--
#### Service Continuity
* How to handle changes/errors without the end-user notice?
* Uptime
  * 99.999% uptime ("unplanned outages")
* Dynamic server pool
  * Running health checks, replaces failed servers
  * Could hide real problems
  * Could affect software designed (some architectures assume static infrastructure)
    * Stateful sessions, local data storing, static configuration
    * Cloud-native software (page 279 - Morris)- [12-factor applications](https://12factor.net/)
* Data Continuity



---
<!--
## Data Continuity
* How to handle our data - if the components use read/write data storage, this can be a challenge.
* Replicating data redundantly
  * Ensure it is replicated across multiple instances, with redundancy
  * Could be recovered if a node is lost (what if many lost nodes?)
* Regenerating data
  * Getting data from other systems - load into runtime
* Delegating data persistence
  * Put the data on a dedicated service
* Backing up to persistent storage
  * Be sure to understand where your data is - Confusion in the cloud
  * Make sure your backups are routinely retrieved and used - use it in your test environment?

-->

#### When things goes bad - Disaster recovery
* DR-plan, what to do when a service is failing
  * What do we need, how much time will it take. Thinking of all stuff going wrong (losing your VCS?)
* Servers and services will disappear (scaling up and down)
  * should be a trivial event - rebuilding servers will happen every day
  * Building environments should also be routine (if larger-scale failures)
* People must know when something goes wrong (monitoring) - triggers recovery


--
* Can your system handle the full load a big failure will cause
  * provisioning servers and so on...
* How does the element works if their peers are disconnected
  * Chaos Monkey - Semi-randomly destroys server instances
  * Chaos Gorilla - Removes whole data centers
  * Chaos Kong - kills an entire AWS Region
  * Latency Monkeys - Artificial delays to see weather services handles degradation correctly

![Chaos gorilla](../images/chaos-gorilla.png)
<!-- {_style="width: 30%"} -->


--
#### Read the book

* Chapter 10, 11, 14
* Chapter 12, 13, 15 (briefly)


---
# Tack för idag!

![bye](../images/bye03.gif)

<!-- {_class="center"} -->
