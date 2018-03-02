package javi.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import javi.spring.model.User;

@Service
public interface UserService {

	public void addItem(User user);
	
	public List<User> getItems();
	
	public void clear();
	
}
