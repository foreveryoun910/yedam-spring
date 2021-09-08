package com.yedam.app.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yedam.app.board.domain.Criteria;
import com.yedam.app.board.domain.ReplyPageVO;
import com.yedam.app.board.domain.ReplyVO;
import com.yedam.app.board.service.ReplyService;

@RestController
@RequestMapping("/reply/*")
public class ReplyRestController {

	@Autowired ReplyService replyService;
	
	// Rest 방식 -> 전부 /로 넘기는 대신, Mapping 종류를 다르게 줘서 구분한다.
	
	// 전체조회 (해당 게시글의 댓글만 조회)
	@GetMapping("/")
	public ReplyPageVO getList(Criteria cri, @RequestParam long bno) {
		return replyService.getList(cri, bno);
	}
	
	// 댓글조회
	// return 타입을 int로 하고 long rno만 받는 것도 가능 -> Mapper, Service, ServiceImpl 수정 필요
	@GetMapping("/{rno}")
	public ReplyVO read(@PathVariable long rno, ReplyVO vo) {
		vo.setRno(rno);
		return replyService.read(vo);
	}
	
	// Post, Get : 파라미터 질의문자열(query String) -> ?id=100&pw=100
	// 등록처리 
	@PostMapping("/")
	public ReplyVO insert(ReplyVO vo) {
		replyService.insert(vo);
		return replyService.read(vo);
	}
	
	// Put, Delete : 파라미터 JSON -> { id: 100, pw: "111" ... }
	// 수정처리 
	// @RequestBody : 파라미터가 JSON이면 사용, 파싱해주는 기능
	@PutMapping("/")
	public ReplyVO update(@RequestBody ReplyVO vo) {
		replyService.update(vo);
		return replyService.read(vo);
	}	
	
	@DeleteMapping("/{rno}")
	public boolean delete(@PathVariable long rno, ReplyVO vo) {
		vo.setRno(rno);
		int result =  replyService.delete(vo);
		return result == 1 ? true : false;
	}	
}
