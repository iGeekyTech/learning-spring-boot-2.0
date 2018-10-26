#Spring boot security rest basic authentication example

Learn to use basic authentication to secure rest apis created inside a Spring boot application. The secured rest api will ask for authentication details before giving access the data it secure.

#Steps to execute Projects:

http://localhost:8080/employees/

```
{"employeeList":[{"id":1,"firstName":"Lokesh","lastName":"Gupta","email":"howtodoinjava@gmail.com"},{"id":2,"firstName":"Alex","lastName":"Kolenchiskey","email":"abc@gmail.com"},{"id":3,"firstName":"David","lastName":"Kameron","email":"titanic@gmail.com"}]}
```

1. Maven dependency
To secure rest apis, we must include spring security related jar files in project runtime. Simplest way to add all required jars is add spring-boot-starter-security dependency.

```
<parent>
	<groupId>org.springframework.boot</groupId>
	<artifactId>spring-boot-starter-parent</artifactId>
	<version>2.0.5.RELEASE</version>
	<relativePath />
</parent>

<dependencies>
	<dependency>
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-web</artifactId>
	</dependency>
	<dependency>
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-security</artifactId>
	</dependency>
</dependencies>
```

2. Configure WebSecurityConfigurerAdapter

To enable authentication and authorization support in spring boot rest apis, we can configure a utility class WebSecurityConfigurerAdapter. It helps in requiring the user to be authenticated prior to accessing any configured URL (or all urls) within our application.

```
package com.howtodoinjava.rest.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter
{
    @Override
    protected void configure(HttpSecurity http) throws Exception 
    {
        http
         .csrf().disable()
         .authorizeRequests().anyRequest().authenticated()
         .and()
         .httpBasic();
    }
 
    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) 
            throws Exception 
    {
        auth.inMemoryAuthentication()
        	.pa
        	.withUser("admin")
        	.password("{noop}password")
        	.roles("USER");
    }
}
```

3. Spring boot security rest basic authentication demo
For demo purpose, we can write a simple REST API given below.

3.1. REST API

```
@RestController
@RequestMapping(path = "/employees")
public class EmployeeController 
{
    @Autowired
    private EmployeeDAO employeeDao;
    
    @GetMapping(path="/", produces = "application/json")
    public Employees getEmployees() 
    {
        return employeeDao.getAllEmployees();
    }
}
```

3.2. Access rest api without ‘authorization’ header
Access rest api at URL : HTTP GET http://localhost:8080/employees/

Require username and password
Require username and password

3.3. Access rest api with ‘authorization’ header
Upon passing authorization request header with encoded basic-auth user name and password combination, we will be able to access the rest api response.

Access rest api at URL : HTTP GET http://localhost:8080/employees/

Successful api call
Successful api call


4. Conclusion
In this spring boot security rest basic authentication example, we learned to secure rest apis with basic authentication. It is done in two steps. First step is to include required dependencies e.g. spring-boot-starter-security. Second step is to configure WebSecurityConfigurerAdapter and add auth details.