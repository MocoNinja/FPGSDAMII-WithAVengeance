package pojos;

import java.util.Map;

public class Departamento
{
    private int Id;
    private String nombre;
    private Map<String, String> empleado;
    
    public Departamento()
    {
    	
    }
    
    public Departamento (int Id, String nombre, Map<String, String> empleado)
    {
    	setId(Id);
    	setNombre(nombre);
    	setEmpleado(empleado);
    }
    
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public Map<String, String> getEmpleado() {
		return empleado;
	}
	public void setEmpleado(Map<String, String> empleado) {
		this.empleado = empleado;
	}
	
	@Override
	public String toString()
	{
		StringBuilder msg = new StringBuilder();
		msg.append(String.format("Id Departamento: %d%n", getId()));
		msg.append(String.format("Nombre departamento: %s%n", getNombre()));
		msg.append(String.format("Lista de empleados:%n"));
		int indiceEmpleado = 1;
		for (Map.Entry<String, String> mapValue : getEmpleado().entrySet()) {
			msg.append(String.format("%nEMPLEADO %d: Designación:%s ; Nombre: %s.", indiceEmpleado++,
					mapValue.getKey(), mapValue.getValue()));
		}
		return new String(msg);
	}
}
