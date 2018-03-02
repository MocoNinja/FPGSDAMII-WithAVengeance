package javi.spring.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import javi.spring.model.Todo;

@Service

public class TodoService {

    private static List<Todo> todos = new ArrayList<Todo>();

    private static int todoCount = 3;

    static {

        todos.add(new Todo(1, "MocoNinja", "Learn Spring MVC", new Date(), false));

        todos.add(new Todo(2, "MocoNinja", "Aprobar", new Date(), false));

        todos.add(new Todo(3, "MocoNinja", "Morir", new Date(), false));

    }

    public List<Todo> retrieveTodos(String user) {

        List<Todo> filteredTodos = new ArrayList<Todo>();

        for (Todo todo : todos) {

            if (todo.getUser().equals(user)) {

                filteredTodos.add(todo);

            }

        }

        return filteredTodos;

    }

}

