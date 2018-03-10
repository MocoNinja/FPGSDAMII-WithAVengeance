using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Xml;
using VistaControlador1.Models;

namespace VistaControlador1.Controllers
{
    public class ClientesController : Controller
    {
        ContextModel db = new ContextModel();
        // GET: Clientes
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult List()
        {
            var lista = db.Clientes.ToList();
            return View(lista);
        }

        // GET
        public ActionResult Importar()
        {

            return View();
        }

        // POST
        [HttpPost]
        public ActionResult Importar(string nomArchivo)
        {


            XmlDocument doc = new XmlDocument();
            doc.Load(Server.MapPath("/Datos/" + nomArchivo));
            foreach(XmlNode nodo in doc.SelectNodes("/clientes/cliente"))
            {
                Clientes cliente = new Clientes
                {
                    NIF = nodo["nif"].InnerText,
                    Apellidos = nodo["apellidos"].InnerText,
                    Nombre = nodo["nombre"].InnerText,
                    Direccion = nodo["direccion"].InnerText,
                    ProvinciaID = int.Parse(nodo["provincia"].InnerText)               
                };

                db.Clientes.Add(cliente);
            }
            db.SaveChanges();

            return View();
        }


        // GET: Clientes/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Clientes/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Clientes/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Clientes/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Clientes/Edit/5
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

        // GET: Clientes/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Clientes/Delete/5
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
