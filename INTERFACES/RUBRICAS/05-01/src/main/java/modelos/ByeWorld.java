package modelos;

public class ByeWorld {
	private String message;
	
	public String getMessage() {
		String message = "Yo: " + this.message;
		return message;
	}
	
	public void setMessage(String message) {
		this.message = message;
	}
}
