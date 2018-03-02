using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using MVCInicial.Models;
using System.Data.SqlClient;

namespace MVCInicial.Controllers
{
    public class VehiculoTotal
    {
        public string Nom_marca { get; set; }
        public string Nom_serie { get; set; }
        public string Matricula { get; set; }
        public string Color { get; set; }
    }

    public class VehiculoController : Controller
    {
        Contexto BD = new Contexto();

        // GET: Vehiculo
        public ActionResult Index()
        {
            ViewBag.cualquiera = BD.Marcas.ToList();
            // IList<Vehiculo> Vehiculos = BD.Vehiculos.ToList();ç
            // No meterlo en un ViewBag, que da NullPointerException
            // Ojo a la forma que usa el para hacer un generico
            var Vehiculos = BD.Vehiculos.Include(x => x.Serie).Include(x => x.ExtrasDelVehiculo);
            // recordar: x == BD.Vehiculos
            // ViewBag.Extras = BD.VehiculosExtras.Include(x => x.Extra).ToList();
            // La linea anterior es del dia de sacar los extras del vehiculo. Se arregla con el segundo include, por lo que esto ya no hace falta
            ViewBag.asafaf = BD.Extras.ToList();
            return View(Vehiculos.ToList());
        }

        // GET: Vehiculo/Details/5
        public ActionResult Details(int id)
        {
            // Vehiculo Rescatado = BD.Vehiculos.Find(id); // El find no rula con los includes
            Vehiculo Rescatado = BD.Vehiculos.Include(v => v.Serie).FirstOrDefault(v => v.Id == id);
            ViewBag.cualquiera = BD.Marcas.ToList();
            return View(Rescatado);
        }

        // GET: Vehiculo/Create
        public ActionResult Create()
        {
            ViewBag.IdSerie = new SelectList(BD.Series, "Id", "Nombre");
            ViewBag.ExtraList = new MultiSelectList(BD.Extras, "Id", "TipoExtra");
            return View();
        }

