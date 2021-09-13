package com.yedam.app.emp.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yedam.app.emp.domain.EmpVO;
import com.yedam.app.emp.service.DepartmentsService;
import com.yedam.app.emp.service.EmpService;
import com.yedam.app.emp.service.JobsService;

@Controller
@RequestMapping("/emp/*")
public class EmpController {

	@Autowired EmpService empService;
	@Autowired JobsService jobsService;
	@Autowired DepartmentsService departmentsService;
	
	
	// 원래 핸들러마다 하나하나 다 해줘야 하는 건데 가장 상단에(모델 핸들러 실행 전) 정의 후 끌어쓸 수 있다.
/*
	@ModelAttribute("jobs")
	public List<JobsVO> jobs(){
		return jobsService.getJobList();
	}
*/
	
	@ModelAttribute("opt")
	public Map<String, Object> jobs(){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("jobs", jobsService.getJobList());
		map.put("depts", departmentsService.getDeptList());
		return map;
	}
	
	
	// 전체조회
	@GetMapping("/empList")
	public void empList(Model model) {
		model.addAttribute("list", empService.getEmpList());
	}
	
	// 사원검색
	@RequestMapping("/empSearch")
	public String empSearch(Model model, EmpVO emp) {
		model.addAttribute("list", empService.getEmpList());
		return "emp/empSearch";
	}
	
	// 사원검색(ajax) - id 및 email 이용
	@RequestMapping("/ajaxEmp")
	@ResponseBody
	public EmpVO ajaxEmp(Model model, EmpVO emp) {
		return empService.readEmp(emp);
	}	
	
	// 단건조회, 수정페이지
	@GetMapping("/readEmp")
	public String readEmp(Model model, EmpVO emp) {
		model.addAttribute("emp", empService.readEmp(emp));
		return "emp/readEmp";
	}
	
	// 등록페이지
	@GetMapping("/insertEmp")
	public String insertEmpForm(Model model, EmpVO emp) {
		model.addAttribute("emp", empService.readEmp(emp));
		return "emp/insertEmp";
	}
	
	// 등록처리
	@PostMapping("/insertEmp")
	public String insertEmp(EmpVO emp) {
		empService.insertEmp(emp);
		
		return "redirect:/emp/empList";
	}

	// 수정페이지
	@GetMapping("/updateEmp")
	public String updateEmpForm() {
		return "emp/insertEmp";
	}	
	
	// 수정처리
	@PostMapping("/updateEmp")
	public String updateEmp(EmpVO emp) {
		empService.updateEmp(emp);
		
		return "redirect:/emp/empList";		
	}
	
	// 삭제처리
	@PostMapping("/deleteEmp")
	public String deleteEmp(EmpVO emp) {
		empService.deleteEmp(emp);
		
		return "redirect:/emp/empList";		
	}
	
}
