package javi.spring.service;

import org.springframework.stereotype.Service;

@Service
public class LoginService {
	public boolean validateUser(String nick, String pass) {
		return (nick.equals("MocoNinja") && pass.equals("DoggosÜberAlles"));
	}
}
