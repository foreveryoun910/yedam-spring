package com.yedam.app.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import lombok.extern.java.Log;


@Component("/customLogin")
@Log
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {

		// 로그인 후 자동으로 사용자면 사용자 페이지, 관리자면 관리자 페이지 (해당 페이지)로 넘기기
		// p.638
		log.info("============");
		log.info("login handler 실행");
		
		List<String> roleNames = new ArrayList<>();
		
		authentication.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});
		
		String path = request.getContextPath();
		
		if(roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect(path + "/admin/admin.jsp");
			return;
		}
		
		if(roleNames.contains("ROLE_USER")) {
			response.sendRedirect("emp/empList");
			return;
		}
		response.sendRedirect("/top.jsp");
	}

}
