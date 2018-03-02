package javi.spring.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Service;

import javi.spring.model.Departament;

@Service
@Profile("ArrayList")
public class DepartamentServiceArrayList implements DepartamentService {

	private List<Departament> departaments = new ArrayList<>();
	
	@Override
	public void addItem(Departament departament) {
		departaments.add(departament);
	}

	@Override
	public List<Departament> getItems() {
		return departaments;
	}
	
	@Override
	public void clear() {
		departaments = new ArrayList<>();
	}

}
