package com.yedam.app.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.app.board.domain.BoardVO;

@Controller
public class ajaxTestController {

	@GetMapping("/ajax1")
	@ResponseBody
	// 데이터를 쿼리문자열으로 보내는 경우 ( Get은 JSON으로 보낼 수 없다. )
	public BoardVO test1(BoardVO vo) {
		vo.setContent("content test");
		
		/*
		 * // 시행시간 지연시키기 try { Thread.sleep(2000); } catch (InterruptedException e) {
		 * e.printStackTrace(); }
		 */
		
		return vo;
	}
	
	@PostMapping("/ajax2")
	@ResponseBody
	// 데이터를 JSON타입으로 보내는 경우 ( put과 delete는 JSON만 가능하다. )
	public BoardVO test2(@RequestBody BoardVO vo) {
		vo.setContent("content test");
		
		/*
		 * // 시행시간 지연시키기 try { Thread.sleep(2000); } catch (InterruptedException e) {
		 * e.printStackTrace(); }
		 */
		
		return vo;
	}	
	
}
