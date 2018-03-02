# Retomando la toma de apuntes del JSF

## Hasta ahora

Ha terminado lo del crear el Autor, permitiendo seleccionar los campos múltiples. Está en el vídeo:

* En getSelectItemPremios: en el selectItem ponemos (x, x.getNomPremio(i)), es decir, pasamos el objeto y su nombre. El problema era cuando se le pasaba ("", ""): el primer elemento era un string y no un objeto de la clase Autores, por lo que no funcionaba.
* En la calse Converter, el *values* de la anotación debe quedar *value=**"autoresConverter"***. Eso pilla la conversión y es lo que no acepta lo de antes, que cada uno sea de una clase. Por eso le asignamos un nombre  y en el *Create.xhtml* se le llama con un <f:converter convertedId="autoresConverter" />
* Se hace lo propio con premios.
* Tenemos que aplicar esta marca ahora siempre que usemos los conversores

## Nuevo ejercicio

Primero, tenemos que analizar cómo se ha creado la estructura. Relacion **Autor:Premio**. Es una relación N:N, que genera una tabla intermedia: **AutoresPremios**. Un autor puede tener muchos premios y un premio se le puede dar a muchos autores. Así que se forman 2 relaciones **1:N** entre las entidades originales y la generada. Además, esta tiene un campo adicional de *año*.
El año **NO** está en la tabla, así que hay que añadirlo.

En el casi de Libros Premios, crea una lista de la otra entidad en cada modelo. Lo mismo en autores y en libros. Esto es el caso en las que no tienen atributos intermedios. Como la que estamos estudiando ahora **SÍ** que tiene el campo adicional en la base de datos, se han generado las dos clases de *autorPremio* y *autorPermioPK*

Podemos ver que autorPremioPK tiene 3 atributos: los dos códigos de las relaciones y el año.
Las relaciones con las otras tablas están en autorPremio, que tiene los objetos de Premio y Autor, así como el de AutorPremioPK

Ejercio:

* Desplegable de autores
* Botón
* Al hacer click sale una lista de los premios / año	

Vamos a usar el controlador de AutorPremio y vamos a crear una página web en premios: PremiosAutor.xhtml

Voy a ir copiando lo que hace:

###  Copiar autorLibros a AutorPremios.xhtml

Dice que no hay problema en que coja los datos del autoresController.selectitems[lo que sea...]
Lo que sí que hay que añadir es el <f:converter converterId="autoresConverter" />

FUNCIONA
Cambiamos la vista para que muestre el premio y el año y ya.
También tenemos que cambiar el commandButton, porque vemos que va a otro controlador.
Los datos que queremos estan en AutorPremio. Por eso en AutoresPremioController habrá que crear el objeto Autores autor. Así el selectOneMenu cargará el valor a esa variable. El value es fundamental, es lo que carga el valor.
De forma análoga, habrá que crear una lista de premios.
