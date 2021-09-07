package com.yedam.app.employee.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.app.board.domain.Criteria;
import com.yedam.app.employee.domain.EmpReplyVO;

public interface EmpReplyService {
	
	// 등록
	public int insert(EmpReplyVO vo);
	
	// 수정
	public int update(EmpReplyVO vo);
	
	// 삭제
	public int delete(EmpReplyVO vo);
	
	// 단건조회
	public EmpReplyVO read(long rno);
	
	// 전체조회
	// 파라미터 두개 이상 넘길 때 @Param 사용
	public List<EmpReplyVO> getList(@Param("cri") Criteria cri, @Param("bno") long bno);
}
