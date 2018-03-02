using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VistaControlador1.Models;

namespace VistaControlador1.Controllers
{
    public class MarcaController : Controller
    {
        ContextModel bd = new ContextModel();
        // GET: Marca
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Desplegable()
        {
           
            
            //Se le pasa el dbset, la tabla de marcas y despues los elementos que queremos obtener, nombres de los campos
            //El viewBag es una variable que se puede recueperar desde la vista
            ViewBag.Marcas = new SelectList(bd.Marcas, "ID", "Nom_marca");
            ViewBag.Marcas2  = bd.Marcas.ToList();
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
        public ActionResult Create(MarcaModelo marca) //Cambiar a nuestro model e importarlo
        {
            try
            {
                using (var bd = new ContextModel())//Usamos el using para declarar una zona de una determinada variable
                {
                    bd.Marcas.Add(marca);
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

        public ActionResult ListMarcas()
        {
            List<MarcaModelo> marcas = bd.Marcas.ToList();
            return View(marcas);
        }
    }
}
