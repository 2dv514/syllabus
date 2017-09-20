## Examination assignment 2 - 2DV514

This text describes the second assignment in the course 2DV514. This assignment could seem pretty big but remember that it will be done in groups.



## The problem
The company  [ACME Corporation](https://en.wikipedia.org/wiki/Acme_Corporation) are in a new phase of their software developing. They are very interested in bringing in new tools and technology into their stack. The problem is that they want to test the technologies in a smaller example before bringing it to their own production environment.

They have given your group the assignment to bring up a proof of concept of drifting a infrastructure supporting the DevOps mindset with configuration management and microservice software architecture. The task is to develop a very small microservice architecture and drift it into their OpenStack cloud using a configuration management tool of your choice. The solution should also provide a good use of version control system, tactics for handling changeability and a valued documentation.

## Part 1 - The software architecture
The first thing to think about is to create the software. You are all familiar to the microservice architecture and it's pros and cons. You are going to create a very small example of this architecture. The software includes at least two services (with own data management) and a [API Gateway](http://microservices.io/patterns/apigateway.html).

![Image of the software architecture](#)


As you can see from the image above we have the two services, the API gateway and a client (you should provide the web server it is loading from). We try to keep the code to a minimum just to get a proof of concept but of course you are free to fill the services with more data to better test the system. In this text we describe the bare minimum.

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

The API gateways job is to combine the two services and put together their responses to a message available for the outside client.

You are free to choose the application platform you want but you should at least use two different. If it is nodeJS, JAVA, PHP or an other platform it is up to your group to decide. The platform for the client and the Gateway API is also free of choice. You should of course host your code in a repository. As a group your are responsible for creating and maintaining these repos.

## The infrastructure


## Other requirements


## Iterative meeting


## Questions
