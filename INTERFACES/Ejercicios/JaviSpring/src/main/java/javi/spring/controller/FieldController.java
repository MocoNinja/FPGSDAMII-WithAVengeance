package javi.spring.controller;

import org.apache.logging.log4j.Level;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import javi.spring.model.Field;
import javi.spring.service.DepartamentService;
import javi.spring.service.FieldService;

@Controller
public class FieldController {

	private Field field;
	private static Logger log = LogManager.getLogger(FieldController.class);

	@Autowired
	FieldService fields;

	@Autowired
	DepartamentService departaments;
	
	@GetMapping("/Field")
	public ModelAndView loadIndex() {
		log.log(Level.INFO, "Displaying the form to insert a new FIELD");
		ModelAndView model;
		if (field == null) {
			log.log(Level.INFO, "FIELD WAS NULL");
			field = new Field();
			model = new ModelAndView("field", "command", field);
			model.addObject(field);
		} else {
			model = new ModelAndView("field", "command", this.field);
			model.addObject("fields", fields.getItems());
			model.addObject("departaments", departaments.getItems());
		}
		return model;
	}

	@PostMapping("/Field/Add")
	public ModelAndView userAdd(Field field) {
		log.log(Level.INFO, "Inserting a new Departament");
		ModelAndView model = new ModelAndView("field", "command", field);
		fields.addItem(field);
		model.addObject("fields", fields.getItems());
		model.addObject("departaments", departaments.getItems());
		return model;
	}
	
}
