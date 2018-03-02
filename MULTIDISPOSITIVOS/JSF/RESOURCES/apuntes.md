# Primer ejercicio de JSF: Biblioteca

## Día 0

### Configuración de la base de datos

_Base de datos_: **biblioteca**

tabla paises

cod_pais int clave primaria no autoincrementativo
nom_pais varchar 50
bandera varchar 50

motor almacenamiento InnoDB

tabla autores

id, nombre, apellido, nacionalidad (debe ser una clave foranea, asi que hay que poner index)

vamos a hacer una relacion 1 a n con autores pais (de un pais hay muchos autores, pero un autor tiene solo un pais) -> en la tabla de autores hay que ligar la nacionalidad a la id del pais

importante los triggers

on delete restrict -> no borra los autores
on update cascade -> al actualizar si actualiza

## Día 1

### Netbeans: configuración

Se ha creado un proyecto que se llama biblioteca y se han elegido las opciones de configuración:

* Servidor: glassfish
* Proyecto: Java Web Application
* Framework: JSF (con PrimeFaces adicionalmente)

### Netbeans: integración con la base de datos

En servicios, hay que ir al servidor de mysql, que debe haber detectado, y hacer el 'new connection wizard'.
A mí me ha salido **solo**, pero el ha tenido que elegir el driver name mysql al darle a _connect_

### Netbeans: configuración automática de la estructura del proyeto

Recordemos que para nosotros la **_Persistencia_** implica ir creando todo (Objetos, Vistas, Controladores...) a partir de la base de datos.

En **proyecto** se hace new → other → Persistence → Entity Clases from Database

Esto va a crear las **Clases** asociadas a las **Tablas de la base de datos**

Para ello cogemos en _origen de datos_ y creamos un nuevo origen a partir de la conexión, dándole un nombre cualquiera.

**FIJARSE!**

Al darle a añadir todo el mismo marca automáticamente en distintos colores según sean tablas, relaciones y esas mierdas.

Configurando las entidades, debemos resaltas que vamos a trabajar con **_Listas_**.

### Analizar el código generado

#### Países

Vamos a empezar por esta tabla que es la más sencilla.

`java @NamedQuery()`
→ crea una consulta con ese nombre

Notar que la sintaxis es algo diferente. Estas que estan creadas por defecto pueden cambiarse o crearse nuevas.
La forma de usarlas es a través del
_java name=_

Aunque hay muchas anotaciones y demás, hay que destacar las **relaciones**:

* Detecta las relaciones con el `java@OneToMany(...)`
* Crea la `java List<Clase> lista` con los objetos de la relación

Esto es muy interesante ver en Autores, que pone las anotaciones `java @ManyToOne` y el _puntero_ a `java private Paises nacionalidad`

### Terminar el proyecto

Volvemos a ir al proyecto → new → other → Persistence → JSF Pages from Entity Classes

Es decir, con esto vamos a crear automáticamente la **vista** a partir del **modelo** que hemos creado antes de forma automática.

También va a crear automáticamente los **controladores** y los **repositorios** ( a los que denomina _Facades_)
Por eso nos pide dos directorios, donde los creará.

## Día 2

Vamos a usar una plantilla de JSF. Para eso vamos a la página de _primerfaces_ y vamos al showcase ui menu tierredMenu.xhtml.

Cogemos ese coódigo y lo copiamos y lo pegamos en el index.xhtml.

Tenemos que importa la siguiente **_directiva de xml:_**
`xml xmlnsp:p="http://primefaces.org/ui`

## Día 3

Ha avanzado usando cosas de Prime Faces. Una cosa que sí que me ha servido es que ha explicado que los _getters y setters_, al estar **autogenerados**, se llaman erróneamente para algunos campos.
Ejemplo:
f_Nacimiento -> fNac -> getFNac()

He creado un proyecto (**sin** primefaces, que no sé si tiene algo que ver) y me ha funcionado el listado sin dar el error en el servidor y mostrando correctamente la lista de autores.

El va a seguir haciendo cosas: va a meter el campo **calculado** de la _edad_.

Va a calcularse la edad a partir de **hoy** -> tendrá que ser un método. Vamos a crearlo en el **controlador**.

Al final del _AutoresController_ :

```java
    public int calcularEdad(Date fechaNacimientoAutor) {
        Calendar fechaActual = Calendar.getInstance();
        Calendar fechaNacimiento = Calendar.getInstance();
        fechaNacimiento.setTime(fechaNacimientoAutor);
        int ano = fechaActual.get(Calendar.YEAR) - fechaNacimiento.get(Calendar.YEAR);
        int meses = fechaActual.get(Calendar.MONTH) - fechaNacimiento.get(Calendar.MONTH);
        int dias = fechaActual.get(Calendar.DATE) - fechaNacimiento.get(Calendar.DATE);

        if ((meses < 0) || (meses == 0 && dias < 0)) {
            ano -= 1;
        }
    }
```

