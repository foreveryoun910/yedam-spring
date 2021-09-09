package com.yedam.app.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yedam.app.board.domain.BoardAttachVO;
import com.yedam.app.board.domain.BoardVO;

import lombok.extern.java.Log;

@Log
@Controller
public class UploadController {

	
	@PostMapping("/uploadFormAction")
	public void uploadFormAction(MultipartFile[] uploadFile) throws IllegalStateException, IOException {
		for(int i=0; i<uploadFile.length; i++) {
			MultipartFile ufile = uploadFile[i];
			if(!ufile.isEmpty() && ufile.getSize()>0) {
				String filename = ufile.getOriginalFilename();
				String saveName = System.currentTimeMillis()+".jpg";
				File file = new File("C:\\upload", saveName);
				
				ufile.transferTo(file);
			}
		}
	}
	
	
	
	@PostMapping("/uploadAjaxAction")
	@ResponseBody
	public List<BoardAttachVO> uploadAjaxAction(MultipartFile[] uploadFile, BoardVO vo) throws IllegalStateException, IOException {

		List<BoardAttachVO> list = new ArrayList<BoardAttachVO>();
		String path = "C:/upload";
		
		for(int i=0; i<uploadFile.length; i++) {
			MultipartFile ufile = uploadFile[i];
			if(!ufile.isEmpty() && ufile.getSize()>0) {
				
				BoardAttachVO attachvo = new BoardAttachVO();
				
				String filename = ufile.getOriginalFilename();
				// String saveName = System.currentTimeMillis()+".jpg";
				UUID uuid = UUID.randomUUID();
				File file = new File(path, uuid + filename);
				ufile.transferTo(file);

				// 파일정보
				attachvo.setUuid(uuid.toString());
				attachvo.setFileName(filename);
				attachvo.setUploadPath(path);
				list.add(attachvo);
			}
		}		
		return list;
		
/*		
 * 		--리턴 타입: boolean		
 * 
		log.info("boardvo==" + vo);
		
		for(int i=0; i<uploadFile.length; i++) {
			MultipartFile ufile = uploadFile[i];
			if(!ufile.isEmpty() && ufile.getSize()>0) {
				String filename = ufile.getOriginalFilename();

				log.info("filename==" + filename);

				// String saveName = System.currentTimeMillis()+".jpg";
				UUID uuid = UUID.randomUUID();
				
				File file = new File("C:/upload", uuid + filename);
				
				ufile.transferTo(file);
			}
		}
		return true;
*/		
	}
	
	
	
	
	
	// 상태값을 넘기고 싶을 때 (200, 400, 404 이런 거) ResponseEntity 사용한다?
	@GetMapping("page2")
	public ResponseEntity<BoardVO> page2(@RequestParam int h){
		// 참고페이지 p.364
		ResponseEntity<BoardVO> result = null;
		if(h<10) {
			result = ResponseEntity.status(HttpStatus.NOT_FOUND).body(new BoardVO());
		} else {
			result = ResponseEntity.status(HttpStatus.OK).body(new BoardVO());
		}
		return result;
	}
	
	
	@GetMapping("page1")
	public void page1(HttpServletResponse response) {
		PrintWriter out;
		try {
			// response.setContentType("text/html; charset=UTF-8");
			String mimetype = "application/x-msdownload";
			response.setContentType(mimetype);
			out = response.getWriter();
			out.println("<html>");
			out.println("<body>");
			out.println("<div>오 신기한디ㅋㅋ</div>");
			out.println("</body>");
			out.println("</html>");
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
		
}
