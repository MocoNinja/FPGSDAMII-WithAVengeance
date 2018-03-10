using ExamenJGT.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ExamenJGT.Controllers
{
    public class PedidoController : Controller
    {
        Contexto BD = new Contexto();

        // GET: Pedido
        public ActionResult Index()
        {
            return View(BD.Pedidos.ToList());
        }

        // GET: Pedido/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Pedido/Create
        public ActionResult Create()
        {
            ViewBag.PedidosExistentes = BD.Pedidos.OrderByDescending(e => e.FechaExpedicion).ToList();
            ViewBag.ClienteID = new SelectList(BD.Clientes.ToList(), "ID", "Nombre");
            return View();
        }

        // POST: Pedido/Create
        [HttpPost]
        public ActionResult Create(Pedido Pedido)
        {
            try
            {
                //Pedido.NumeroPedido = Pedido.FechaExpedicion.Year + "-" + Pedido.ID;
                // No genera la ID hasta que mete parece ser, porque siempre lee0
                int idSBT = BD.Pedidos.ToList().Count;
                Pedido.NumeroPedido = Pedido.FechaExpedicion.Year + "-" + idSBT;
                BD.Pedidos.Add(Pedido);
                BD.SaveChanges();
                return RedirectToAction("Create");
            }
            catch
            {
                return View();
            }
        }

        // GET: Pedido/Edit/5
        public ActionResult Edit(int id)
        {
            Pedido Editando = BD.Pedidos.Find(id);
            ViewBag.ClienteID = new SelectList(BD.Clientes.ToList(), "ID", "Nombre");
            return View(Editando);
        }

        // POST: Pedido/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, Pedido Insertado)
        {
            try
            {
                Pedido Editar = BD.Pedidos.Find(id);
                Editar.ClienteID = Insertado.ClienteID;
                Editar.FechaExpedicion = Insertado.FechaExpedicion;
                Editar.NumeroPedido = Insertado.NumeroPedido;
                BD.SaveChanges();
                return RedirectToAction("Create");
            }
            catch
            {
                return View();
            }
        }

        // GET: Pedido/Delete/5
        public ActionResult Delete(int id)
        {
            Pedido Borrando = BD.Pedidos.Find(id);
            ViewBag.Clientes = BD.Clientes.ToList(); // para mostrar algun datillo
            return View(Borrando);
        }

        // POST: Pedido/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, Pedido Pedido)
        {
            try
            {
                Pedido Borrar = BD.Pedidos.Find(id);
                BD.Pedidos.Remove(Borrar);
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