        // POST: Vehiculo/Create
        [HttpPost]
        public ActionResult Create(Vehiculo Vehiculo)
        {
            try
            {
                BD.Vehiculos.Add(Vehiculo);
                BD.SaveChanges();
                // Hay que hacer tantos ADDs como EXTRAS HAYAMOS METIDO
                foreach(var extraID in Vehiculo.ExtrasSeleccionados)
                {
                    /*
                     * // git gudff
                    VehiculosExtras Relacion = new VehiculosExtras();
                    Relacion.IdExtra = extraID;
                    Relacion.IdVehiculo = Vehiculo.Id;
                    */
                    // Forma guay
                    VehiculosExtras Relacion = new VehiculosExtras() { VehiculoID = Vehiculo.Id, ExtraID = extraID };
                    BD.VehiculosExtras.Add(Relacion);
                    BD.SaveChanges();
                }
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Vehiculo/Edit/5
        public ActionResult Edit(int id)
        {
            /*
            var VehiculoEditado = (
                from vehiculos in BD.Vehiculos.Include(vehiculos => vehiculos.Serie)
                where vehiculos.Id == id
                select vehiculos).FirstOrDefault();
            // Vehiculo VehiculoEditado = Vehiculos[0]; // ACORDARSE DEL PUTO MÉTODO
            */

            // Agustín ha enseñado esta manera

            Vehiculo VehiculoEditado = BD.Vehiculos.Find(id);
            // NO FUNCIONA EL EXPERIMENTO DE AGUSTIN
            // Vehiculo VehiculoEditado = BD.Vehiculos.Include(x => x.ExtrasSeleccionados).Single(x => x.Id == id);
            ViewBag.IdSerie = new SelectList(BD.Series, "Id", "Nombre", VehiculoEditado.SerieID);
            // Este es el de antes. COmo cuarto parámetro le podemos pasar los seleccionados
            // ViewBag.ExtraList = new MultiSelectList(BD.Extras, "Id", "TipoExtra");
            /*
            var IDsExtras = (
                from vehiculos in BD.VehiculosExtras
                where vehiculos.IdVehiculo == id
                select vehiculos.IdExtra
                ).ToList();
            */
            // Agus (Esto si funciona)
            VehiculoEditado.ExtrasSeleccionados = BD.VehiculosExtras.Where(m => m.VehiculoID == VehiculoEditado.Id).Select(m => m.ExtraID).ToList();
            ViewBag.ExtraList = new MultiSelectList(BD.Extras, "Id", "TipoExtra", VehiculoEditado.ExtrasSeleccionados);
            return View(VehiculoEditado);
        }


        [HttpPost]
        public ActionResult Edit(int id, Vehiculo VehiculoSeleccionado)
        {
            try
            {
                Vehiculo Vehiculo = BD.Vehiculos.SingleOrDefault(v => v.Id == id);
                Vehiculo.Matricula = VehiculoSeleccionado.Matricula;
                Vehiculo.SerieID = VehiculoSeleccionado.SerieID;
                Vehiculo.Color = VehiculoSeleccionado.Color;
                var Extras = BD.VehiculosExtras;
                ViewBag.ExtraList = Extras;
                BD.SaveChanges();
                // El conjunto de todos los **VehiculosExtras** con la id del vehiculo igual al seleccionado
                var extrasActuales = BD.VehiculosExtras.Where(m => m.VehiculoID == VehiculoSeleccionado.Id);
                foreach (VehiculosExtras extra in extrasActuales)
                {
                    BD.VehiculosExtras.Remove(extra);
                }
                foreach (int extra in VehiculoSeleccionado.ExtrasSeleccionados)
                {
                    /*
                        // esto lo coge
                    VehiculosExtras v = new VehiculosExtras();
                    v.Id = Vehiculo.Id;
                    v.IdExtra = extra;
                    BD.VehiculosExtras.Add(v);
                    */

                    BD.VehiculosExtras.Add(new VehiculosExtras() { VehiculoID = Vehiculo.Id, ExtraID = extra});
                }

                BD.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Vehiculo/Delete/5
        public ActionResult Delete(int id)
        {
            Vehiculo v = BD.Vehiculos.Find(id);
            return View(v);
        }

        // POST: Vehiculo/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
                Vehiculo Borrar = BD.Vehiculos.Find(id);
                BD.Vehiculos.Remove(Borrar);
                BD.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // Va a devolver un listado de vehículos
        // Mirar la sintxis de esto: es como Python: si no se le pasa un parametro, toma el por defecto
        public ActionResult Busqueda(String busca="")
        {
            var Vehiculos = (
                from vehiculos in BD.Vehiculos.Include(vehiculos => vehiculos.Serie)
                where vehiculos.Matricula.Contains(busca)
                select vehiculos
                ).ToList();
            return View(Vehiculos);
        }

        public ActionResult BusquedaDropDown(String Desplegable="0")
        {
            SelectList ListaVehiculos = new SelectList(BD.Vehiculos, "Id", "Matricula");
            ViewBag.Desplegable = ListaVehiculos;
            int SelectId = int.Parse(Desplegable);
            var Vehiculos = (
                from vehiculos in BD.Vehiculos.Include(vehiculos => vehiculos.Serie)
                where vehiculos.Id == SelectId 
                select vehiculos
                ).ToList();
            return View(Vehiculos);
        }

        /*
        public ActionResult FiltradoCompleto(int DespegableMarcas = 0, int DespegableSeries = 0)
        {
            // Lo que le paso realmente es la id, pero la llamo así porque me es más cómodo porque o ha cogido por defecto
            SelectList ListaTodasMarcas = new SelectList(BD.Marcas, "Id", "Nombre");
            var Datos = (
                from Series in BD.Series
                where Series.IdMarca == DespegableMarcas
                select Series
                ).ToList();
            SelectList ListaSeriesFiltradas = new SelectList(Datos, "Id", "Nombre");
            ViewBag.DesplegableSeries = ListaSeriesFiltradas;
            ViewBag.DespegableMarcas = ListaTodasMarcas;
            var Coches = (
                from Vehiculo in BD.Vehiculos
                where Vehiculo.IdSerie == DespegableSeries
                select Vehiculo
                ).ToList();
            SelectList CochesLIST = new SelectList(Coches, "Id", "Matricula" + "  Color");
            ViewBag.SusVehiculos = CochesLIST;
            return View();
        }
        */

        // El de agustin
        public ActionResult Listado(int MarcaId = 1, int SerieId = 0)
        {
            ViewBag.MarcaID = new SelectList(BD.Marcas, "Id", "Nombre");
            ViewBag.SerieID = new SelectList(BD.Series.Where(e => e.MarcaID == MarcaId), "Id", "Nombre");
            var Vehiculos = BD.Vehiculos.Include(x => x.Serie).Where(e => e.SerieID == SerieId);
            return View(Vehiculos.ToList());
        }

        public ActionResult listarPorColor(String color="")
        {
            // Ojito a la modificación que hay que cascarle: el string con la indicacion de que va  coger un parametro
            // y una dupla nombre / valor
            var Lista = BD.Database.SqlQuery<VehiculoTotal>("getVehiculosPorColor @ColorSel", new SqlParameter("@ColorSel", color)).ToList();
            var Colores = BD.Vehiculos.Select(l => l.Color).Distinct().ToList();
            // ViewBag.color = Colores; // Se debe llamar con el nombre del parámetro
            // A diferencia de lo que se dijo el otro dia, vamos a crear un selectlist con el viewbag para cargarlo directamente en la vista
            ViewBag.color = new SelectList(Colores);
            return View(Lista);
        }
    }
}
