package Entidades;

import Entidades.Asignatura;
import Entidades.Curso;
import Entidades.CursoasignaturaPK;
import Entidades.Profesor;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-02-22T18:11:13")
@StaticMetamodel(Cursoasignatura.class)
public class Cursoasignatura_ { 

    public static volatile SingularAttribute<Cursoasignatura, CursoasignaturaPK> cursoasignaturaPK;
    public static volatile SingularAttribute<Cursoasignatura, Asignatura> asignatura;
    public static volatile SingularAttribute<Cursoasignatura, String> aula;
    public static volatile SingularAttribute<Cursoasignatura, Profesor> nifProfesor;
    public static volatile SingularAttribute<Cursoasignatura, Curso> curso;

}