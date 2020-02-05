
Create WebApp using Maven -> setup with Swagger

http://crunchify.com/how-to-create-dynamic-web-project-using-maven-in-eclipse/
	- using eclipse completely

Step 1 - eClipse -> new -> Maven Project
	- use default workspace: E:\java\Maven\EclipseWorkSpace
	- Filter: maven-archetype-webapp
	- Groupid: MavenWebRestSwagger
	- ArtifactId: MavenWebAppRestSwaggerSample
	- Package: MavenWebRestSwagger.MavenWebAppRestSwaggerSample


Step 2 - Project Property
	- JRE = 1.8
	- Build Path = Pointing to JRE 1.8 Lib

Step 3 - As a result
	- webApp File structure created
	- Pom.xml as dependency needed
	
Step 4 - Right click pom.xml -> run as -> maven install
	- war file was created: E:\java\Maven\EclipseWorkSpace\MavenWebAppRestSwaggerSample\target\MavenWebAppRestSwaggerSample.war

Step 5 - Run this maven project on Tomcat server - This will be a new tomcat server you careted
	- Right click project: -> Run as -> Run Configuration -> Maven Build -> new:
		- Base Directory: ${workspace_loc:/MavenWebAppRestSwaggerSample}
		- Goals: tomcat:run
			= ***** this is the key to ask Maven to create the tomcat server inside
	- This will crate server at: Creating Tomcat server configuration at E:\java\Maven\EclipseWorkSpace\MavenWebAppRestSwaggerSample\target\tomcat

	http://localhost:8080/MavenWebAppRestSwaggerSample/index.jsp
Error: when redeploy it got problem of not be able to access manager.
Solution:
*********************************************************************
https://www.mkyong.com/maven/how-to-deploy-maven-based-war-file-to-tomcat/
	- Better option: use the existing server


This need a Tomcat server
------------------------
Action 1 - Download Tomcat: 
	E:\java\Tomcat => unzip
Action 2 - Start:
	E:\java\Tomcat\bin\startup.bat
	E:\java\Tomcat\bin\catalina.bat run
	- need to have JRE_HOME=E:\java\jdk8\jre1.8.0_51
	- need to have CATALINA_HOME = E:\java\Tomcat\
	*** when it is not working set CATALINA_BASE = something, then remove it
Action 3 - view server: 
	http://localhost:8080/
Action 4 - Shutdown Tomcat:
	E:\java\Tomcat\bin\shutdown.bat	
---------------------------


Action 5 - Edit tomCat-suer.xml
	E:\java\Tomcat\conf\tomcat-suer.xml
------------------
	<role rolename="manager-gui"/>
	<role rolename="manager-script"/>
	<user username="tomcat" password="tomcat" roles="manager-gui,manager-script" />
----------


maven 
	eclipse -> window -> preference -> maven
	C:\Users\GuaiGuai\.m2\setting.xml

------------------
		<server>
			<id>TomcatServer</id>
			<username>tomcat</username>
			<password>tomcat</password>
		</server>
-----------------

pom.xml
------------------
  <build>
    <finalName>MavenWebAppRestSwaggerSample</finalName>
    <plugins>
<plugin>
	<groupId>org.apache.tomcat.maven</groupId>
	<artifactId>tomcat7-maven-plugin</artifactId>
	<version>2.2</version>
	<configuration>
		<url>http://localhost:8080/manager/text</url>
		<server>TomcatServer</server>
		<path>/MavenWebApp</path>
	</configuration>
</plugin>
</plugins>
  </build>
----------------------
************************************************************

Step 6 - Setup Restful API

in pom.xml
		<dependency>
			<groupId>com.sun.jersey</groupId>
			<artifactId>jersey-server</artifactId>
			<version>1.8</version>
		</dependency>

