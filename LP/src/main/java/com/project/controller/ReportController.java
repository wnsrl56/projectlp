package com.project.controller;

import javax.servlet.http.HttpSession;

import org.rosuda.JRI.Rengine;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;
import com.project.common.ReportFromR;

@Controller
@RequestMapping("/report/")
public class ReportController {

	@RequestMapping(	value = "test.action", method = RequestMethod.GET)
	public String test(
			Model model,
			HttpSession session) 
	{
		// R engine의 인스턴스를 가져온다.
		ReportFromR report = new ReportFromR();
		
		Rengine re = report.getREngine();
	if(re==null)
	{
	      	return "redirect:/home.action";
	}

	// DB에서 데이터를 가져온다.
	

	// JSON 형태로 변환한다.
	Gson gson = new Gson();
	String json;
    //	json = gson.toJson();	// JSON 의 String 으로 변환한다.

	// JSON 형태로 변환한 문자열을 R에 넣기
    /* re.eval("library(jsonlite)");
        re.eval(String.format("json <- '%s'", json));
        re.eval("rs <- fromJSON(json)");
*/
        
        // text 형식으로 R 사용하기. 표를 만들어서 PNG 이미지 파일로 만들
        re.eval("print(rs)");

        String path = session.getServletContext().getRealPath("/resources/statistics/");
        path = path.replace("\\", "/");
        
        String saveFileName = "test.png";
        
        System.out.println("path: " + path + saveFileName);
        
        re.eval(String.format("png(width = %d, height = %d, filename = \"%s%s\")", 700, 700, path, saveFileName));

        re.eval("print(barplot(rs, col=rainbow(round(rs))))");

        re.eval("dev.off()");	// 윈도 닫기
        
        return "/statistics/result";
	}
}
