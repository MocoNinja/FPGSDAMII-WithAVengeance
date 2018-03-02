package javi.spring.model;

public class Saludo {
	private String jugador, mensaje;

	public String getJugador() {
		return jugador;
	}

	public void setJugador(String jugador) {
		this.jugador = jugador;
	}

	public String getMensaje() {
		return mensaje;
	}

	public void setMensaje(String mensaje) {
		this.mensaje = mensaje;
	}

	@Override
	public String toString() {
		return "Saludo [jugador=" + jugador + ", mensaje=" + mensaje + "]";
	}

	public Saludo(String jugador, String mensaje) {
		this.jugador = jugador;
		this.mensaje = mensaje;
	}
	
}
