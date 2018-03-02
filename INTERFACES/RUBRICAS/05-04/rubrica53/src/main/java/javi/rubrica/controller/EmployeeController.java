package javi.rubrica.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javi.rubrica.app.EmployeeService;
import javi.rubrica.model.Employee;
@RestController
public class EmployeeController {
	
	@Autowired
	private EmployeeService service;
	
	@RequestMapping("home")
	public List<Employee> showData() {
		List<Employee> list = service.getAllEmployee();
		return list;
 	}
} 