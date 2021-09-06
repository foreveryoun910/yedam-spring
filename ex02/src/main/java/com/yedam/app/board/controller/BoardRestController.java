package com.yedam.app.board.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.app.board.domain.BoardVO;

// @RestController // 방법1
@Controller // 방법2
public class BoardRestController {

	@RequestMapping("test1")
	@ResponseBody // 방법2
	// Jackson 라이브러리를 넣어줬기 때문에 @ResponseBody 어노테이션을 사용할 수 있다.
	public Map<String, Object> test1(@RequestParam String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		if(id.equals("admin")) {
			map.put("result", true);
		}
		else {
			map.put("result", false);
		}
		return map;
	}
	
	// Spring은 객체 타입 Object를 알아서 Json 타입으로 바꿔준다.
	// @Controller 어노테이션을 넣으면 return "test"; 는 test.jsp로 이동한다.
	// @RestController 어노테이션을 넣으면 return "test"; 는 test라는 텍스트(데이터)를 그대로 출력한다. 타입은 json, xml, text 정하는 대로.
	// @RestController 는 ajax 사용할 때 많이 사용한다.
	
	
	@PostMapping(value = "test2")
	// @PathVariable : test?id=choi -> /test/choi
	@ResponseBody
	public BoardVO test2(BoardVO vo) {
		vo.setBno(10);
		vo.setTitle("사과");
		vo.setContent("는 맛있어");
		vo.setRegDate(new Date());
		return vo;
	}
}
