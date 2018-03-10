package modelos;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MainApp {
	public static void main(String[] args) {
		
		ApplicationContext context = 
	             new ClassPathXmlApplicationContext("Beans.xml");

	      HelloWorld mensajeitor = (HelloWorld) context.getBean("helloWorld");
	      ByeWorld mensajeitor2 = (ByeWorld) context.getBean("byeWorld");
	      String hola = mensajeitor.getMessage();
	      String adios = mensajeitor2.getMessage();
	      System.out.println(hola + ", " + adios);
	}
}
