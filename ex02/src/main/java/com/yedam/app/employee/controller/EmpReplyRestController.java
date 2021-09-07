package com.yedam.app.employee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yedam.app.board.domain.Criteria;
import com.yedam.app.employee.domain.EmpReplyVO;
import com.yedam.app.employee.service.EmpReplyService;

@RestController
@RequestMapping("/empReply/*")
public class EmpReplyRestController {

	@Autowired EmpReplyService empReplyService;
	
	// 전체조회 (해당 게시글의 댓글만 조회)
	@GetMapping("/")
	public List<EmpReplyVO> getList(Criteria cri, @RequestParam long bno){
		return empReplyService.getList(cri, bno);
	}
	
	// 댓글조회
	@GetMapping("/{rno}")
	public EmpReplyVO read(@PathVariable long rno) {
		return empReplyService.read(rno);
	}
	
	// 등록처리
	@PostMapping("/")
	public EmpReplyVO insert(@PathVariable long rno, EmpReplyVO vo) {
		vo.setRno(rno);
		empReplyService.insert(vo);
		return empReplyService.read(rno);
	}
	
	// 수정처리
	@PutMapping("/")
	public EmpReplyVO update(@PathVariable long rno, EmpReplyVO vo) {
		vo.setRno(rno);
		empReplyService.insert(vo);
		return empReplyService.read(rno);
	}	
	
	// 삭제처리
	@DeleteMapping("/{rno}")
	public boolean delete(@PathVariable long rno, EmpReplyVO vo) {
		vo.setRno(rno);
		int result =  empReplyService.delete(vo);
		return result == 1 ? true : false;
	}		
	
}