in web.xml
-----------------------------
  <servlet>
    <servlet-name>jersey</servlet-name>
    <servlet-class>com.sun.jersey.spi.container.servlet.ServletContainer</servlet-class>
    <load-on-startup>1</load-on-startup>
  </servlet>
  <servlet-mapping>
    <servlet-name>jersey</servlet-name>
    <url-pattern>/resource/*</url-pattern>
  </servlet-mapping>
-----------------------------

in Java:

package com.RestFulSwaggerApp;

import javax.ws.rs.*;
import javax.ws.rs.core.*;


@Path("hello")
public class RestPojo
{
    public RestPojo()
    {
        super();
    }
    
    @GET
    @Path("/SayHello")
    @Produces(MediaType.APPLICATION_JSON)
    public String SayHello(@QueryParam("inputName")  String inputName)
    {
        return "hello: "+ inputName;
    }
}


Step 7 - run configure again
(http://tomcat.apache.org/maven-plugin-2.2/context-goals.html = reference)
	- Right click -> Maven Build Install = This need to go first
	- Right click -> Run Configuration -> Maven build -> goals: tomcat7:deploy
		=> this will force the deployment happen to the external server in e:\java\tomcat

mvn tomcat7:deploy
mvn tomcat7:undeploy
mvn tomcat7:redeploy


	http://localhost:8080/manager
		tomcat/tomcat
	= Here you can check the status of applications
http://localhost:8080/MavenWebApp
http://localhost:8080/MavenWebApp/resource/hello/SayHello?inputName=Yuntao%20liu


Step 8 - in eClipse Maven Project: MavenWebAppRestSwaggerSample
-----------------
<dependency>
  <groupId>io.swagger</groupId>
  <artifactId>swagger-jersey-jaxrs</artifactId>
  <version>1.5.0</version>
</dependency>
----------------------
Step 9 - Add Swagger in Web.xml
--------------------------
  <servlet>
    <servlet-name>jersey</servlet-name>
    <servlet-class>com.sun.jersey.spi.container.servlet.ServletContainer</servlet-class>
       <init-param>
            <param-name>com.sun.jersey.config.property.packages</param-name>
            <param-value>
                io.swagger.jaxrs.json,
                io.swagger.jaxrs.listing,
                com.RestFulSwaggerApp
            </param-value>
        </init-param>
    <load-on-startup>1</load-on-startup>
  </servlet>
  
      <servlet>
        <servlet-name>Jersey2Config</servlet-name>
        <servlet-class>io.swagger.jaxrs.config.DefaultJaxrsConfig</servlet-class>
        <init-param>
            <param-name>api.version</param-name>
            <param-value>1.0.0</param-value>
        </init-param>
        <init-param>
            <param-name>swagger.api.basepath</param-name>
            <param-value>http://localhost:8080/MavenWebApp/resource</param-value>
        </init-param>
        <load-on-startup>2</load-on-startup>
    </servlet>

  <servlet-mapping>
    <servlet-name>jersey</servlet-name>
    <url-pattern>/resource/*</url-pattern>
  </servlet-mapping>
----------------------------

Step 10 - mvn tomcat7:deploy
mvn tomcat7:undeploy
http://localhost:8080/MavenWebApp/resource/hello/SayHello?inputName=Yuntao%20liu
http://localhost:8080/MavenWebApp/resource/swagger.json


Step 11 - Add Annotation to the Pojo
https://github.com/swagger-api/swagger-core/wiki/Annotations-1.5.X
-------------------
package com.RestFulSwaggerApp;

import io.swagger.annotations.*;

import javax.ws.rs.*;
import javax.ws.rs.core.*;


@Path("/hello")
@Api(value = "/helloo", description = "manage message class")
public class RestPojo
{
    public RestPojo()
    {
        super();
    }
    
    @GET
    @Path("/SayHello")
    @Produces(MediaType.APPLICATION_JSON)
    @ApiOperation( 
    	    value = "Displaying message", 
    	    notes = "Get input name and display", 
    	    response = String.class ,
    	    responseContainer = "List"
    	)
    public String SayHello(@QueryParam("inputName")  String inputName)
    {
        return "Hello: "+ inputName;
    }
}
---------------------

Step 12 - Swagger UI 
https://tech.homeaway.com/development/2016/06/02/generating-swagger-spec.html
https://github.com/swagger-api/swagger-ui/tree/master/dist
https://github.com/swagger-api/swagger-ui
	- download the code
	to: E:\Actuate\Actuate_CheatCode\Java\OracleStudy\Swagger_Jax-RS_Restful\swagger-ui-master\swagger-ui-master\dist
Action 1 - Download the lastest UI code:
	E:\Actuate\Actuate_CheatCode\Java\OracleStudy\Swagger_Jax-RS_Restful\swagger-ui-master

Action 2 - Copy
E:\Actuate\Actuate_CheatCode\Java\OracleStudy\Swagger_Jax-RS_Restful\swagger-ui-master\swagger-ui-master\dist\*
	To
E:\java\Maven\EclipseWorkSpace\MavenWebAppRestSwaggerSample\src\main\webapp\swagger

Action 3 - Edit the E:\java\Maven\EclipseWorkSpace\MavenWebAppRestSwaggerSample\src\main\webapp\swagger\index.html
	url = "http://petstore.swagger.io/v2/swagger.json";
	url = "http://localhost:8080/MavenWebApp/resource/swagger.json";
Action 5 - redeploy and check:

	http://localhost:8080/MavenWebApp/swagger/index.html
