package com.yedam.app.emp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {

	// login-page="/loginForm"
	@GetMapping("/loginForm")
	public String login() {
		return "emp/login";
	}
	
}
