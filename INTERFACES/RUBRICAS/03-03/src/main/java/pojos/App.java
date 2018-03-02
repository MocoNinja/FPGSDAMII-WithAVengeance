package pojos;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class App
{
	public static void main(String[] args)
	{
		ApplicationContext contextObj = new ClassPathXmlApplicationContext("spring-beans.xml");
		Departamento deptObj = (Departamento) contextObj.getBean("departmentBean");
		System.out.println(deptObj.toString());
	}
}
