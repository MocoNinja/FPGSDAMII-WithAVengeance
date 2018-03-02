using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVCInicial.Models;

namespace MVCInicial.Controllers
{
    public class ProvinciasController : Controller
    {
        Contexto BD = new Contexto();
        // GET: Provincias
        public ActionResult Index()
        {
            List<Provincia> Provincias = BD.Provincias.ToList();
            return View(Provincias);
        }

        // GET: Provincias/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Provincias/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Provincias/Create
        [HttpPost]
        public ActionResult Create(Provincia Provincia)
        {
            try
            {
                BD.Provincias.Add(Provincia);
                BD.SaveChanges();
                return RedirectToAction("Create");
            }
            catch
            {
                return View();
            }
        }

        // GET: Provincias/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Provincias/Edit/5
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

        // GET: Provincias/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Provincias/Delete/5
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
    }
}
