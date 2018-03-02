using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MiConcesionario.Models;

namespace MiConcesionario.Controllers
{
    public class MarcaController : Controller
    {
        Contexto BD = new Contexto();
        // GET: Marca
        public ActionResult Index()
        {
            return View(BD.Marcas);
        }

        // GET: Marca/Details/5
        public ActionResult Details(int id)
        {
            return View(BD.Marcas.Find(id));
        }

        // GET: Marca/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Marca/Create
        [HttpPost]
        public ActionResult Create(Marca Marca)
        {
            try
            {
                BD.Marcas.Add(Marca);
                BD.SaveChanges();
                return RedirectToAction("Create");
            }
            catch
            {
                return View();
            }
        }

        // GET: Marca/Edit/5
        public ActionResult Edit(int id)
        {
            return View(BD.Marcas.Find(id));
        }

        // POST: Marca/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, Marca Marca)
        {
            try
            {
                Marca MarcaVieja = BD.Marcas.Find(id);
                MarcaVieja.Nombre = Marca.Nombre;
                BD.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Marca/Delete/5
        public ActionResult Delete(int id)
        {
            return View(BD.Marcas.Find(id));
        }

        // POST: Marca/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                Marca Borrar = BD.Marcas.Find(id);
                BD.Marcas.Remove(Borrar);
                BD.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // Cargando los parámetros a mano
        public ActionResult DesplegableManual1()
        {
            return View();
        }

        // Cargando los datos en un ViewBag a partir de la base de datos
        public ActionResult DesplegableManual2()
        {
            List<Marca> Marcas = BD.Marcas.ToList();
            ViewBag.Marcas = new SelectList(Marcas, "ID", "Nombre");
            return View();
        }
         
        // El MISMO que el anterior, pero ilustrando en la vista otro constructor
        // Que vale para cualquier Ejemplo
        public ActionResult DesplegableManual3()
        {
            ViewBag.Marcas = new SelectList(BD.Marcas, "ID", "Nombre");
            return View();
        }

        // Con C#, cargando una Lista en vez de un objeto HTML
        public ActionResult DesplegableManual4()
        {
            List<Marca> Marcas = BD.Marcas.ToList();
            ViewBag.Marcas = Marcas;
            return View();
        }

        public ActionResult MarcasSeriesLink()
        {
            return View(BD.Marcas.ToList());
        }
    }
}
