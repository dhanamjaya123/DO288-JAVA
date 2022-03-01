package com.openshift.microservice.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/api/v1")
public class OpenShiftController {
	
	@GetMapping
	public String getOpenShiftPage() {
		
		return "Welcome RedHat OpenShift Developer Page";
		
	}

}
