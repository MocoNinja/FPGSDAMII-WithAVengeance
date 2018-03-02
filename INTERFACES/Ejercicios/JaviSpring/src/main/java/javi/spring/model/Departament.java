package javi.spring.model;

import java.util.ArrayList;
import java.util.List;

public class Departament {

	private String name;
	private long id;
	private List<Field> fields;
	
	public Departament() {
		fields = new ArrayList<>();
	}
	
	public List<Field> getFields() {
		return fields;
	}
	
	public void setFields(List<Field> fields) {
		this.fields = fields;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}
	
}
