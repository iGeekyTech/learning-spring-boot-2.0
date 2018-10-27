#Spring Boot + HikariCP

This page will walk through Spring Boot and HikariCP example. HikariCP is fast, simple, reliable and production ready JDBC connection pool. In Spring Boot 2.0 release, default database pooling technology has been switched from Tomcat Pool to HikariCP. This is because HikariCP offers superior performance. Now since Spring Boot 2.0 release, spring-boot-starter-jdbc and spring-boot-starter-data-jpa resolve HikariCP dependency by default and spring.datasource.type property has HikariDataSource as default value. Spring boot prefers HikariCP on first place then Tomcat pooling and then Commons DBCP2 on the basis of availability. Here on this page we will provide complete example of HikariCP with Spring Boot Data and MySQL. We will create a demo application in which we will perform create and read operation in database. We will configure HikariCP properties for example connectionTimeout, minimumIdle, maximumPoolSize, idleTimeout, maxLifetime and autoCommit in application.properties file.

#Technologies Used
Find the technologies being used in our example. 
1. Java 9 
2. Spring 5.0.7.RELEASE 
3. Spring Boot 2.0.3.RELEASE 
4. Maven 3.5.2 
5. MySQL 5.5 
6. Eclipse Oxygen

#HikariCP Dependency
Before using HikariCP, we need to make sure that we have resolved the HikariCP dependency. If we are using Maven we can use following dependency.

```
<dependency>
    <groupId>com.zaxxer</groupId>
    <artifactId>HikariCP</artifactId>
    <version>3.1.0</version>
</dependency> 
```

In case we are using Spring Boot 2.0 and onwards, we need not to include HikariCP dependency in pom.xml or build.gradle ourselves because spring-boot-starter-jdbc and spring-boot-starter-data-jpa resolve it by default. It means if we are using dependencies either.

```
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-jdbc</artifactId>
    <version>2.0.3.RELEASE</version>
</dependency> 
```
Or

```
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-data-jpa</artifactId>
    <version>2.0.3.RELEASE</version>
</dependency> 
```

Then we need not to include HikariCP dependency in our pom.xml or build.gradle.

#HikariCP Configurations
For the Hikari connection pool configuration, we enable it by using spring.datasource.type and assigning it fully qualified name of the connection pool implementation in application.properties file as following.

```
spring.datasource.type = com.zaxxer.hikari.HikariDataSource 
```

If we are using Spring Boot 2.0 and onwards, Spring Boot selects HikariDataSource by default and we need not to configure above line. 
Now to configure Hikari specific connection pool settings, Spring Boot provides spring.datasource.hikari.* prefix to be used in application.properties file. We will discuss here some frequently used configurations. 

1. connectionTimeout
connectionTimeout is the maximum number of milliseconds that a client will wait for a connection from connection pool. We need to configure it as following.

```
spring.datasource.hikari.connection-timeout=20000 
```

2. minimumIdle

minimumIdle is the minimum number of idle connections that is maintained by HikariCP in connection pool. It is configured as following.

```
spring.datasource.hikari.minimum-idle=5 
```

3. maximumPoolSize
maximumPoolSize configures the maximum pool size. It is configured as following.

```
spring.datasource.hikari.maximum-pool-size=12 
```

4. idleTimeout
idleTimeout is the maximum amount of time in milliseconds that a connection is allowed to sit idle in connection pool. It is configured as following.

```
spring.datasource.hikari.idle-timeout=300000 
```

5. maxLifetime
maxLifetime is the maximum life time in milliseconds of a connection in pool after it is closed. It is configured as following.

```
spring.datasource.hikari.max-lifetime=1200000 
```

An in-use connection will never be retired, only when it is closed will it then be removed after maximum lifetime. 

6. autoCommit

autoCommit configures the default auto-commit behavior of connections returned from pool. Default value is true.

```
spring.datasource.hikari.auto-commit=true 
```


If we are using Spring Boot version below Spring Boot 2.0 then we need to include HikariCP dependency as following.

```
<dependency>
    <groupId>com.zaxxer</groupId>
    <artifactId>HikariCP</artifactId>
    <version>3.1.0</version>
</dependency> 
```

http://localhost:8080/user/articles

```
[
    {
        "articleId": 1,
        "title": "Java Concurrency",
        "category": "Java"
    },
    {
        "articleId": 2,
        "title": "Spring Boot Getting Started",
        "category": "Spring Boot"
    },
    {
        "articleId": 3,
        "title": "Spring Cloud Tutorials",
        "category": "Spring Cloud"
    },
    {
        "articleId": 4,
        "title": "Spring Cloud Microservices",
        "category": "Spring Microservices"
    }
]
```

POST http://localhost:8080/user/article

```
{"article_id" : "5", "title" : "Advance Python", "category" : "Python"}
```