package javi.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import javi.spring.model.Departament;

@Service
public interface DepartamentService {

	public void addItem(Departament department);
	
	public List<Departament> getItems();
	
	public void clear();
	
}
