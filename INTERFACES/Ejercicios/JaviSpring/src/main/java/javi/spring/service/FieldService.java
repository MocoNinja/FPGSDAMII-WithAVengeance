package javi.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import javi.spring.model.Field;

@Service
public interface FieldService {

	public void addItem(Field field);
	
	public List<Field> getItems();
	
	public void clear();
	
}
