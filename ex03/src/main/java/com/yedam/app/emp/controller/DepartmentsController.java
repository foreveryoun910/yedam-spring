package com.yedam.app.emp.controller;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
	@GetMapping("/readDept/{departmentId}")
	@ResponseBody
	public DepartmentsVO readDept(@PathVariable("departmentId") int departmentId, Model model, DepartmentsVO dept) {
		dept.setDepartmentId(departmentId);
		model.addAttribute("dept", deptService.readDept(dept));
		return deptService.readDept(dept);
	}


	// ajax 등록처리
	@PostMapping(value="/insertDept"
				, headers = {"Content-type=application/json"})
	@ResponseBody
	public Map insertDept(DepartmentsVO dept) {
		deptService.insertDept(dept);
		return Collections.singletonMap("result", true);
	}
	
	// ajax 수정처리
	@PutMapping(value="/updateDept"
				, consumes="application/json") // 요청헤더
	@ResponseBody
	public int updateDept(DepartmentsVO dept) {
		int result = deptService.updateDept(dept);
		return result;
	}
	
	// ajax 삭제처리
	@DeleteMapping("/deleteDept")
	@ResponseBody
	public boolean deleteDept(@PathVariable int id, DepartmentsVO dept) {
		dept.setDepartmentId(id);
		int result = deptService.deleteDept(dept);
		
		if(result == 1) {
			return true;
		}
		else {
			return false;
		}
	}

	
}
