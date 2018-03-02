package javi.spring.service;

import org.springframework.stereotype.Service;

import javi.spring.model.Person;


@Service
public class PersonService {

  public boolean isValid(Person person) {
    return person != null
        && person.getProfession() != null
        && person.getProfession().equals("Software Developer");
  }
}