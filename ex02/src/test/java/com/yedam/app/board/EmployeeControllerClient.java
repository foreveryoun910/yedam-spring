package com.yedam.app.board;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.java.Log;

@Log
@RunWith(SpringJUnit4ClassRunner.class)

// Test for Controller ( WAS 대신 사용할 가짜 서버 )
@WebAppConfiguration

@ContextConfiguration({"classpath:/spring/*-context.xml"
						, "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})

public class EmployeeControllerClient {
	@Autowired private WebApplicationContext ctx;
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test // p.215
	public void testList() throws Exception {
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/employee/listEmp"))
				.andReturn()
				.getModelAndView()
				.getModelMap()
				.toString()
				);
	}	
}
