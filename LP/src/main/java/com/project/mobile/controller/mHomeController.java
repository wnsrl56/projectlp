package com.project.mobile.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.controller.HomeController;

@Controller
public class mHomeController {

private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@RequestMapping(value = {"/m/","/mobile/"}, method = RequestMethod.GET)
	public String mobileHome(Locale locale, Model model) {
		
		
		logger.info("Welcome mobilehome! The client locale is {}.", locale);
		
		model.addAttribute("serverTime", "Mobile" );
		
		return "home";
	}
}
