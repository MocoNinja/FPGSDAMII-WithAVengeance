package javi.spring.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javi.spring.model.Saludo;

@RestController
@RequestMapping("/api")
public class IndexController {
	@GetMapping("/")
	public ModelAndView index() {
		return new ModelAndView("index");
	}

	@RequestMapping("/hello/{name}")
	public Saludo message(@PathVariable String name) {
		Saludo msg = new Saludo(name, "Hello " + name);
		return msg;
	}
}
