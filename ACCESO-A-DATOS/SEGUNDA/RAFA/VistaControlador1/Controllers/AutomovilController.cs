using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VistaControlador1.Models;
using System.Data.Entity;
using System.Data.SqlClient;
namespace VistaControlador1.Controllers
{
    public class AutomovilController : Controller
    {
        ContextModel db = new ContextModel();

        public class AutomovilTotal
        {
            public string Nom_marca { get; set; }
            public string Nom_serie { get; set; }
            public string Matricula { get; set; }
            public string Color { get; set; }
        }



        // GET: Automovil
        public ActionResult Index()
        {
            ViewBag.cualquiera = db.Marcas.ToList();
            ViewBag.autoExtra = db.AutomovilesExtra.Include(x => x.Extra).ToList();
            var vehiculos = db.Automoviles.Include(x => x.Serie).Include(y => y.AutoExtras);
            return View(vehiculos.ToList());
        }

        // GET: Automovil/Details/5
        public ActionResult Details(int id)
        {
            ViewBag.cualquiera = db.Marcas.ToList();
            var autoDetails = db.Automoviles.Include(x => x.Serie).SingleOrDefault(x => x.ID == id);

            return View(autoDetails);
        }

        // GET: Automovil/Create
        public ActionResult Create()
        {

            ViewBag.SerieID = new SelectList(db.SerieM, "ID", "Nom_Serie");
            ViewBag.ExtraList = new MultiSelectList(db.Extra, "ID", "TipoExtra");
            return View();
        }

        // POST: Automovil/Create
        [HttpPost]
        public ActionResult Create(Automovil auto)
        {
            try
            {
                using (var db = new ContextModel())
                {

                    db.Automoviles.Add(auto);
                    db.SaveChanges();
                }

                foreach (var extraID in auto.ExtrasSeleccionados)
                {
                    var obj = new AutomovilesExtrasModelo() { automovilID = auto.ID, ExtraID = extraID };
                    db.AutomovilesExtra.Add(obj);
                }
                db.SaveChanges();


                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Automovil/Edit/5
        public ActionResult Edit(int id)
        {
            var autoMod = db.Automoviles.Find(id);
            ViewBag.SerieID = new SelectList(db.SerieM, "ID", "Nom_Serie", id);
            autoMod.ExtrasSeleccionados = db.AutomovilesExtra.Where(m => m.automovilID == autoMod.ID).Select(m => m.ExtraID).ToList();
            ViewBag.ExtraList = new MultiSelectList(db.Extra, "ID", "TipoExtra", autoMod.ExtrasSeleccionados);

            return View(autoMod);
        }

        // POST: Automovil/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, Automovil auto)
        {
            try
            {
                Automovil autoActualizar = db.Automoviles.SingleOrDefault(x => x.ID == id);
                autoActualizar.Matricula = auto.Matricula;
                autoActualizar.Color = auto.Color;
                autoActualizar.SerieID = auto.SerieID;
                db.SaveChanges();
                // Seleccionamos los extras del vehiculo de la tabla y despues los borramos
                var extrasActuales = db.AutomovilesExtra.Where(m => m.automovilID == auto.ID);
                foreach (var extraAEliminar in extrasActuales)
                {
                    db.AutomovilesExtra.Remove(extraAEliminar);
                }
                //Vector de enteros con los extras
                foreach (var extraAnadir in auto.ExtrasSeleccionados)
                {
                    var vehiculoExtraModeloAAñadir = new AutomovilesExtrasModelo() { automovilID = auto.ID, ExtraID = extraAnadir };
                    db.AutomovilesExtra.Add(vehiculoExtraModeloAAñadir);
                }

                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Automovil/Delete/5
        public ActionResult Delete(int id)
        {
            ViewBag.cualquiera = db.Marcas.ToList();
            var autoDetails = db.Automoviles.Include(x => x.Serie).SingleOrDefault(x => x.ID == id);
            return View(autoDetails);
        }

        // POST: Automovil/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                Automovil autoDetails = db.Automoviles.Find(id);
                db.Automoviles.Remove(autoDetails);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        // A busca si no le apsas ningun parametro busca=""
        public ActionResult Buscar(String busca = "")
        {
            //objeto no definido y devuelve objeto db
            var lista = (from p in db.Automoviles.Include(x => x.Serie) where p.Matricula.Contains(busca) select p).ToList();
            return View(lista);
        }

        public ActionResult BuscarDos(String matricula)
        {
            ViewBag.Matricula = new SelectList(db.Automoviles, "Matricula", "Matricula");
            var lista = (from p in db.Automoviles.Include(x => x.Serie) where p.Matricula == matricula select p).ToList();

            return View(lista);
        }


        public ActionResult List(int serieID)
        {
            SerieModelo serie = db.SerieM.Include("Automoviles").FirstOrDefault(x => x.ID == serieID);
            return View(serie);
        }

        public ActionResult ListadoCondicionado(int marcaID = 1, int serieID = 1)
        {
            ViewBag.marcaID = new SelectList(db.Marcas, "ID", "Nom_Marca");
            ViewBag.serieID = new SelectList(db.SerieM.Where(x => x.MarcaID == marcaID), "ID", "Nom_serie");
            var vehiculos = db.Automoviles.Include(x => x.Serie).Where(p => p.SerieID == serieID);
            return View(vehiculos.ToList());
        }

        public ActionResult Listado2()
        {

            var lista = db.Database.SqlQuery<AutomovilTotal>("getSeriesVehiculos").ToList();
            return View(lista);
        }
        //Para evitar valores null al arrancar la pagina se le asigna el valor por defecto
        public ActionResult listadoPorColor(string colores = "")
        {
            ViewBag.colores = new SelectList(db.Automoviles.Select(x => new { Color = x.Color }).Distinct(), "Color", "Color");
            var lista = db.Database.SqlQuery<AutomovilTotal>("getVehiculosPorColor @ColorSel", new SqlParameter("@ColorSel", colores)).ToList();
            return View(lista);
        }
    }
}
