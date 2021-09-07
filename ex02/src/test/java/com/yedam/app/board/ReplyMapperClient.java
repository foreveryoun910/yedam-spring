package com.yedam.app.board;

import static org.junit.Assert.assertEquals;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yedam.app.board.domain.Criteria;
import com.yedam.app.board.domain.ReplyVO;
import com.yedam.app.board.mapper.ReplyMapper;
import com.yedam.app.board.service.ReplyService;

import lombok.extern.java.Log;

@Log
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/spring/*-context.xml")
public class ReplyMapperClient {

	@Autowired ReplyMapper replyMapper;
	@Autowired ReplyService replyService;
	
	
	// 전체조회
	@Test
	public void getList() {
		Criteria cri = new Criteria(1, 20);
		log.info(replyService.getList(cri, 100).toString());
	}
	
	// 단건조회
	@Test @Ignore
	public void read() {
		ReplyVO vo = new ReplyVO();
		vo.setRno(4);
		vo = replyService.read(vo);
		
		log.info(vo.toString());
	}
	
	// 등록
	@Test @Ignore
	public void insert() {
		ReplyVO vo = new ReplyVO();
		vo.setReply("댓글작성");
		vo.setReplyer("작성자3");
		vo.setBno(100);
		
		int result = replyMapper.insert(vo);
		assertEquals(result, 1);
		log.info(vo.toString());
	}
	
	// 수정
	@Test @Ignore
	public void update() {
		ReplyVO vo = new ReplyVO();
		vo.setRno(3);
		vo.setReply("댓글수정ㅋㅋ");
		
		int result = replyService.update(vo);
		assertEquals(result, 1);
		log.info(vo.toString());
	}
}
