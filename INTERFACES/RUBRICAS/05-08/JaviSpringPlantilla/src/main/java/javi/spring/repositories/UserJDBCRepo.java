package javi.spring.repositories;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javi.spring.model.User;

@Repository
public class UserJDBCRepo {
	@Autowired
	JdbcTemplate jdbcTemplate;

	public User findById(String dni) {
		return jdbcTemplate.queryForObject("select * from USER where dni=?", new Object[] { dni },
				new BeanPropertyRowMapper<User>(User.class));
	}

	public List<User> findAll() {
		return jdbcTemplate.query("select * from USER", new BeanPropertyRowMapper<User>(User.class));
	}

	public int deleteById(String dni) {
		return jdbcTemplate.update("delete from student where dni=?", new Object[] {
				dni
		});
	}

	public int insert(User user) {
		return jdbcTemplate.update("insert into user " + "values(?,  ?, ?)",
				new Object[] {
						user.getDni(), user.getNombre(), user.getApellido()
				});
	}

	public int update(User user) {
		return jdbcTemplate.update("update user " + " set nombre = ?, apellidos = ? " + " where dni = ?",
				new Object[] {
						user.getNombre(), user.getApellido(), user.getDni()
				});
	}
}
