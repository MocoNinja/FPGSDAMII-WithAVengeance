package javi.spring.controller;

import java.util.Map;

import org.apache.logging.log4j.Level;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {
	@Value("${application.message:Hello World}")
	private String helloMessage;
	
	@GetMapping("/")
	public String welcome(Map model) {
		model.put("message", helloMessage);
		return "index";
	}
}
