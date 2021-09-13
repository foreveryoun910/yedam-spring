package com.dbal.app.book.controller;

import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dbal.app.book.domain.BookVO;
import com.dbal.app.book.service.BookService;

@Controller
@RequestMapping("/book/*")
public class BookController {

	@Autowired BookService bookService;

    @GetMapping(value = "/index")
    public String index() {
        return "index";
    }    	
	
	@GetMapping("/bookList")
	public void bookList(Model model) {
		model.addAttribute("list", bookService.bookList());
	}
	
	@GetMapping("/insertBook")
	public void insertForm(Model model) {
		model.addAttribute("book", bookService.readBook());
	}	
	
	@PostMapping("/insertBook")
	public String insertBook(BookVO vo, RedirectAttributes rttr) {
		bookService.insertBook(vo);
		return "redirect:/book/bookList";
	}
	
	@GetMapping("/readRentalBook")
	public void readRentalBook(Model model) {
		model.addAttribute("rentalList", bookService.readRentalBook());
	}
	
}
