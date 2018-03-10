using ExamenJGT.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ExamenJGT.Controllers
{
    public class ProductoController : Controller
    {
        Contexto BD = new Contexto();

        // GET: Producto
        public ActionResult Index()
        {
            // LO cargo aquí porque el otro no carga siempre y es nulo!!
            ViewBag.ProductosExistentes = BD.Productos.ToList();
            return View(BD.Productos.ToList());
        }

        // GET: Producto/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Producto/Create
        public ActionResult Create()
        {
            ViewBag.ProductosExistentes = BD.Productos.ToList();
            return View();
        }

        // POST: Producto/Create
        [HttpPost]
        public ActionResult Create(Producto Producto)
        {
            try
            {
                BD.Productos.Add(Producto);
                BD.SaveChanges();
                return RedirectToAction("Create");
            }
            catch
            {
                return View();
            }
        }

        // GET: Producto/Edit/5
        public ActionResult Edit(int id)
        {
            Producto Mostrando = BD.Productos.Find(id);
            return View(Mostrando);
        }

        // POST: Producto/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, Producto Introducido)
        {
            try
            {
                Producto Editando = BD.Productos.Find(id);
                Editando.Cantidad = Introducido.Cantidad;
                Editando.Precio = Introducido.Precio;
                Editando.Foto = Introducido.Foto;
                Editando.Descripcion = Introducido.Descripcion;
                Editando.Nombre = Introducido.Nombre;
                BD.SaveChanges();
                return RedirectToAction("Create");
            }
            catch
            {
                return View();
            }
        }

        // GET: Producto/Delete/5
        public ActionResult Delete(int id)
        {
            Producto Borrando = BD.Productos.Find(id);
            return View(Borrando);
        }

        // POST: Producto/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                Producto Matar = BD.Productos.Find(id);
                BD.Productos.Remove(Matar);
                BD.SaveChanges();
                return RedirectToAction("Create");
            }
            catch
            {
                return View();
            }
        }
    }
}
