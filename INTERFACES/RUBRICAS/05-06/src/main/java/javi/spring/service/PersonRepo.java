package javi.spring.service;

import org.springframework.stereotype.Service;

import javi.spring.model.Person;

@Service
public class PersonRepo {
	
	public void persist(Person person) {
		System.out.println("Persisting person " + person);
	}
}