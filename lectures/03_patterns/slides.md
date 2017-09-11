# Patterns for...
* provisioning servers
* server templates
* managing server changes and updates
* defining infrastructure


---
## Patterns for provisioning servers
### Provisioning
* "making an infrastructure element ready to use"
* server example
  * assigning resources
  * installation
  * configuration
  * registration
  
Note:
assigning resources - Name, ip, physical, virtual <br/>
installation - <br/>
configuration - <br/>
registration - infrastructure services, monitoring and DNS


--
## Patterns for provisioning servers
### Characteristics of an effective provisioning process
* Infrastructure elements can be rebuilt on demand
* Define elements once -> roll out to multiple
* Transparent and easily modified

Note:
* Any **existing infrastructure element** can be effortlessly **rebuilt on demand**.<br/>
* A **new element can be defined once**, and then rolled out and replicated to multiple instances and environments.<br/>
* The **definition of any element**, and the process to provision it, is **transparent and easily modified**.


--
## Server´s lifecycle
![Server´s lifecycle](../images/l03-server-lifecycle.png)

* Package a server template
* Create a new server
* Update a server
* Replace a server
* Delete a server

Source: Infrastructure as Code

<!-- {_style="text-align: right; font-size:60%"} -->

Note:
*Package a server template* - Creating an Image, **Amazon AMI or VMWare Templates** or use a **Snapshot**. Usually **starts with an OS ISO** <br />
*Create a new server* - **Provisioning** <br />
*Update a server* - Problem: **consistency doesn’t last**, template are **continuously updated** cause servers to **diverge** <br />
*Replace a server* - Some changes may **require completely replacing** a server, major new version of an OS. May be **easier to completely rebuild** a server rather than change it. <br />
*Delete a server* -  **infrastructure services** need to be updated, **data** may also need to be retained, retaining historical **metrics and log data** for debugging<br />
*Other events in a server’s life* - Recover from failure, Resize a server pool, Reconfigure hardware resources


--
## Whats on a server?
* Software
* Configuration
* Data

How does configuration management treats this?

Note:
*Software* - Applications, libraries, files that are static and don’t tend to vary from one system to another. <br />
*Configuration* - Files used to control how the system and/or applications work. <br />
*Data* - Files generated and updated by the system, applications, and so on.  <br />
 <br />
*Software* - Makes sure it’s the same on every relevant server; doesn’t care what’s inside <br />
*Configuration* - Makes sure it has the right contents on every relevant server; will make sure it’s consistent and correct. <br />
*Data* - Naturally occurring and changing; may need to preserve it, but won’t try to manage what’s inside. <br />


--
## Where does it all come from?
* Base operating system
* System package repositories
* Language, framework, and other platform repositories
* Third-party packages
* In-house software packages

Why should we care?

Note:
Internal repository <br />
Consistency, security,


--
## Server Roles
* What is the purpose of the server?
* Puppet calls is "classes"

Patterns for server roles
* fine-grained roles
* role-inheritance hierarchy


--
## Patterns for creating servers
* By hand - Antipattern
```bash
openstack server create --flavor m1.medium --image "fedora-21-atomic"                 -
   --key-name MyServer-pubkey  --security-group default  MyServer-test
```
* Use a script
* Hot Clone - Antipattern
* Server Template
* Snowflake factory - Antipattern


--
## Smoke Test new servers
* Automatically created servers should be automatically tested
* Based on the server role:
  * server running and accessible
  * monitoring agent
  * DNS
  * ports
  * firewall
  * accounts
* should be used in CI and CD


---
## Patterns for server templates
* A starting point for a new server
* Build new servers consistently and repeatably
* Process of building a server template should be:
  * repeatable
  * transparent
  * self-documenting
  * self-testing
* Stock Template or do it yourself?


--
## Building a server template
1. Selecting an origin image
2. Applying customizations to the image
3. Packaging the image into a server template image


--
## Selecting an origin image
* Hot Cloned Server Template - Antipattern
* OS installation image
* Stock image


--
## Applying customizations to the image
Ways to apply customization
* Boot the origin images and apply changes
* Mount origin image and apply changes

What should be included?
* Provisioning at Creation Time
* Provisioning in the Template
* Mixed


--
### Packaging the image into a server template
Time to bake it into a server template
* saved into a format recognized by your infrastructure:
  * Openstack image
  * AWS AMI
  * VMWare server template
* Multiple platforms


--
## Updating a Server Template
* Reheating a Template
* Baking a Fresh template