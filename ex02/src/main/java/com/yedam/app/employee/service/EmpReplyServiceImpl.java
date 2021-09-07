package com.yedam.app.employee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.app.board.domain.Criteria;
import com.yedam.app.employee.domain.EmpReplyVO;
import com.yedam.app.employee.mapper.EmpReplyMapper;

@Service
public class EmpReplyServiceImpl implements EmpReplyService {

	@Autowired EmpReplyMapper empReplyMapper;
	
	@Override
	public int insert(EmpReplyVO vo) {
		return empReplyMapper.insert(vo);
	}

	@Override
	public int update(EmpReplyVO vo) {
		return empReplyMapper.update(vo);
	}

	@Override
	public int delete(EmpReplyVO vo) {
		return empReplyMapper.delete(vo);
	}

	@Override
	public EmpReplyVO read(long rno) {
		return empReplyMapper.read(rno);
	}

	@Override
	public List<EmpReplyVO> getList(Criteria cri, long bno) {
		return empReplyMapper.getList(cri, bno);
	}

}
