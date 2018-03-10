using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VistaControlador1.Models;

namespace VistaControlador1.Controllers
{
    public class SerieModeloController : Controller
    {
        ContextModel db = new ContextModel();
        // GET: SerieModelo
        public ActionResult Index()
        {
            return View();
        }

        // GET: SerieModelo/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: SerieModelo/Create
        public ActionResult Create()
        {
           
            ViewBag.MarcaID = new SelectList(db.Marcas, "ID", "Nom_marca");

            return View();
        }

        // POST: SerieModelo/Create
        [HttpPost]
        public ActionResult Create(SerieModelo SerieM)
        {
            try
            {
                using (var db = new ContextModel())
                {

                    db.SerieM.Add(SerieM);
                    db.SaveChanges();
                }

                return RedirectToAction("Create");
            }
            catch
            {
                return View();
            }
        }

        // GET: SerieModelo/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: SerieModelo/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Create");
            }
            catch
            {
                return View();
            }
        }

        // GET: SerieModelo/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: SerieModelo/Delete/5
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
            MarcaModelo marca = db.Marcas.Include("MarcaSeries").FirstOrDefault(x => x.ID == marcaID);
            return View(marca);
        }

        public ActionResult ListSeries()
        {
            List<SerieModelo> series = db.SerieM.ToList();
            return View(series);
        }
    }
}
