package javi.spring.controller;

import org.apache.logging.log4j.Level;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import javi.spring.model.User;
import javi.spring.service.UserService;

@Controller
public class UserController {

	private User user;
	private static Logger log = LogManager.getLogger(UserController.class);

	@Autowired
	UserService users;

	@GetMapping("/User")
	public ModelAndView loadIndex() {
		log.log(Level.INFO, "Displaying the form to insert a new user");
		ModelAndView model;
		if (user == null) {
			log.log(Level.INFO, "USER WAS NULL");
			user = new User();
			model = new ModelAndView("user", "command", user);
			model.addObject(user);
		} else {
			model = new ModelAndView("user", "command", this.user);
			model.addObject("users", users.getItems());
		}

		return model;
	}

	@PostMapping("/User/Add")
	public ModelAndView userAdd(User user) {
		log.log(Level.INFO, "Inserting a new user");
		ModelAndView model = new ModelAndView("user", "command", user);
		users.addItem(user);
		model.addObject("users", users.getItems());
		return model;
	}
	
	@GetMapping("/User/Delete")
	public String warn() {
		return "userDelete";
	}

	@GetMapping("/User/DeleteForReal")
	public ModelAndView userDelete() {
		user = new User();
		users.clear();
		ModelAndView model = new ModelAndView("user", "command", user);
		model.addObject(user);
		return model;
	}
	
}
