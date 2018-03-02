package javi.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javi.spring.model.Person;
import javi.spring.service.PersonRepo;
import javi.spring.service.PersonService;

@RestController

public class PersonRestController {

    @Autowired private PersonService personService;

    @Autowired private PersonRepo personRepository;

    @RequestMapping(value = "/persistPerson", method = RequestMethod.POST)

    public ResponseEntity < String > persistPerson(@RequestBody Person person) {

        if (personService.isValid(person)) {

            personRepository.persist(person);

            return ResponseEntity.status(HttpStatus.CREATED).build();

        }

        return ResponseEntity.status(HttpStatus.I_AM_A_TEAPOT).build();

    }

}

