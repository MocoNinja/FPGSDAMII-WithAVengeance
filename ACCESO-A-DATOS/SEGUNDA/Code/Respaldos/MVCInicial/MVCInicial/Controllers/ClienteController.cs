using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVCInicial.Models;
using System.Xml;

namespace MVCInicial.Controllers
{
    public class ClienteController : Controller
    {
        Contexto BD = new Contexto();
        // GET: Cliente
        public ActionResult Index()
        {
            ViewBag.Provincias = BD.Provincias.ToList();
            return View(BD.Clientes.ToList());
        }

        // GET: Cliente/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Cliente/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Cliente/Create
        [HttpPost]
        public ActionResult Create(Cliente Cliente)
        {
            try
            {
                return RedirectToAction("Create");
            }
            catch
            {
                return View();
            }
        }

        // GET: Cliente/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Cliente/Edit/5
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

        // GET: Cliente/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Cliente/Delete/5
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

        public ActionResult Importar()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Importar(string NombreArchivo)
        {
            XmlDocument Documento = new XmlDocument();
            Documento.Load(Server.MapPath("/Datos/" + NombreArchivo));
            // seleccionar todos los nodos dentro de cliente, dentro de clientes
            foreach (XmlNode nodo in Documento.SelectNodes("/clientes/cliente"))
            {
                Cliente Cliente = new Cliente()
                {
                    NIF = nodo["nif"].InnerText,
                    Apellidos = nodo["apellidos"].InnerText,
                    Nombre = nodo["nombre"].InnerText,
                    Dirección = nodo["direccion"].InnerText,
                    ProvinciaID = int.Parse(nodo["provincia"].InnerText)
                };
                int Codigo = int.Parse(nodo["provincia"].InnerText);
                Cliente.Provincia = BD.Provincias.Single(x => x.Codigo == Codigo);
                BD.Clientes.Add(Cliente);
                BD.SaveChanges();
            }
            return View();
        }
    }
}
