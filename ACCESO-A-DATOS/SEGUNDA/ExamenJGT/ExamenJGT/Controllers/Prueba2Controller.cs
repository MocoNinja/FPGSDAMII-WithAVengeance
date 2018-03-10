using ExamenJGT.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ExamenJGT.Controllers
{
    public class Prueba2Controller : Controller
    {
        Contexto BD = new Contexto();

        // GET: Prueba2
        public ActionResult Index()
        {
            return View(BD.TablaPrueba2.Include("Puntero").ToList());
        }

        // GET: Prueba2/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Prueba2/Create
        public ActionResult Create()
        {
            ViewBag.PunteroID = new SelectList(BD.TablaPrueba, "ID", "Mensaje");
            return View();
        }

        // POST: Prueba2/Create
        [HttpPost]
        public ActionResult Create(ClasePrueba2 asad)
        {
            try
            {
                BD.TablaPrueba2.Add(asad);
                BD.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Prueba2/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Prueba2/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Prueba2/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Prueba2/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        public ActionResult Filtrico(int Objetito1 = 0, int Objetito2 = 0)
        {
            ViewBag.Objetito1 = new SelectList(BD.TablaPrueba, "ID", "Mensaje");
            List<ClasePrueba2> Objetitos2 =
                (
                    from s in BD.TablaPrueba2.ToList()
                    where s.PunteroID.Equals(Objetito1)
                    select s
                ).ToList();
            ViewBag.Objetito2 = new SelectList(Objetitos2, "ID", "Nombre");
            ClasePrueba2 ObjetoFinal = BD.TablaPrueba2.Find(Objetito2);
            if (ObjetoFinal == null) ObjetoFinal = new ClasePrueba2() { ID = 0, Nombre = -69 };
            return View(ObjetoFinal);
        }
    }
}
