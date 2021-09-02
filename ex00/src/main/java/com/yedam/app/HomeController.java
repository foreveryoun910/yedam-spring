package com.yedam.app;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yedam.app.impl.EmpMapper;

import lombok.extern.java.Log;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log
public class HomeController {
	
//	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
//		logger.info("Welcome home! The client locale is {}.", locale);
		log.info("Welcome home! The client locale is {}.");
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		// request.setAttribute("속성명", 값);
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping("/main")
	public String main() {
		return "main";
	}
	
	@RequestMapping("/login")
	public String login(Member member) {
		log.info(member.toString());
		// logger
		// error > info > warn > debug > trace
		// trace : 제일 상세하게 로그가 찍힌다. 로그 레벨 제어 가능
		// error : 에러 떴을 때만 로그가 찍힌다.
		// 하위 레벨의 로그들 전부 뜸(ex. trace에서는 debug, warn, info, error 다 뜬다.)
		return "redirect:/"; // 홈으로 간다.
		// response.sendRedirect("");
	}
	
	@Autowired EmpMapper dao;
	
	@RequestMapping("/dept")
	public String dept(Model model) {
		model.addAttribute("list", dao.getDept());
		return "dept";
	}
}
