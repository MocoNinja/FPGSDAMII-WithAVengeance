using MVCInicial.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCInicial.Controllers
{
    public class MarcaController : Controller
    {
        // GET: Marca
        public ActionResult Index()
        {
            return View();
        }

        // GET: Marca/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Marca/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Marca/Create
        [HttpPost]
        public ActionResult Create(Marca insertada)
        {
            try
            {
                // definimos una zona en la que vamos a usar una variable bd
                using (var bd = new Contexto())
                {
                    bd.Marcas.Add(insertada);
                    bd.SaveChanges();
                }
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Marca/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Marca/Edit/5
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

        // GET: Marca/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Marca/Delete/5
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

        public ActionResult Desplegable()
        {
            Contexto BaseDatos = new Contexto();
            // Vamos a crear el objeto SelectList para cargarlo al DropDownList
            // Este SelectList contiene a los SelectListItem
            // Hay que pasarle dos parámetros
            //  1. El DbSet
            //  2. Los elementos (nombres)
            SelectList Lista = new SelectList(BaseDatos.Marcas, "Id", "Nombre");
            // En este primer ejercicio vamos a pasar los objetos a través del contenedor (ViewBag)
            ViewBag.Marcas = Lista;

            // Ahora vamos a crear otro objetos que sea una Lista (en vez de SelectList) con los elementos de la tabla de marcas
            List<Marca> ListaMarcas = BaseDatos.Marcas.ToList();
            ViewBag.ListaMarcas = ListaMarcas;
            return View();
        }

        // Hay que sacar el listado de marcas
        public ActionResult List()
        {
            Contexto BD = new Contexto();
            List<Marca> Marcas = BD.Marcas.ToList();
            return View(Marcas);
        }
    }
}
