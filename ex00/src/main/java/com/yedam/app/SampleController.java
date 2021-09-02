package com.yedam.app;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.java.Log;

// pojo : 스프링의 특징, 아무것도 상속받을 필요 없다.
@Controller 	// -> @Component를 상속받은 어노테이션 @Controller, @Serivce, @Repository(=DAO)
@RequestMapping("/sample/*")
@Log
public class SampleController {

	@RequestMapping("/ex09")
	@ResponseBody // 자바 객체 -> json 구조의 스트링으로 변환해주는 어노테이션. ajax 컨트롤러에서도, java 컨트롤러에서도 사용하고 싶다면 이 어노테이션을 붙여준다.
	public SampleDTO ex07(SampleDTO sample) {
		// SampleDTO sample = new SampleDTO();
		sample.setName("홍길동");
		sample.setAge(50);
		return sample;
	}
	
	
	// p.134
	@RequestMapping("/ex06/{name}/{age}")
	public void ex06(@PathVariable String name, @PathVariable int age) {
		log.info("name=" + name + " age=" + age);
	}
	
	@RequestMapping("/ex05")
	public void ex05(SampleDTOList list) {
		log.info(list.toString());
	}
	
	@RequestMapping("/ex04")
	public void ex04(@RequestParam List<String> ids) {
		log.info(ids.toString());
	}
	
	@RequestMapping("/ex03")
	public void ex03(@RequestParam String[] ids) {
		log.info(Arrays.toString(ids));
	}
	
	
	@GetMapping("/ex02")
	// required = false : 넣을 값이 없으면 안 넣어도 됨.
	// defaultValue : 값을 안 넣으면 들어갈 기본값도 지정 가능.
	public void ex02(@RequestParam(name = "username") String name
					, @RequestParam(required = false, defaultValue = "10") int age) { // dto = vo = do
		// String name = request.getParameter("name");
		log.info("name=" + name + " age=" + age);
		
		// http://localhost/sample/ex02?username=hhhhh 로 주면
		// INFO: name=hhhhh age=10 로 받아온다.
	}
	
	@GetMapping("/ex01")
	// @ModelAttribute가 없으면 기본적으로 명칭은 dto 이름에서 앞글자만 소문자로.
	// 보통 걍 ${sampleDTO.name} 이런 식으로 쓰기 때문에 잘 쓰는 방법은 아님.
	public String ex01(@ModelAttribute("sam") SampleDTO dto, Model model) { // dto = vo = do
		log.info("" + dto.toString());
		model.addAttribute("sam", dto); // 이 작업을 하지 않아도 spring이 알아서 해준다. public String ex01(SampleDTO dto) 까지만 써도 가능하다는 뜻.
		model.addAttribute("pageNo", "10");
		return "sample/ex01";
	}
	
	
	// @RequestMapping(value = "/a", method = RequestMethod.POST)
	@GetMapping("/a")
	public String basic1() {
		log.info("basic..............................");
		return "sample/basica";
		// 매핑한 이름(url)과 뷰페이지 이름이 다르다면 return 타입을 String으로 주고 return에 뷰페이지를 넘겨줘도 된다.
	}
	
	// RequestMapping은 get과 post 모든 타입을 요청한다.
	@RequestMapping("/b")
	public void basic2() {
		// return 타입이 void인 경우 url과 일치하는 뷰페이지로 포워드
		log.info("22222222nooooooo..............................");
	}
}
