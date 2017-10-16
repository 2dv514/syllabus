## Examination assignment 2 - 2DV514

This text describes the second assignment in the course 2DV514. This assignment could seem pretty big but remember that it will be done in groups.



## The problem to solve
The company  [ACME Corporation](https://en.wikipedia.org/wiki/Acme_Corporation) are in a new phase of their software developing. They are very interested in bringing in new tools and technology into their stack. The problem is that they want to test the technologies in a smaller example before bringing it to their own production environment.

They have given your group the assignment to bring up a proof of concept of drifting a infrastructure supporting the DevOps mindset with configuration management and microservice software architecture. The task is to develop a very small microservice architecture and drift it into their OpenStack cloud using a configuration management tool of your choice. The solution should also provide a good use of version control system, tactics for handling changeability and a valued documentation.

## Part 1 - The software architecture
The first thing to think about is to create the software. You are all familiar to the microservice architecture and it's pros and cons. You are going to create a very small example of this architecture. The software includes at least two services (with own data management) and a [API Gateway](http://microservices.io/patterns/apigateway.html).

![Image of the software architecture](https://github.com/2dv514/syllabus/raw/master/examination/part_2/ms-architecture.png)


As you can see from the image above we have the two services, the API gateway and a client (you should provide the web server it is loading from). We try to keep the code to a minimum just to get a proof of concept but of course you are free to fill the services with more data to better test the system. In this text we describe the bare minimum. Even if the services in this "proof of concept-scenario" doesn't´t need data storage in databases you should provide and store the data responded to the client (eg. your software should communicate with the database). You are free to chose database (mySQL, mongoDB, redis...)

The both services could just have one API method. The method will take a HTTP GET and respond with some JSON data. For example:

```javascript
// request
GET https://service-a.example.com/hello

// response
{
  "servicename": "serviceA",
  "message": "Service A says Hello!"
}
```
Remember that you are free to provide more complex (and funnier) data if you want.
The API gateways job is to combine the two services and put together their responses to a message available for the outside client.

You are free to choose the application platform and database you want but you should at least use two different. If it is nodeJS, JAVA, PHP or an other platform it is up to your group to decide. The platform for the client and the Gateway API is also free of choice. You should of course host your code in a repository. As a group your are responsible for creating and maintaining these repos - **these will not be created by the course management.**

## Part 2 - The infrastructure
Looking at the software architecture you will have to figure out how the infrastructure should look like. Which servers is needed? How to handle load balancing? Proxies? Scaling? Monitoring? DNS servers? Backup? How should the client application be hosted?

The group should discuss this matters and provide a image of the infrastructure when have the supervision meetings (see below).

Of course the infrastructure should be handle with the mindset of DevOps and "Infrastructure as Code". You should use a configuration management tool and all of the infrastructure specific code should be version managed in a git repository provided by the course management. This repository will be part of the examination.

## Monitoring your infrastructure
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

## Iterative meetings
During the project the group will have meetings with the course management. There are several pass booked into the course schedule. This meetings are mandatory. Your group decides which of you that will participate in the meetings (all or just one person) but some should always be there.

During this meeting should you describe what you have done, how you have separated the work and how you will work until the next meeting. Try to keep these meetings effective and be prepared. For example; you want to talk about your infrastructure, then make sure you have an image over it so there will be no problem to understand each other.

## Remember
As said before this could be a pretty big project with many technologies. Therefore you must be effective when split the work between team members. Maybe take different roles where some is responsible for the software, some starts learning and test the configuration management tool and so on.
