package com.dbal.app.book.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dbal.app.book.domain.BookVO;
import com.dbal.app.book.mapper.BookMapper;
import com.dbal.app.book.service.BookService;

@Service
public class BookServiceImpl implements BookService {

	@Autowired BookMapper bookMapper;
	
	@Override
	public int insertBook(BookVO vo) {
		return bookMapper.insertBook(vo);
	}

	@Override
	public List<BookVO> bookList() {
		return bookMapper.bookList();
	}

	@Override
	public BookVO readBook() {
		return bookMapper.readBook();
	}

	@Override
	public List<BookVO> readRentalBook() {
		return bookMapper.readRentalBook();
	}

}
