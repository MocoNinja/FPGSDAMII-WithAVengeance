# Apuntes MVC

Vamos a usar el entity framework.

Vamos a hacer un ejercicio de concesionario, con la tabla marcas inicialmente (iremos ampliando)

Archivo -> Nuevo -> Proyecto -> Web -> Aplicación ASP.NET

Al crear el proyecto siempre hemos elegido Webforms. Ahora vamos a seleccionar MVC, lo que creará directorios para cada capa.

Destacar: dentro de vistas se crea el directorio Home, que representa la página inicial -> concluir que las paginas se organizan en directorios

En el 2015 trae el entity framework por defecto; si no, hay que sacar la consola de nu get y hacer el install package entityloquesea

* Crear la base de datos concesionario -> en el sql manager

* Crear las clases y demás

## Día 1

Vamos a crear la clase que representará a los modelos. Esto es un MODELO, así que tenemos que crearlo en ese directorio

Luego hay que crear lo que considerábamos la base (context) y tabla (dbset)

### CONTROLADOR

Recordar que es la programación de su(s) vista(s) asociada
Al crear un controlador, salen opciones. Cogemos la primera opcion porque ni esta vacia, pero tampoco mete mucho -> ideal para aprender
El nombre acabará con controller.
En el formulario se va a crear un objeto de la clase Marca, asi que a este método le cambiamos para que tome ese objeto
IDEA CLAVE:  el formulario coge los datos y envia un OBJETO DE LA CLASE MARCA

Desde el controlador, podemos hacer click derecho para agregar una vista
Hay plantillas para acciones comunes (insertar, borrar, etc...)
En este caso cogemos create.

Así crea la página y mete muchas mierdas raras

