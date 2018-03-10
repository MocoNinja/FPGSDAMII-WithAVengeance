package javi.spring.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Service;

import javi.spring.model.User;

@Service
@Profile("ArrayList")
public class UserServiceArrayList implements UserService {

	private List<User> users = new ArrayList<>();
	
	@Override
	public void addItem(User user) {
		users.add(user);
	}

	@Override
	public List<User> getItems() {
		return users;
	}
	
	@Override
	public void clear() {
		users = new ArrayList<>();
	}

}
