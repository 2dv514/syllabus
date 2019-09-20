## Examination assignment 2 - 2DV517

This text describes the second assignment in the course 2dv517. This assignment is a group assignment.


## Purpose of this assignment

This assignment strive to give the student:

* Practical experience with a provisioning/configuration management tool for solving a defined scenario.
* Practical experience of analyzing a problem and define a infrastructure need for solving the problem.
* Practical experience of installing and configure a monitoring system for that infrastructure
* Practical experience working with the ideas of "Infrastructure as code" in a group project
* Experience and solving problems that occur in the context of the project


## The problem to solve
The company [ACME Corporation](https://en.wikipedia.org/wiki/Acme_Corporation) is having some problem with their website.
After releasing new products last months their website have been receiving a lot more traffic. This has led to the site being slow and sometime unresponsive. The site is built around the CMS system [Wordpress](https://wordpress.org/download/) and today it is hosted on an single server running all of the required services and tools like database, static files, WordPress core code etc.
Another problem the company has with the website is how it is being configured over the years. Today the server running the whole thing is like a snowflake server and they are afraid to upgrade Wordpress to a newer, more secure, version. But now they have decided to add some resources to this problem.

The company have given your group the assignment to try to fix these problems. To be able to handle the load increase on the web site you must introduce a load balancer (hopefully with high availability) and also separate the different services and be able to scale these (ability to add more instances). You should redesign the infrastructure to support the DevOps mindset with configuration management when moving the old single instance solution to a more scalable one hosted on a OpenStack cloud using a configuration management tool.

Today the system look like this:

![Image of the software architecture](https://github.com/2dv514/syllabus/raw/master/examination/part_2/wordpress-architecture.png)

As shown in the figure, the service today includes three main components running on a Ubuntu 16.04 LTS:

1. The Wordpress code base (version 4.6 - this is an old version) and the code for plug-ins - This runs on an web server with support for PHP and only changes when you update/upgrade Wordpress or one of the plugins.
2. Database server, MySQL or MariaDB - This holds persistent data like user accounts, site pages, news, plugin data and so on.
3. User files - Administrators of the site can upload images and other document to the platform, these are usually stored in a folder on the web server.

## What the company want

The company want more scalability. They want to be able to have at least three instances of the Wordpress server but probably want to easy add more. The database should be split up to own instances and provide a master-server replication where the master has write/read and the slave are read only. The files should live on a own file server or maybe a volume if possible.

The company also want a monitoring service so that they easy could monitoring the servers as much and reasonable as you think. There should be an easy way to get a visual view over the monitoring and also get some kind of alarm if something bad is happening (server going down, CPU panicking or something)

This is the companies wishes and your assignment is to solve this a much as possible.

#### Data from the company
Here is a zip-file (containing the recent data) from the company:
[Wordpress files and data](https://github.com/2dv514/syllabus/blob/master/examination/part_2/acme_wordpress_files_and_data.tar.gz?raw=true)

If you need more data or information be sure to ask for it on the iterative meetings where the teachers also will act as customers.

## What is expected of you

As a student in the group you are expected to add at least 20 hours a week on this course. You are free to plan your time with the group.
The vision of the project is to solve the problem for the company but since this is a course project where the goal of learning is more important then the artefact provided you won't fail the course even if the whole solution is not complete and you can show through commits, meetings with supervisor, assigned tickets/issues and the documentation of the project that you have spent the time needed and tried to solve the problem.

As a student you are expected to be active in the project and be contactable for the group during the project. If not you will be thrown out of the group and be failing this part of the course (meaning next time for this is next years course)

## How to work in the group
You must use VCS in your group. Your code should be commited often and you should have some strategy for commiting code (feature branch, pull request etc.). Every group gets a private GitHub repository to work against. You must use the [GitHub repository project board](https://help.github.com/en/articles/about-project-boards) and all things you do must be assigned trough [tickets/issues](https://guides.github.com/features/issues/) to give transparency to what is going on in the project.

The group are free to split the work between its members, decide which role each and one have in the group and when you have your own meetings (an advice is to have daily stand-ups). One time a week the group (one or more members in the group) will have a meeting with the course management. During this meetings you should describe what you have done, how you have separated the work and how you will work until the next meeting. This meeting is at maximum 30 minutes per time so be prepared before it. The course managements role in this meetings is both coaching and play the role of customer.

At the end of every week you must provide points to your project members. This is done through an anonymous form. You give away points depending on how active the members of your group have been. That will give the examiner (along with the assigned issues) a better tool for individual examination. More info about this in the first meeting.


## Examination

### Group artefact
Along with the code for creating your infrastructure the group should provide a video video recording showing how it works. The video should show how you run your code to create and tear down your infrastructure, show how the monitoring works (what it measures and how it notifies) and also explain how the solution could handle changeability of the software.
Of course the groups works should be visible in the Github repo (commits, issues, project board and so on)

### Individual examination
You will be examined by your activity in the group project. Examiner will track your issues and analyse the points given by your project members. You should also provide an individual reflection of the project before the project deadline. The following parts must be included in this:
<br><br>
* Your name
* Your personal reflection of the project
  * What went good
  * What went bad
* Do you like to keep this group for the next course
<br>
This should be sent to the course management before deadline of the project.

You will also have an individual oral hearing in the end where the theoretical part of the course is checked.

## How to start
Make sure to have a initial group meeting discussing the project. You also have to decide what tools to use, your commit strategies and how to approach the problem. All of this point should be discussed before the first meeting with the course management. You also may have some questions about the project itself so collect these to this first meeting since all information isn't in this text. 
Then we take it from there...

## Project instructions video
<iframe width="542" height="305" src="https://www.youtube.com/embed/wVpNXEVRnyQ" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>