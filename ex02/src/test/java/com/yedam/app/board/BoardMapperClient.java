package com.yedam.app.board;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yedam.app.board.domain.BoardVO;
import com.yedam.app.board.domain.Criteria;
import com.yedam.app.board.mapper.BoardMapper;

import lombok.extern.java.Log;

@Log
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/spring/*-context.xml")
public class BoardMapperClient {
	
	@Autowired BoardMapper boardMapper;
	
	
	@Test
	public void getList() {
		Criteria cri = new Criteria(1, 10);
		cri.setType("T");
		cri.setKeyword("Java");
		log.info(boardMapper.getList(cri).toString());
	}
	
	
	// @Autowired BoardVO vo;
	// VO는 실제로 사용할 때는 따로 정의 안 해줘도 controller가 다 생성해주니까 따로 Component 등록을 안 하고 사용하는 경우가 많다. 
	// 그러니까 Test할 때는 걍 new 생성자로 만들어서 사용하자.
	
//	@Test
//	@Rollback
	public void insert() {
		BoardVO vo = new BoardVO();
		vo.setTitle("제목테스트 select key");
		vo.setContent("내용테스트 select key");
		vo.setWriter("뉴비");
		
		int result = boardMapper.insert(vo);
	
		assertEquals(result, 1); // result가 1이면 성공, 0이면 실패 뜰 것이다. (막대색상)
		log.info(vo.toString());
		log.info(Long.toString(vo.getBno()));
	}
	
	// @Test
	public void read() {
		// 존재하는 게시물 번호로 테스트
		BoardVO vo = new BoardVO();
		vo.setBno(2);
		vo = boardMapper.read(vo);
		
		log.info(vo.toString());
	}
	
	// @Test
	// @Rollback
	public void update() {
		BoardVO vo = new BoardVO();
		vo.setBno(4);
		vo.setTitle("제목수정");
		vo.setContent("내용수정");
		vo.setWriter("작성자수정");
		
		int result = boardMapper.update(vo);
		assertEquals(result, 1);
		log.info(vo.toString());
	}
	
	// @Test
	// @Rollback // 테스트 결과가 DB에 반영되지 않도록 하는 설정
	public void delete() {
		BoardVO vo = new BoardVO();
		vo.setBno(7);
		
		int result = boardMapper.delete(vo);
		assertEquals(result, 1);
		
		log.info(vo.toString());
	}
}
