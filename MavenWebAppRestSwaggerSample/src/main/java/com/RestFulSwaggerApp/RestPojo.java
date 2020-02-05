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
      //  return "Hello: "+ inputName;
        return "{'name':'"+ inputName + "', 'Description':'Test on Server'}";
    }
}
