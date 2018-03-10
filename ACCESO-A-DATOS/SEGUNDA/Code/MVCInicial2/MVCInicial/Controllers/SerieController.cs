using MVCInicial.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCInicial.Controllers
{
    public class SerieController : Controller
    {
        // GET: Serie
        public ActionResult Index()
        {
            return View();
        }

        // GET: Serie/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Serie/Create
        public ActionResult Create()
        {
            Contexto BD = new Contexto();
            ViewBag.IdMarca = new SelectList(BD.Marcas, "Id", "Nombre");
            return View();
        }

        // POST: Serie/Create
        [HttpPost]
        public ActionResult Create(Serie insertada)
        {
            try
            {
                // definimos una zona en la que vamos a usar una variable bd
                using (var bd = new Contexto())
                {
                    bd.Series.Add(insertada);
                    bd.SaveChanges();
                }
                return RedirectToAction("Create");
            }
            catch
            {
                return View();
            }
        }

        // GET: Serie/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Serie/Edit/5
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

        // GET: Serie/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Serie/Delete/5
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

        public ActionResult List(int marcaID)
        {
            Contexto BD = new Contexto();
            Marca Marca = BD.Marcas.Include("Series").FirstOrDefault(mierda => mierda.Id == marcaID);
            return View(Marca);
        }

    }
}
