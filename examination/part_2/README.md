## Examination assignment 2 - 2DV514

This text describes the second assignment in the course 2DV514. This assignment could seem pretty big but remember that it will be done in groups.


## The problem to solve
The company [ACME Corporation](https://en.wikipedia.org/wiki/Acme_Corporation) are having some problem with there website.
After releasing new products last months there website have been receiving a lot more traffic. This has led to the site being slow and sometime unresponsive. The site is built around the CMS system [Wordpress](https://wordpress.org/download/) and today it's hosted on an singel server running all of the required tools like database, static files, WordPress etc.
Another problem the company has with the website is how it is being configured. Two years ago they hade a hard drive crash and had to rebuild there infrastructure, they hade no automated configuration so they hade to rebuild it manually. During this process they realized that they had to fix this in the future.

The company have given your group the assignment to fix these two problems. To be able to handle the load increase on the web site you must introduce a load balancer and to be able to do that you must separate the different services. You should redesign the infrastructure to support the DevOps mindset with configuration management. The task is move there old single instance solution to a scalable one hosted on their new OpenStack cloud using a configuration management tool. The solution should also provide a good use of version control system, tactics for handling changeability and a valued documentation.

## Part 1 - Splitting up the single instance Wordpress
Before introducing a load balancer you need to know the different components of Wordpress.
![Image of the software architecture](https://github.com/2dv514/syllabus/raw/master/examination/part_2/wordpress-architecture.png)

As shown inte the figure, Wordpress 3 main components:

1. The Wordpress code base and the code for plug-ins - This runs on an web server with support for PHP and only changes when you update/upgrade Wordpress or one of the plugins.
2. Database server, MySQL or MariaDB - This holds persistent data like user accounts, site pages, news, plugin data and so on.
3. User files - Administrators of the site can upload images and other document to the plattform, these are usually stored on in a folder on the webserver. But when you want to scale the web servers you need to move the storage of these files to a central location, like a file server.

The group needs to analyze and discuss the existing infrastructure and develop a new solution that supports ACME's new needs. During the first supervision meeting, see below), you will present your solution.

## Part 2 - The infrastructure
When you have a clearer overview of the different components of the new design you will have to figure out how the infrastructure should look like. Which servers is needed? How to handle load balancing? Proxies? Scaling? Monitoring? DNS servers? Backup?

The group should discuss this matters and provide a image of the infrastructure when having the second supervisor meeting, (see below).

Of course the infrastructure should be handle with the mindset of DevOps and "Infrastructure as Code". You should use a configuration management tool and all of the infrastructure specific code should be version managed in a git repository provided by the course management. This repository will be part of the examination.

## Part 3 - Monitoring your infrastructure
You can spend a lot of time setting up the perfect monitoring solution for your system. Since you do not have unlimited time to do this you will have to prioritize.
Your monitoring solution should at least implement the following:

* monitor availability for some services in your system
* the metrics should be stored in some way
* some visualization of the services availability
* if one of the monitored services becomes unavailable some one should be notified

## Examination
One of the things is that your infrastructure code should be self-documenting. But for the examination your group should provide a project report. The report could be in pdf or as a wiki in your GitHub repository. The following part are mandatory to be included in the report:

### The members of the group, name, emails
### Introduction - describing the assignmet
### Case experimenting
There are some cases that you should try out in your infrastructure solution.


**How does your system handle changeability?** If we want do upgrade the version of some of the application platforms how will it work? How will security updates be handle? Try to describe and perform a scenario and how your solution is handling this.

**How does your team work with version control tools** Describe how your team worked with version control. How could you diverse the work and avoid merge conflicts?

**Recreation** Your infrastructure should be easy to destroy and recreate with as so little work as possible. Describe how your system work and how you recreate the infrastructure.

**Environments** Describe how you could work with your infrastructures when deploying it in different Environments (develop, staging, QA and so on). How do you work with environment variables.


### Individual diary and reflection
Every single student should send a individual work diary describing how many hours and what that student have worked in the project. The diary should give the examinator a quick and simple guidance to what you have done in the project.

You should also provide a text answering the following questions:

* What have you learned from this project?
* What has gone good and what has gone bad in the project?
* What will you do different next time?

This should be sent to the course e-mail before deadline.

## Iterative meetings - Supervisor meetings
During the project the group will have meetings with the course management. There are several pass booked into the course schedule. This meetings are mandatory. Your group decides which of you that will participate in the meetings (all or just one person) but some should always be there.

During this meetings you should describe what you have done, how you have separated the work and how you will work until the next meeting. Try to keep these meetings effective and be prepared. For example; you want to talk about your infrastructure, then make sure you have an image over it so there will be no problem to understand each other.

Some meeting have pre-defiend topics that should be prepared in advanced:

* Meeting 1 - see Part 1
* Meeting 2 - an image overview of the new infrastructure
* ...

## Remember
As said before this could be a pretty big project with many technologies. Therefore you must be effective when split the work between team members. Maybe take different roles where some is responsible for the software, some starts learning and test the configuration management tool and so on.
