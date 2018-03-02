using ExamenJGT.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ExamenJGT.Controllers
{
    public class PruebaController : Controller
    {
        Contexto BD = new Contexto();

        // GET: Prueba
        public ActionResult Index()
        {
            return View(BD.TablaPrueba.ToList());
        }

        // GET: Prueba/Details/5
        public ActionResult Details(int id)
        {

            return View(BD.TablaPrueba.Find(id));
        }

        // GET: Prueba/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Prueba/Create
        [HttpPost]
        public ActionResult Create(ClasePrueba Prueba)
        {
            try
            {
                BD.TablaPrueba.Add(Prueba);
                BD.SaveChanges();
                return RedirectToAction("Create");
            }
            catch
            {
                return View();
            }
        }

        // GET: Prueba/Edit/5
        public ActionResult Edit(int id)
        {
            return View(BD.TablaPrueba.Find(id));
        }

        // POST: Prueba/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, ClasePrueba editar)
        {
            try
            {
                ClasePrueba Actualizar = BD.TablaPrueba.Find(id);
                Actualizar.Mensaje = editar.Mensaje;
                BD.SaveChanges();

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Prueba/Delete/5
        public ActionResult Delete(int id)
        {
            return View(BD.TablaPrueba.Find(id));
        }

        // POST: Prueba/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, ClasePrueba clase)
        {
            try
            {
                ClasePrueba Borrar = BD.TablaPrueba.Find(id);
                BD.TablaPrueba.Remove(Borrar);
                BD.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        public ActionResult Desplegar(int Objetos = 0)
        {
            ViewBag.Objetos = new SelectList(BD.TablaPrueba.ToList(), "ID", "Mensaje");
            ClasePrueba Deseado = BD.TablaPrueba.Find(Objetos);
            if (Deseado == null) Deseado = new ClasePrueba() { ID = -1, Mensaje = "Ninguno" };
            return View(Deseado);
        }

        public ActionResult Buscar (string nombre="")
        {
            /*
            List<ClasePrueba> Objetos =
                (
                    from adad in BD.TablaPrueba
                    where adad.Mensaje.Equals(nombre)
                    select adad
                    ).ToList();
                    */
            //List<ClasePrueba> Objetos = BD.TablaPrueba.Where(e => e.Mensaje.Equals(nombre)).ToList();
            List<ClasePrueba> Objetos = BD.TablaPrueba.Where(e => e.Mensaje.Contains(nombre)).ToList();
            return View(Objetos);
        }
    }
}
