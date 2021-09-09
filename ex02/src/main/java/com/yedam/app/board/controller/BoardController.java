package com.yedam.app.board.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
//import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yedam.app.board.domain.BoardAttachVO;
import com.yedam.app.board.domain.BoardVO;
import com.yedam.app.board.domain.Criteria;
import com.yedam.app.board.domain.PageVO;
import com.yedam.app.board.service.BoardService;

@Controller
@RequestMapping("/board/*")
// @SessionAttributes("cri")
public class BoardController {

	@Autowired BoardService boardService;	

	// 조회는 get, 등록 및 수정은 post 방식
	
	// 전체조회
	@GetMapping("/list")
	public void list(Model model
					, @ModelAttribute("cri") Criteria cri) {
		System.out.println("cri=======" + cri);
		int total = boardService.getTotalCount(cri);
		model.addAttribute("list", boardService.getList(cri));
		model.addAttribute("pageMaker", new PageVO(cri, total));
	}
	
	// 단건조회(수정페이지)
	@GetMapping("/get") // view page
	public void read(Model model
					, BoardVO board
					, @ModelAttribute("cri") Criteria cri) { // bno 파라미터를 담는 vo -> 커맨드 객체
		model.addAttribute("board", boardService.read(board));
	}	
	
	// 수정처리
	@PostMapping("/modify")
	public String modify(BoardVO vo
						, @ModelAttribute("cri") Criteria cri
						, RedirectAttributes rttr) {
		int result = boardService.update(vo);
		if(result == 1) {
			rttr.addAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		return "redirect:/board/list"; // 파라미터 전달 x , ( forward: 파라미터 전달 )
		// redirect : get 방식??
	}
	
	// 등록페이지
	@GetMapping("/register") // 겟방식으로 넘기면 등록페이지 핸들러로 넘어가고
	public void registerForm() {}
	
	// 등록처리
	@PostMapping("/register") // 포스트방식으로 넘기면 등록처리 후 list로 이동한다.
	public String register(BoardVO vo
							, MultipartFile[] uploadFile
							, RedirectAttributes rttr) throws IllegalStateException, IOException {
/*
 * 		--ajaxController 로 옮기기 위해 주석처리
 * 
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
		vo.setAttachList(list);
*/		
		boardService.insert(vo);
		rttr.addAttribute("result", vo.getBno()); // redirect가 값을 못 넘겨주니까 해당 코드로 파라미터 전달 설정.

		return "redirect:/board/list"; // 파라미터 전달 x , ( forward: 파라미터 전달 )
	}
	
	// 삭제처리
	@PostMapping("/delete")
	public String delete(BoardVO vo
						, @ModelAttribute("cri") Criteria cri
						, RedirectAttributes rttr) {
		int result = boardService.delete(vo);
		if(result == 1) {
			rttr.addAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		return "redirect:/board/list"; // 파라미터 전달 x , ( forward: 파라미터 전달 )
	}
	
	
	/**
	* 첨부파일로 등록된 파일에 대하여 다운로드를 제공한다. *
	* @param commandMap
	* @param response
	* @throws Exception
	*/
	@RequestMapping(value = "/download")
	public void cvplFileDownload(@RequestParam Map<String, Object> commandMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 넘기는 파라미터가 여러 개라면 맵으로 받으면 맵에 전부 들어온다.
		// 받는 값이 하나라면 그냥 String으로 바로 uuid 받아도 문제 없다. (?)
		String uuid = (String) commandMap.get("uuid");
		
		// uuid로 첨부파일 검색
		BoardAttachVO attachvo = boardService.readAttach(uuid);
		String fileName = "";
		if(attachvo != null) {
			fileName = attachvo.getFileName();
		}
		
		File uFile = new File("c:/upload", uuid+fileName); // 실제 서버에 있는 파일
		long fSize = uFile.length();
		
		if (fSize > 0) {
			String mimetype = "application/x-msdownload";
			response.setContentType(mimetype);
			response.setHeader("Content-Disposition", "attachment;filename=\"" + URLEncoder.encode(fileName, "utf-8") + "\"");
			// setDisposition(atchFileId, request, response);
			BufferedInputStream in = null;
			BufferedOutputStream out = null;
			try {
				in = new BufferedInputStream(new FileInputStream(uFile)); // 실제 서버에 있는 파일을 열고(input)
				out = new BufferedOutputStream(response.getOutputStream()); // 보내면(out)
				FileCopyUtils.copy(in, out); // = 다운로드
				out.flush();
			} catch (IOException ex) {
			} finally {
			in.close(); response.getOutputStream().flush(); response.getOutputStream().close();
			}
		} else {
			response.setContentType("application/x-msdownload");
			PrintWriter printwriter = response.getWriter();
			printwriter.println("<html>");
			printwriter.println("<h2>Could not get file name:<br>" + uuid+fileName + "</h2>");
			printwriter.println("<center><h3><a href='javascript: history.go(-1)'>Back</a></h3></center>");
			printwriter.println("&copy; webAccess");
			printwriter.println("</html>");
			printwriter.flush();
			printwriter.close();
		}
	}	
	
}
