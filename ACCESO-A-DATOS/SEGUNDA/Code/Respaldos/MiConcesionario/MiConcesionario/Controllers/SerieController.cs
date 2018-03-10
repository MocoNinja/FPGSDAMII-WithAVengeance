using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MiConcesionario.Models;

namespace MiConcesionario.Controllers
{
    public class SerieController : Controller
    {
        Contexto BD = new Contexto();
        // GET: Serie
        public ActionResult Index()
        {
            ViewBag.Marcas = BD.Marcas.ToList();
            return View(BD.Series.ToList());
        }

        // GET: Serie/Details/5
        public ActionResult Details(int id)
        {
            ViewBag.Marcas = BD.Marcas.ToList();
            return View(BD.Series.Find(id));
        }

        // GET: Serie/Create
        public ActionResult Create()
        {
            ViewBag.MarcaID = new SelectList(BD.Marcas, "ID", "Nombre");
            return View();
        }

        // POST: Serie/Create
        [HttpPost]
        public ActionResult Create(Serie Serie)
        {
            try
            {
                BD.Series.Add(Serie);
                BD.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Serie/Edit/5
        public ActionResult Edit(int id)
        {
            ViewBag.MarcaID = new SelectList(BD.Marcas, "ID", "Nombre");
            return View(BD.Series.Find(id));
        }

        // POST: Serie/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, Serie Serie)
        {
            try
            {
                Serie Editar = BD.Series.Find(id);
                Editar.Marca = Serie.Marca;
                Editar.MarcaID = Serie.MarcaID;
                Editar.Nombre = Serie.Nombre;
                BD.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Serie/Delete/5
        public ActionResult Delete(int id)
        {
            ViewBag.Marcas = BD.Marcas.ToList();
            return View(BD.Series.Find(id));
        }

        // POST: Serie/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                Serie Borrar = BD.Series.Find(id);
                BD.Series.Remove(Borrar);
                BD.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        public ActionResult ListarPorLinkMarca (int MarcaID)
        {
            Marca Seleccionada = BD.Marcas.Find(MarcaID);
            // ViewBag.Marcas = BD.Marcas.ToList();
            List<Serie> SeriesDeLaMarca =
                (
                    from s in BD.Series
                    where s.MarcaID.Equals(MarcaID)
                    select s
                    ).ToList();
            return View(SeriesDeLaMarca);
        }
    }
}
