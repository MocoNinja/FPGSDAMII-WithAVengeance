package javi.spring.controller;

import org.apache.logging.log4j.Level;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import javi.spring.model.Departament;
import javi.spring.service.DepartamentService;

@Controller
public class DepartamentController {

	private Departament departament;
	private static Logger log = LogManager.getLogger(DepartamentController.class);

	@Autowired
	DepartamentService departaments;

	@GetMapping("/Departament")
	public ModelAndView loadIndex() {
		log.log(Level.INFO, "Displaying the form to insert a new departamente");
		ModelAndView model;
		if (departament == null) {
			log.log(Level.INFO, "DEPARTAMENT WAS NULL");
			departament = new Departament();
			model = new ModelAndView("departament", "command", departament);
			model.addObject(departament);
		} else {
			model = new ModelAndView("departament", "command", this.departament);
			model.addObject("departaments", departaments.getItems());
		}

		return model;
	}

	@PostMapping("/Departament/Add")
	public ModelAndView userAdd(Departament departament) {
		log.log(Level.INFO, "Inserting a new Departament");
		ModelAndView model = new ModelAndView("departament", "command", departament);
		departaments.addItem(departament);
		model.addObject("departaments", departaments.getItems());
		return model;
	}
	
}
