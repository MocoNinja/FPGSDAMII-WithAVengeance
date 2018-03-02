package Entidades;

import Entidades.Alumno;
import Entidades.Asignatura;
import Entidades.NotaPK;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-02-22T18:11:13")
@StaticMetamodel(Nota.class)
public class Nota_ { 

    public static volatile SingularAttribute<Nota, Integer> calificacion;
    public static volatile SingularAttribute<Nota, Asignatura> asignatura;
    public static volatile SingularAttribute<Nota, Alumno> alumno;
    public static volatile SingularAttribute<Nota, NotaPK> notaPK;

}