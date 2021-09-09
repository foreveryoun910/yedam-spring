package com.yedam.app.board.domain;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Data
public class BoardVO {
	private long bno; // 게시글번호 // NUMBER(10, 0) 10자리가 넘어가면 int로 표현 불가능
	private String title; // 제목
	private String content; // 내용
	private String writer; // 작성자
	@JsonFormat(pattern = "yyyy/MM/dd")
	// 자바 SimpleDateFormat api 확인
	// https://docs.oracle.com/javase/8/docs/api/
	private Date regDate; // 작성일자
	@JsonIgnore
	private Date updateDate; //수정일자
	
	private long replycnt; // 댓글 수 카운트
	
	private List<BoardAttachVO> attachList; // 연결된 첨부파일 리스트
	
}
