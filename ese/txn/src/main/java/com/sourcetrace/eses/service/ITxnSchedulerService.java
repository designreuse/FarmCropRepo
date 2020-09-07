package com.sourcetrace.eses.service;

import javax.jws.WebMethod;
import javax.jws.WebService;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

import org.springframework.stereotype.Component;

import com.sourcetrace.eses.txn.schema.Request;
import com.sourcetrace.eses.txn.schema.Response;


@Path("/")
@Produces({"application/json","application/xml"})
@WebService(serviceName = "TheFarmCorpMobileTxnService", name = "TheFarmCorpMobileService", targetNamespace = "http://thefarmcorp.com")
@Component
public interface ITxnSchedulerService {
	
	@WebMethod
	@Path("/mobileRequestCollectionScheduler")
	
	@Consumes({"application/json","application/xml"})
	@POST
    public Response mobileRequestCollectionScheduler(Request request) throws Exception;

}
