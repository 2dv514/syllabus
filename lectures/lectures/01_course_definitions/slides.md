<!-- Content -->
## Content

* DevOps
  * What?
  * Why?
  * You and DevOps...
* Configuration management
  * Wider definition
  * Our focus
  * Infrastructure As Code


---
  ## Conway´s law (1967)
  "Organizations which design systems ... are constrained to produce designs which are copies of the communication structures of these organizations."
  <br>
  <br>


  ![yoda](../images/yoda.gif)


---
<!-- DevOps -->
## The problem with delivering software

<!-- {_style="font-size: 140%"} -->
* People
  * Communication, different goals, culture, silos
* Processes
  * Unable to handle changeability, manual workflows, bottlenecks
* Technology
  * Drifting servers, "it worked on my machine", slow delivery
* Bugs, delays and so on...


---
<!-- DevOps -->
## The problem with people

<img src="../images/devops1.png" align="center" />


---
<!-- Part 1 -->
## Dev vs. Ops
* Developers (Devs)
  * Rewarded for changeability
* Operations (Ops)
  * Rewarded for stability and uptime
* Management (+ sales, customers, QA, testers...) want both


<p>
Some days after our release the web server experience high load...who to blame!?<br />
</p>
* Developers - The code works on my machine!
* Ops - The server is working - The code is the problem!

<!-- {_style="font-size: 75%"} -->
Note:
Silos




--
DevOps is a reaction!

* Agile-based companies delivering web software
  * Dev - Agile and LEAN Processes
  * Ops - Still waterfall?
* Devopsday, 2009, Ghent, Belgium
  * "Agile system administrators"
* The need for deep understanding between old silos Dev and Ops
  * Ops using techniques from developers
  * Developers getting greater understanding for operations and deployment - Develop for the production environment
  * Provide both changeability and stability
  * CAMS (https://blog.chef.io/2010/07/16/what-devops-means-to-me)
    * Culture, Automation, Measurement, Sharing


--
## It's about Culture

* Engage early - burst silos!
* Be open
* Don´t blame
* Communications and involvement in every step
* "You built it, you run it!"
<br><br>
![teamwork](../images/teamwork.gif)


--
## It's about Automation
* If you can script it - script it!
* Consistence and stability using scripts
* Fast!
* Automate everything!
* Infrastructure as Code (IaC)
  * Bringing dev techniques into system administration
  * Automated testing


--
## It's about Measurement
* Capture and learn!
* Improve
* Adjust your understanding based on what you learned
* Measure "everything" - Continuous monitoring


--
## It's about sharing

* Share ideas, experience, metrics through the organization
* "Give the Devs root access" - co-ownership
* Learn from metrics
* "Intern open source"


--
## The need to evolve

![table](../images/table.png)


---
<!-- Configuration management -->
## Configuration management
"Configuration management (CM) is a systems engineering process for establishing and maintaining consistency of a product's performance, functional, and physical attributes with its requirements, design, and operational information throughout its life."

* Manage changes throughout the system lifecycle of complex systems
* ITIL, formally an acronym for Information Technology Infrastructure Library
  *  ITIL volumes as guidance to their IT organizations


--
## Configuration management

* Mange all of the changes that happen whitin your project.
* Records the evolution of your systems and applications
* Handle and govern how your team collaborates


--

So it is about using version control systems?
<br><br>
![cleese](../images/cleese.gif)


--

## Configuration management and DevOps

* Be able to reproduce any of the environments (operating system, patch level, network configs, software stack and so on)
  * Automation tools, infrastructure as code
* Be able to handle changes (and roll-backs) to the items and deploy to all of my environments (new OS, new framework version, new features)
  * Version control
* Be able to trace all of your changes
* Manage dependencies, components, software configuration
* Can every team member get the information they need?


--
## Configuration management - Our focus

* Infrastructure as code (IoC)
  * Infrastructure automation based on practices for software development
    * Your infrastructure is treated the same way as your code
    * "Code should be written to describe the desired state of the new machine"
  * Virtualization, cloud, containers, server automation...
  * Defining your environments as code
    * code as documentation, no manual differences (snowflake servers)
* Tools for automation of infrastructure
  * Chef, Ansible, Puppet...


---
## Challenges for IoC

  * Server sprawl
    * It is easy to create new servers, hard to manage to mandatory
  * Configuration Drift
    * Difference can creep in over time
      * Manual "fixing" a specific problem on one servers
      * Updating the application platform on just some servers (not all applications)
      * The configuration settings for same kind of servers differs from different people
      * Someone optimize a specific application server to quickfix a performance issue
  * Snowflake servers
    * A server that can´t be replicated === Fragile infrastructure
  * Automation fear - Kill and rebuild
  * Erosion
    * Things will happen over time (security updates, disk space, restart processes, hardware error)


--
## Principle of IoC
* It should be easy to destroy and rebuild systems/servers
  * The design should support a infrastructure that is always changing
  * Treat your servers as cattle, not pets
* System should be consistent
  * Same type of servers should have identical configurations - server templates
* If a task can be scripted, script it!
  * Definition files, consistency, documentation
* Testability
  * Bringing automated testing into Ops


---
## Reading to do

* Read (at least) chapter 1 in Morris book
  * ![book](../images/book.gif) http://shop.oreilly.com/product/0636920039297.do
* Infrastructure as code - the engine of DevOps
  * https://www.epam.com/about/news-and-events/in-the-news/2015/infrastructure-as-code-the-engine-at-the-heart-of-devops
* 2017 State of DevOps Report
  * https://puppet.com/resources/whitepaper/state-of-devops-report


---


# Bye for now!


![bye](../images/bye01.gif)
