package com.yedam.app.emp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.app.emp.domain.DepartmentsVO;
import com.yedam.app.emp.service.DepartmentsService;

@Controller
public class DepartmentsController {

	@Autowired DepartmentsService deptService;

	
	// 부서관리 페이지 요청
	@GetMapping("/dept")
	public String dept() {
		return "emp/dept";
	}
	
	// ajax 전체조회
	@GetMapping("/deptList")
	@ResponseBody
	public List<DepartmentsVO> deptList(Model model) {
		return deptService.getDeptList();
	}
	
	// ajax 단건조회
	@GetMapping("/readDept")
	@ResponseBody
	public DepartmentsVO readDept(Model model, DepartmentsVO dept) {
		return deptService.readDept(dept);
	}


	// ajax 등록처리
	@PostMapping("/insertDept")
	@ResponseBody
	public int insertDept(DepartmentsVO dept) {
		int result = deptService.insertDept(dept);
		return result;
	}
	
	// ajax 수정처리
	@PutMapping("/updateDept")
	@ResponseBody
	public int updateDept(DepartmentsVO dept) {
		int result = deptService.updateDept(dept);
		return result;
	}
	
	// ajax 삭제처리
	@DeleteMapping("/deleteDept")
	@ResponseBody
	public int deleteDept(DepartmentsVO dept) {
		int result = deptService.deleteDept(dept);
		return result;
	}

	
}
