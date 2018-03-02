package javi.spring.controller;

import org.apache.logging.log4j.Level;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {
	private static Logger log = LogManager.getLogger(IndexController.class);

	@GetMapping("/")
	public ModelAndView index() {
		log.log(Level.ALL, "Starting the application");
		return new ModelAndView("index");
	}
}
