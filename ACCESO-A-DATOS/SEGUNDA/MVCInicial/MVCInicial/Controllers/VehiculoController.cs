using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using MVCInicial.Models;

namespace MVCInicial.Controllers
{
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
            var Vehiculos = BD.Vehiculos.Include(x => x.Serie);
            // recordar: x == BD.Vehiculos
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
            ViewBag.IdSerie = new SelectList(BD.Series, "ID", "Nombre");
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
            ViewBag.IdSerie = new SelectList(BD.Series, "Id", "Nombre", VehiculoEditado.IdSerie);
            return View(VehiculoEditado);
        }


        [HttpPost]
        public ActionResult Edit(int id, Vehiculo VehiculoSeleccionado)
        {
            try
            {
                Vehiculo Vehiculo = BD.Vehiculos.SingleOrDefault(v => v.Id == id);
                Vehiculo.Matricula = VehiculoSeleccionado.Matricula;
                Vehiculo.IdSerie = VehiculoSeleccionado.IdSerie;
                Vehiculo.Color = VehiculoSeleccionado.Color;
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
                from vehiculos in BD.Vehiculos.Include(vehiculos => vehiculos.Serie).
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
            ViewBag.SerieID = new SelectList(BD.Series.Where(e => e.IdMarca == MarcaId), "Id", "Nombre");
            var Vehiculos = BD.Vehiculos.Include(x => x.Serie).Where(e => e.IdSerie == SerieId);
            return View(Vehiculos.ToList());
        }
    }
}