La extensión es cshtml -> es como un jsp : son archivos html que cogen codigo (C# en este caso). Se meten instrucciones con el ```@``` (el equivalente a ```<%``` de jstl).

**Es decir, ```@ {}``` es código C#**

La primera linea no la analizamos ahora, pero es fundamental, asi que ojito

```ViewBag```: contenedor de variables para pasarlo entre páginas

```@using (Html.BeginForm())``` -> helpers para agregar marcas html desde C# (eso es el @HTML -> va a generar el codigo)

el BeginForm() va a generar el formulario que queremos

el using además de para importar se usa para definir zonas

```cs
@using .. bd {
    //en esta zona se va a definir esta zona que usar la variable bd
}
```

con esto si se ejecuta se ve la pagina, que no hara nada. Por eso hay que programar en el controlador para que se envie el contenido de formulario por post a este -> es el Create del controlador

Para ello cambiamos el helpder del formulario a Html.BeginForm("Create", "Marca", FormMethod.Post)
(Método, nombre del controlador *sin* el Controller, forma de mandarlo)

Vamos a crear que se puedan meter los datos de a base datos

* a mano
* de la base de datos con un DropDownList
* de la base de datos en un una lista

### Pasos

1. Crear el controlador y un método. Se le puede dar el mismo nombre que a la página.

En este caso, ```public ActionResult Desplegable()```

1. Asociado a ese controlador, vamos a crear una **vista**, que puede hacerse con click dcho.

## Día 2

Vamos a incluir a la aplicación los modelos y series.

Tenemos nuestra tabla de *marcas* del día anterior, así que tendremos que hacer un *desplegable* que nos permita seleccionarlas en la nueva página de **series**. Nos tendrá que permitir meter el nombre del *modelo*.

Este modelo va a ser denominado **serie**.

### RECORDATORIOS

* **Cada vez que hagamos uno de estos cambios grande en la estructura de la base de datos y de las clases hay que borrar la base de datos**

* **Para crear las vistas hay que clickar en el metodo adecuado del controlador**

* Para la serie lo hacemos en create. usamos la plantilla e create

* **El punto de entrada al controlador es el ActionResult Create()**

Modificación que ha hecho en el modelo para que permita introudcir una idmarca nula

int --> int?

## Día 3

Hasta ahora tenemos las tablas serie y marca.

Vamos a hacer una clase de vehículo con los campos

* Id
* Matrícula
* Color

Con las relaciones

* En una serie hay muchos vehículos, pero un vehículo es de una serie --> necesitamos un puntero a Serie
* IdSerie (el campo necesario para el puntero anterior)

**No hay que olvidar metes esta tabla en el contexto !!**

**Después de este paso *HAY* que compilar**


Ahora vamos a hacer 2 páginas web

* Un listado de todos los vehículos (en el *index*) -> ya hay un modelo de list que lo hará automático
    - En la lista hay un enlace al *create* (recibe los parámetros por **GET**)
    - Tendrá relacionado un formulario de *inserción* por **POST**, que tendrá la lógica de *inserción*
    - Se redirige al *index*

* Esto implica que hagamos el **controlador**
* Hagamos una vista **CREATE** asociada al *create de la vista* por **GET**

### Nota: se supone que debe crear automáticamente un *dropdownlist*, pero a veces parece que no nos crea eso, sino simplemente inputs de texto y número

**Hay que hacerlo a mano!**

En la ***relación con la serie***, nos mete:
```cs
@Html.EditorFor(model => model.IdSerie, new { htmlAttributes = new { @class = "form-control" } })
```

Lo que queremos es un ***desplegable***:
```cs
@Html.DropDownList("IdSerie", null, htmlAttributes = new { @class = "form-control" })
```

Dará un
```css
NULL POINTER Exception
```

Porque requiere el iterable y hay que meterle en el *ViewBag* lo campos del objeto.

*Hasta aquí el primer commit*

**Ahora la lógica de inserción**

La página que hemos creado está en un *formulario*, que hay que redirigir al *create* del controlador por **POST**

1. ***NO** OLVIDAR cambiar el BeginForm del html a*
```cs
@using (Html.BeginForm("Create", "Vehiculo", FormMethod.Post)) 
```

1. ***NO** OLVIDAR cambiar el FormCollection que pilla de argumento el método a:*

```cs
// POST: Vehiculo/Create
        [HttpPost]
        public ActionResult Create(Vehiculo Vehiculo)
        {
            try
            {
                BD.Vehiculos.Add(Vehiculo);
                BD.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
```

Pudiéndose observar la correspndiente *lógica de inserción*.

No olvidar tampoco creear el ***Index***.
En estás páginas se *suele* sacar un **listado de todo**.
Agregamos la vista en el primer método del controlador, con la plantilla de lista.

Hay que relacionar el Vehiculo y la Serie. Hemos pasado un objeto de la tabla de vehículos, pero también necesitamos la tabla de series para poder saber el nombre de la Serie.

He creado un nuevo commit para ver la diferencia, que es el código del .Include

Esto requiere:

* Importar el ```using System.Data.Entity;```
* Cambiar ```var ...``` a ```var Vehiculos = BD.Vehiculos.Include(x => x.Serie);```
    * Esto es incluir su serie

## Día 4

    **Completar un par de cosas con el vídeo**

Ahora vamos a hacer dos ejercicios. En uno con un *input* vamos a introducir una matrícula, y un *botón* nos permitirá buscar.
Luego lo haremos con un desplegable.

Vamos a trabajar sobre **Vehículos**, así que lo haremos sobre su controlador **ya existente**.

Crearemos un método (y su vista) que se llame *búsqueda*. En concreto, en /Vehiculo/Index


Nota que al hacer el edit, me sale la id como number y **tengo que cambiarlo a dropdownlist**

He trabajado todo y el código ya funciona, a pesar de unos problemillas con las IdSeries que se lía en algunas páginas.
Repetir, revisando esos aspectos.

## Día 5

Vamos a mirar los métodos del formulario de vehículos.

Miremos el código que hay en el controlador:

```cs
@Html.ActionLink("Details", "Details", new { id=item.Id }) |
```

estos parámetros son el texto que va a aparecer, la página/el método destino y lo qe se le va a pasar (que **coincidir** con lo que recibe el método, obiusli).

El método que está relacionado está en el *VehiculoController*, concretamente:

```cs
        // GET: Vehiculo/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }
```

Es decir, habrá que recoger el vehículo con esa ID y devolvérselo a la página.

El ha hecho una cosa rara para ver el nombre de la marca, ***que a mí no me rula*** -> **investigar**!

Ahora a borrar:
Por get irá a una página de *confirmación*, que con un formulario, *borrará* realmente por POST.

### Hasta aquí el ejercicio ####

Ahora vamos a hacer cosas modificadas

En el listado de marcas, van a ser enlaces. AL hacer click, se va a ir a otra página, que mostrará el nombre de la marca y sus series..

Vamos am odificar el modelo de marca para incluir la relación con las series.

Creamos un método en el controlador para hacer el listado y lo mostramos, tal cual.

Ahora en la vista vamos a crear *Enlaces*s
Para eso vamos a cambiar el ```@Html.DisplayFor(modelItem => item.Nombre)``` por ```@Html.ActionLink(item.Nombre,....)``` para que salga el nombre de la marca.
El segundo parámetro que hay que pasarle es, como he dicho antes, la página web (nombre del método del controlador a llamar), que va a ser *List*. Otro parámetro nuevo es la ruta del controlador que vamos a necesitar, que va aser *Serie* Finalmente el parámetro que le vamos a pasar es
 ```new {id=item.Id}```

Es decir, la funcion que crearemos en **SerieCotroller** llamada **List** recibirá un **int id** que será la id de la marca seleccionada, de la que se listarán sus modelos.

Finalmente hay que pasara **null**, o leera un parametro erroeno como puede verse en la preview del link.

Nota: en vez de id = ...  me ha cogido MarcaId=...

## Día 6

Terminar lo de ayer: vamos a hacer el list en e SerieController. Este List se va a corresponder con la llamada del ActionLink.

Lo más significativo a tener en cuenta hoy es que al crear la vista, se ha importado el modelo como *IEnumarable* y queremos un **solo** elemento, no una lista, así que ***hay que asegurarse de cambiarlo a mano***

## Día 7

Avance que no hay hecho ni vídeo:

* Listado de series y que salgan sus vehículos

## HA DICHO QUE NO VA A PEDIR BORRAR Y EDITAR PORQUE LO SABREMOS PONER PARA QUE SE HAGA SOLITA ##

---

Ahora vamos a tener un desplegable de marcas. Según lo que seleccionemos, habrá un desplegable con sus series.

Estos dos dropdownlist estarán en un formulario, que pasará los datos por get a un método del controlador de vehículos. Este método, que recibirá ambos elementos, cargará en dos viewbags estos datos de marca y serie (condicionado por la marca)
De ahí se crea el listado de vehículos y se pasa a la vista.
Las actualizaciones serán con el método onChange.

## Día 8

Completamos con Agustin lo de ayer.

---

Ahora vamos a empezar a ttabajar con **procedimientos**

Ejemplo, de un coche se quiere sacar el nombre de la serie, de la marca, la matrícula y el color.
Esto ya estaba hecho con viewbags, includes y mierdas. Pero es mejor hacer una consulta con joins directamente y pista.

Vamos a almacenar un procedimiento en la base de datos, en el SQL Server Management Studio

Se va a guardar en programacion -> procedimientos almacenados

```sql
CREATE PROCEDURE getSeriesVehiculos
AS
BEGIN
    SELECT MarcaModeloes.Nom_marca, SerieModeloes.Nom_Serie, VehiculoModeloes.Color, VehivuloModeloes.Matricula
    FROM VehiculoModeloes
    JOIN SerieModeloes
    ON VehiculoModeloes.SerieID = SerieModeloes.ID
    JOIN MarcaModeloes
    ON SerieModeloes.MarcaID = MarcaModeloes.ID
END
```

Se selecciona, ejecuta  y entonces aparece en los procedimientos almacenados.

Entonces hacemos **otro listado en el controlado de vehiculos**

Pongo el codigo que habria que poner:

Notar que el nuevo modo de obtener los resultados de la base de datos va a generar una estructura *que no tenemos*. Hay que crear una **clase**, que puede ser global como los modelos o **local en el mismo archivo, que es lo que vamos a hacer**.

```cs
public class VehiculoTotal
{
    public string Nom_marca {get; set;}
    public string Nom_serie {get; set;}
    public string Matricula {get; set;}
    public string Color {get; set;}
}

public ActionResult Listado2()
{
    var lista = BD.Database.SqlQuery<VehiculoTotal>("getSeriesVehiculos");
    return View(lista);
}
```

Tenemos que crear una vista plantilla. Como hemos hecho que vehiculototal no este en models, no puede hacer klas cosas solo, asi que vamos a meterle un vehiculo para poder copiar y pegar el máximo posible, pero **hay que modificarlo**.

## Dia 9

Vamos a crear un procedimiento algo más complejo: Seleccionar los vehículos de un color.

* Como no tenemos los colores en la base de datos aparte, al seleccionarlos de la tabla de coches saldrán los repes --> hay que filtrar con un *distinct*

El procedimiento a realizar será similar al de ayer, pero deberá tomar un parámetro.
Fijarse como los parámetros que se le pasan a los procedimientos van *en las primeras líneas* y *precedidos por **@***

```sql
CREATE PROCEDURE getVehiculosPorColor
@ColorSeleccionado nvarchar(30)
AS
BEGIN
    SELECT MarcaModeloes.Nom_marca, SerieModeloes.Nom_Serie, VehiculoModeloes.Color, VehivuloModeloes.Matricula
    FROM VehiculoModeloes
    JOIN SerieModeloes
    ON VehiculoModeloes.SerieID = SerieModeloes.ID
    JOIN MarcaModeloes
    ON SerieModeloes.MarcaID = MarcaModeloes.ID
    WHERE VehiculoModeloes.Color = @ColorSeleccionado
END
```

Hecho esto, creamos otro metodo de listar en el controlador como el de ayer(que no hice, asi que ojito con los videos).

CAOS

## Día 10

Terminamos el ejercicio de seleccionar color

Funciona, pero ojo que me falta algo del ultimo dia para que salga bien.

---
Cosa nueva que vamos a haacer pero qye luego quitaremos porque si no no va nada

---

### Migraciones

Parece que es el proceso en el que apartir del modelo se crea la base de datos. Vamos a ver el ejemplo mediante *shell**.

Vamos a aprovechar para la tabla N:N:

* Vehiculos: puede tener muchos extras.
* Extras: pueden estar presenten en varios vehiculos.

Las tablas a crear son la de Extras *(id, nombre)* y la intermedia *(con las id y la suya propia)*.

Herramientas -> administrador nu get -> consola administrador paquetes.

```sql
Enable-Migrations -ContextTypeName MVCInicial.Models.Contexto (o el que salga en el mensaje de error)
Add-Migration Crear_Tablas
Update-Database
```

Ver el .cs creado. Resaltar que el *identity* es el **autoincrementativo**. El Index() es un orden que permite acelerar todo

Creamos los modelos como siempre y copiamos algo de la migración para adaptarlo a lo nuevo (aunque **no** vamos a usar esto, así que tampoco le doy mucha importancia a este paso. La forma con la que vamos a trabajar de verdad es con la que hemos ido viendo).

## Día 11

Nos **cargamos la puta migración** de ayer. Para eso borramos directamente la carpeta de *Migration* esta que apareció en el navegador del proyecto, borramos la base de datos y pista.

La clase de Vehículo la vamos a modificar para incluir las relaciones.

Ahora ha explicado algo importante sobre las relaciones. En la clase de vehiculos, primero ha puesto la lista de *enteros*, es decir la lista que relaciona los vehiculos con los extras. Pero ahora ha dejado claro que para la programacion, es importante especificar lo que significan esos enteros, ya que una lista de enteros no puede relacionarse a priori con una clase en especifico porque es muy general.

También destacar que la relación del vehículo es **con la tabla intermedia**, que es la que realmente está linkada (ya que tenemos que pensar en una relacion N:N como dos relaciones 1:N entre las entidades originales y una tabla intermedia generdada)
**ES DECIR: LA LISTA DE ENTEROS LO USAMOS PARA LA PROGRAMACION, PARA CUANDO USEROS UNA LISTABOX; LA LISTA DE ENTIDADES ES PARA HACER LA RELACION**
Además, nos hacemos un script para meter datos auto:

````sql
INSERT INTO [MVCInicial.Models.Contexto].dbo.Marcas VALUES ('Opel');
INSERT INTO [MVCInicial.Models.Contexto].dbo.Marcas VALUES ('Renól');
INSERT INTO [MVCInicial.Models.Contexto].dbo.Marcas VALUES ('Ford');

INSERT INTO [MVCInicial.Models.Contexto].dbo.Series VALUES ('Corsa', 1);
INSERT INTO [MVCInicial.Models.Contexto].dbo.Series VALUES ('Vectra', 1);
INSERT INTO [MVCInicial.Models.Contexto].dbo.Series VALUES ('Astra', 1);
INSERT INTO [MVCInicial.Models.Contexto].dbo.Series VALUES ('Tigra', 1);

INSERT INTO [MVCInicial.Models.Contexto].dbo.Series VALUES ('Clio', 2);
INSERT INTO [MVCInicial.Models.Contexto].dbo.Series VALUES ('Megane', 2);

INSERT INTO [MVCInicial.Models.Contexto].dbo.Series VALUES ('Focus', 3);
INSERT INTO [MVCInicial.Models.Contexto].dbo.Series VALUES ('Fiesta', 3);

INSERT INTO [MVCInicial.Models.Contexto].dbo.Vehiculoes VALUES ('1111AA', 'Negro', 1);
INSERT INTO [MVCInicial.Models.Contexto].dbo.Vehiculoes VALUES ('1543VC', 'Verde', 2);
INSERT INTO [MVCInicial.Models.Contexto].dbo.Vehiculoes VALUES ('6742GD', 'Azul', 1);
INSERT INTO [MVCInicial.Models.Contexto].dbo.Vehiculoes VALUES ('2345DF', 'Negro', 3);
INSERT INTO [MVCInicial.Models.Contexto].dbo.Vehiculoes VALUES ('2754DE', 'Negro', 1);
INSERT INTO [MVCInicial.Models.Contexto].dbo.Vehiculoes VALUES ('8796KL', 'Rojo', 1);
INSERT INTO [MVCInicial.Models.Contexto].dbo.Vehiculoes VALUES ('1296CV', 'Amarillo', 4);
INSERT INTO [MVCInicial.Models.Contexto].dbo.Vehiculoes VALUES ('2375HB', 'Negro', 4);
INSERT INTO [MVCInicial.Models.Contexto].dbo.Vehiculoes VALUES ('2378PO', 'Verde', 1);

INSERT INTO [MVCInicial.Models.Contexto].dbo.Vehiculoes VALUES ('7234GH', 'Negro', 5);
INSERT INTO [MVCInicial.Models.Contexto].dbo.Vehiculoes VALUES ('8623HC', 'Rojo', 5);
INSERT INTO [MVCInicial.Models.Contexto].dbo.Vehiculoes VALUES ('2368NC', 'Negro', 6);
INSERT INTO [MVCInicial.Models.Contexto].dbo.Vehiculoes VALUES ('2345UY', 'Verde', 5);

INSERT INTO [MVCInicial.Models.Contexto].dbo.Vehiculoes VALUES ('5473JG', 'Negro', 7);
INSERT INTO [MVCInicial.Models.Contexto].dbo.Vehiculoes VALUES ('2352VB', 'Amarillo', 7);
INSERT INTO [MVCInicial.Models.Contexto].dbo.Vehiculoes VALUES ('2374KL', 'Negro', 7);
INSERT INTO [MVCInicial.Models.Contexto].dbo.Vehiculoes VALUES ('2346PO', 'Naranja', 8);

INSERT INTO [MVCInicial.Models.Contexto].dbo.Extras VALUES ('Tracción Trasera');
INSERT INTO [MVCInicial.Models.Contexto].dbo.Extras VALUES ('Techo de cristal');
INSERT INTO [MVCInicial.Models.Contexto].dbo.Extras VALUES ('Navegador');
INSERT INTO [MVCInicial.Models.Contexto].dbo.Extras VALUES ('Asientos deportivos');
INSERT INTO [MVCInicial.Models.Contexto].dbo.Extras VALUES ('Cambio automático');
INSERT INTO [MVCInicial.Models.Contexto].dbo.Extras VALUES ('Calentador de nalgas');
```

** OJO QUE HE TENIDO QUE DUPLICAR LAS CLAVES**

Ahora, en el **método create** del *controlador de vehículos*, vamos a incluir esto nuevo
El get, sin mas.
El post, al tener un vehiculo, tene,os las listas de extras.
La lista de enteros está cargada y la de objetos está vacía.
En el listform interesa la propiedad value que carga los numeros. Eso se relaciona con ExtrasSeleccioandos: lo que selecciono, lo guardo en la lista de enteros.

Ejercicio planteado: que al editar el vehículo, salga la lista con los elementos que tiene seleccionados, y que puedan cambiarse.