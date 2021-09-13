package com.dbal.app.book.service;

import java.util.List;

import com.dbal.app.book.domain.BookVO;

public interface BookService {
	public int insertBook(BookVO vo);
	public List<BookVO> bookList();
	public BookVO readBook();
	public List<BookVO> readRentalBook();
}
