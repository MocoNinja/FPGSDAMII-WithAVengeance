using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MiConcesionario.Models;

namespace MiConcesionario.Controllers
{
    public class ExtraController : Controller
    {
        Contexto BD = new Contexto();

        // GET: Extra
        public ActionResult Index()
        {
            return View(BD.Extras.ToList());
        }

        // GET: Extra/Details/5
        public ActionResult Details(int id)
        {
            return View(BD.Extras.Find(id));
        }

        // GET: Extra/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Extra/Create
        [HttpPost]
        public ActionResult Create(Extra Extra)
        {
            try
            {
                BD.Extras.Add(Extra);
                BD.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Extra/Edit/5
        public ActionResult Edit(int id)
        {
            return View(BD.Extras.Find(id));
        }

        // POST: Extra/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, Extra Extra)
        {
            try
            {
                Extra Editar = BD.Extras.Find(id);
                Editar.Nombre = Extra.Nombre;
                BD.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Extra/Delete/5
        public ActionResult Delete(int id)
        {
            return View(BD.Extras.Find(id));
        }

        // POST: Extra/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                Extra Borrar = BD.Extras.Find(id);
                BD.Extras.Remove(Borrar);
                BD.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
