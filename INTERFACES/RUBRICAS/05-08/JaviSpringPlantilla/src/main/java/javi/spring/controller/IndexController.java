package javi.spring.controller;

import org.apache.logging.log4j.Level;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import javi.spring.repositories.UserJDBCRepo;

@Controller
public class IndexController {
	
	@Autowired
    UserJDBCRepo repository;

	private static Logger log = LogManager.getLogger(IndexController.class);

	@GetMapping("/")
	public ModelAndView index() {
		log.log(Level.ALL, "PROBANDO BANDO BANDO " + repository.findById("aaa1").toString());
		return new ModelAndView("index");
	}
}
