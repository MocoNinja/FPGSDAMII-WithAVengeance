using ExamenJGT.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ExamenJGT.Controllers
{
    public class ClienteController : Controller
    {

        public Contexto BD = new Contexto();

        // GET: Cliente
        public ActionResult Index()
        {
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
            ViewBag.ClientesExistentes = BD.Clientes.ToList();
            return View();
        }

        // POST: Cliente/Create
        [HttpPost]
        public ActionResult Create(Cliente Cliente)
        {
            try
            {
                BD.Clientes.Add(Cliente);
                BD.SaveChanges();
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
            Cliente Mostrando = BD.Clientes.Find(id);
            return View(Mostrando);
        }

        // POST: Cliente/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, Cliente Editando)
        {
            try
            {
                Cliente Modificar = BD.Clientes.Find(id);
                Modificar.CIF = Editando.CIF;
                Modificar.Direccion = Editando.Direccion;
                Modificar.Nombre = Editando.Nombre;
                Modificar.Logotipo = Modificar.Logotipo;
                BD.SaveChanges();
                return RedirectToAction("Create");
            }
            catch
            {
                return View();
            }
        }

        // GET: Cliente/Delete/5
        public ActionResult Delete(int id)
        {
            Cliente Mostrando = BD.Clientes.Find(id);
            return View(Mostrando);
        }

        // POST: Cliente/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, Cliente  Cliente)
        {
            try
            {
                Cliente Borrar = BD.Clientes.Find(id);
                BD.Clientes.Remove(Borrar);
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
