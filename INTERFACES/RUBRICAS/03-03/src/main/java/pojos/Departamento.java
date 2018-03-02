package pojos;


public class Departamento
{
    private int Id;
    private String nombre;
    private int numeroEmpleados;
    
    public Departamento()
    {
    	
    }
    
    public Departamento (int Id, String nombre, int empleados)
    {
    	setId(Id);
    	setNombre(nombre);
    	// si el setter/getter del metodo no se llama igual que el atributo
    	// spring no lo coge. OJO!!
    	setnumeroEmpleados(empleados);
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
	
	public int getnumeroEmpleados()
	{
		return numeroEmpleados;
	}
	
	public void setnumeroEmpleados(int numero)
	{
		numeroEmpleados = numero;
	}
	
	@Override
	public String toString()
	{
		StringBuilder msg = new StringBuilder();
		msg.append(String.format("Id Departamento: %d%n", getId()));
		msg.append(String.format("Nombre departamento: %s%n", getNombre()));
		msg.append(String.format("Lista de empleados:%n"));
		return new String(msg);
	}
}
