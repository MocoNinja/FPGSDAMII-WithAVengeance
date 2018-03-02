package javi.spring.model;

public class Field {
	private long id;
	private String Name;
	private long idDepartament;
	private Departament departament;
	
	
	public Departament getDepartament() {
		return departament;
	}
	public void setDepartament(Departament departament) {
		this.departament = departament;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public long getIdDepartament() {
		return idDepartament;
	}
	public void setIdDepartament(long idDepartament) {
		this.idDepartament = idDepartament;
	}
}
