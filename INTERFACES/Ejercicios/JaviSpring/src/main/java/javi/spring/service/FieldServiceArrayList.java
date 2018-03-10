package javi.spring.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Service;

import javi.spring.model.Field;

@Service
@Profile("ArrayList")
public class FieldServiceArrayList implements FieldService {

	private List<Field> fields = new ArrayList<>();
	
	@Override
	public void addItem(Field field) {
		fields.add(field);
	}

	@Override
	public List<Field> getItems() {
		return fields;
	}
	
	@Override
	public void clear() {
		fields = new ArrayList<>();
	}

}
