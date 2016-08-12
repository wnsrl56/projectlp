package com.project.test.controller;

import javax.servlet.ServletContext;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.MockitoAnnotations;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.RequestBuilder;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import com.project.controller.CommBoardController;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
import static org.springframework.test.web.servlet.setup.MockMvcBuilders.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
								   "file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@WebAppConfiguration
public class CommBoardControllerTest {
	
	@InjectMocks
	private CommBoardController commBoardController;	
	
	@Autowired
	private WebApplicationContext wac;	
	private MockMvc mockMvc;
	
	@Before
	public void setUp() throws Exception {
		MockitoAnnotations.initMocks(this);
		//mock을 이용한 controller 생성
		mockMvc = MockMvcBuilders.standaloneSetup(commBoardController).build();
		
		
	}	
	
	@Test
	public void testAttributeList() throws Exception{
		
		String uri = "/cboard/listview.action";
		mockMvc.perform(get(uri));
	}
	
	public void testcInsertGet() throws Exception{
		
		
		
	}

}

/*//sampletest
public class MockupControllerTest {

	@InjectMocks
	private TestController testController;	
	@Autowired
	private WebApplicationContext wac;	
	private MockMvc mockMvc;	
	@Before
	public void setUp() throws Exception {
		MockitoAnnotations.initMocks(this);
		mockMvc = MockMvcBuilders.standaloneSetup(testController).build();
	}	
	@Test
	public void testList() throws Exception {
		mockMvc.perform(get("/mockup-test/list.action"));
	}	
	@Test
	public void testRegister() throws Exception {
		mockMvc.perform(get("/mockup-test/register.action")
				.param("x", "100")
				.param("y", "200"))
		.andExpect(status().isOk());	
	}
	
}
*/