Esta función entonces devuelve el número de años del autor. Ahora en la vista debemos resctar el valor del campo edad como el valor que retorna esta función respecto de la fecha de nacimiento del autor.

```html
<h:outputText value="#{autoresController.calcula_edad(item.fNac)}" />
```

Ahora va a verse si el autor está muerto para que no salga fecha.
Se va a hacer una ñapa con estilos, en la propia tag anterior.
Se va a hacer una funcion que devuelva none o "" para poder hacer que no se vea la edad.

```java
    public String estaVivo(Autor autor) {
        boolean vivo = autor.fNac == null;
        String returnValue = (vivo) ? "" : "none";
        return returnValue;
    }
```

```html
<h:outputText value="#{autoresController.calcula_edad(item.fNac)}" style="display=#{autoresController.estaVivo(item)}"/>
```

## Pre-día 4

Tras ir haciendo pruebas, he visto que el error que me daba radicaba en los métodos *get* y *set* de las fechas del autor.

He ido probando con y sin primefaces, pero la última metodología ha resultado exitosa:

* Crear el proyecto web con JSF y Primefaces
* Establecer la conexión con la base de datos y generar a partir de estas las entidades en el paquete de modelos
* Cambiar en el modelo los métodos get y set de la fecha
    * las variable son del estilo fechaAlgo
    * los métodos generados son del estilo ?etFechaAlgo()
    * los cambio a ?etfechaAlgo()
* Se generan las vistas a partir de las entidades
* Abro el index y listo los autores
* ???
* ***PROFIT!***

## Día 4

Aparte de terminar el código del día anterior, vamos a introducir unas *imágenes* en un directorio. El directorio es **resources** y al hacer cambios en un directorio **hay que volver a compilar el proyecto!!**

Vamos a meter en este directorio una carpeta llamada *resources*, que contendrá las imágenes.

Vamos a meter en este directorio una carpeta llamada *resources*, que contendrá las imágenes.

Luego se linka la imagen de forma evidente. Lo que se quiere hacer ahora es que la imagen sea un enlace:
```xml
<h:outputLink value="/Biblioteca/faces/javax.faces.resources/#{item.foto}?ln=Escritores" title="#{item.nomAutor} #{item-apellido1} #{item.apellido2}">>
	<p:graphicImage library="Escritores" name="#{item.foto}" heigth="45"/>
</h:outputLink>
```
El output link crea un a con un valor href. El value viene a ser lo que le pasa a ese href.
Ese valor tiene más chicha de lo que parece, observar que coje resources según una libreria o algo asi y hay que pasarle el directorio por get.


Ahora va a maquearse, para eso se va a *https://www.primefaces.org/showcase/ui/overlay/lightBox.xhtml*
Esto es un componente para **ventanas modales**, que vienen a ser *ventanas sobre ventanas*.

## Día 5

Vamos a crear nuestra propia Query en El modelo de paises. Copiamos el findAll y añadimos el orden, para que nos saque lo mismo que la consulta original, pero ordenado. Es decir, acabamos con una *namedQuery* llamada **findAllOrden**.

Ahora ha cambiado una cosa en el Controller, que crea otra cosa en el Facade. A mí no me va igual, así que **hay que mirar los vídeos!** .

Lo importante es que en PaisesFacade en el paises_ordenados() *que creo que es el que se ha creado solo*,
hay que meter el siguiente código:

```java
em = getEntityManager();
Query q;
q = em.createNamedQuery("Paises.findAllOrden")
return q.getResultList();
```

El ejercicio nuevo va a consistir en, en el listado de libros, añadir referencias a los autores del libro y alos premios que les han sido concedido a dichos libros.

Estas tablas N:N **no** tienen atributos propios, así que el programa lo 'resuelve' poniendo *ambas listas*, como si fueran dos relaciones 1:N indepedientes.
En este ejercicio usamos esta forma.
Por ejemplo, si nos fijamos en *Autores.java*, vemos:

```java
    @ManyToMany(mappedBy = "autoresList")
    private List<Libros> librosList;
```

Y en *Libros.java* vemos:

```java
 private List<Premios> premiosList;
    @JoinTable(name = "autor_libro", joinColumns = {
        @JoinColumn(name = "cod_libro", referencedColumnName = "cod_libro")}, inverseJoinColumns = {
        @JoinColumn(name = "cod_autor", referencedColumnName = "cod_autor")})
    @ManyToMany
    private List<Autores> autoresList;
```

Notar que tenemos ***código distinto***