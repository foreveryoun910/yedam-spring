package com.yedam.app;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

// Ajax 쓸 때는 @RestController
@RestController 	/* @Controller + @ResponseBody */
public class AjaxController {
	// p.146
	
	@RequestMapping("/ex07")
	public SampleDTO ex07(SampleDTO sample) {
		// SampleDTO sample = new SampleDTO();
		sample.setName("홍길동");
		sample.setAge(50);
		return sample;
	}
	
	@RequestMapping("/ex08")
	public List<SampleDTO> ex08(SampleDTO sample) {
		List<SampleDTO> list = new ArrayList<>();
		list.add(new SampleDTO("choi", 10, new Date()));
		list.add(new SampleDTO("park", 20, new Date()));
		list.add(new SampleDTO("kim", 30, new Date()));
		return list;
	}	
}
