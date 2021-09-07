package com.yedam.app.employee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yedam.app.board.domain.Criteria;
import com.yedam.app.board.domain.PageVO;
import com.yedam.app.employee.domain.EmployeeVO;
import com.yedam.app.employee.service.EmployeeService;

@Controller
@RequestMapping("/employee/*")
public class EmployeeController {

	@Autowired EmployeeService employeeService;
	
	// 전체조회
	@GetMapping("/listEmp")
	public void listEmp(Model model, @ModelAttribute("cri") Criteria cri) {
		model.addAttribute("list", employeeService.getListEmp(cri));
		int total = employeeService.getTotalCount(cri);
		model.addAttribute("pageMaker", new PageVO(cri, total));
	}
	
	// 단건조회 ( 수정페이지 )
	@GetMapping("/getEmp")
	public void getEmp(Model model, EmployeeVO emp, @ModelAttribute("cri") Criteria cri) {
		model.addAttribute("emp", employeeService.readEmp(emp));
	}
	
	// 등록페이지
	@GetMapping("/registerEmp")
	public void registerEmpForm() {}
	
	// 등록처리
	@PostMapping("/registerEmp")
	public String registerEmp(EmployeeVO emp, RedirectAttributes rttr) {
		employeeService.insertEmp(emp);
		rttr.addAttribute("result", emp.getEmployeeId());
		return "redirect:/employee/listEmp";
	}
	
	// 수정처리
	@PostMapping("/modifyEmp")
	public String modifyEmp(EmployeeVO emp, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		int result = employeeService.updateEmp(emp);
		if(result == 1) {
			rttr.addAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		return "redirect:/employee/listEmp";
	}
	
	// 삭제처리
	@PostMapping("/deleteEmp")
	public String delete(EmployeeVO emp, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		int result = employeeService.deleteEmp(emp);
		if(result == 1) {
			rttr.addAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		return "redirect:/employee/listEmp";
	}
}
