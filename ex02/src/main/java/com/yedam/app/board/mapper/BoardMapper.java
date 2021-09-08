package com.yedam.app.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.app.board.domain.BoardVO;
import com.yedam.app.board.domain.Criteria;

public interface BoardMapper {

	// 			CRUD
	// 등록
	public int insert(BoardVO vo);
	
	// 수정
	public int update(BoardVO vo);
	
	// 삭제
	public int delete(BoardVO vo);
	
	// 단건조회
	public BoardVO read(BoardVO vo);
	
	// 전체조회
	public List<BoardVO> getList(Criteria cri);
	
	// total ( 전체 데이터 건수 구하기 )
	public int getTotalCount(Criteria cri);
	
	// 댓글수 업데이트
	public void updateReplyCnt(@Param("bno") long bno, @Param("amount") long amount);
}
