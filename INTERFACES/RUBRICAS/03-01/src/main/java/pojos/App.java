package pojos;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;

public class App
{
	private static BeanFactory bf;
	
	public static BeanFactory getFact()
	{
		bf = new XmlBeanFactory(new ClassPathResource("spring-beans.xml"));
		return bf;
	}
	
	public static void main(String[] args)
	{
		HelloWorld h = (HelloWorld) getFact().getBean("helloBean");
		System.out.println(h.getUsuario());
	}
}
