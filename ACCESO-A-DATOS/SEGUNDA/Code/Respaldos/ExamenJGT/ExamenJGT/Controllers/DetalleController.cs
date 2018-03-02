using ExamenJGT.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ExamenJGT.Controllers
{
    public class DetalleController : Controller
    {
        Contexto BD = new Contexto();

        // GET: Detalle
        public ActionResult Index()
        {
            return View();
        }

        // GET: Detalle/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        private void meterDetalleSiNoExiste(int id)
        {
            Detalle Rescatado = BD.Detalles.Find(id);
            if (Rescatado == null)
            {
                // Creo Detalle linkado al pedido
                Detalle Detalle = new Detalle() { PedidoID = id };
                // Lo inserto en la base de datos para poder encontrarl o leugo
                BD.Detalles.Add(Detalle);
                BD.SaveChanges();
            }
        }

        // GET: Detalle/Create
        public ActionResult Create(int PedidoID = 0)
        {
            // ESTO ES PARA METER LOS PRODUCTOS

            meterDetalleSiNoExiste(PedidoID);

            Detalle Detalle = BD.Detalles.Find(PedidoID); // Nunca sera null porque si no exite lo he metido antes

            // Lo paso en el viewbag
            ViewBag.DetalleID = Detalle;

            // Cargo los datos de los productos
            ViewBag.ProductosIDs = new SelectList(BD.Productos, "ID", "Nombre");

            // ESTO ES PARA LISTAR las cosas del que hay
            List<int> TodasLasComprar = new List<int>();

            List<int> productos = BD.ProductosDetalles.Where(e => e.DetalleID == Detalle.ID).Select(e => e.ProductoID).ToList();
            Detalle.ProductosDetallesIDs = productos;
            
           // NO me da tiempo de seguir

            La idea es asignar las listas con las consultas que he hecho todo el rato
                y asignar el precio al rescarte de la cantidad por el precio que tambien resctao

        }

        // POST: Detalle/Create
        [HttpPost]
        public ActionResult Create(ProductosDetalle Datos)
        {
            try
            {
                BD.ProductosDetalles.Add(Datos);
                BD.SaveChanges();
                return RedirectToAction("Create");
            }
            catch
            {
                return View();
            }
        }

        // GET: Detalle/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Detalle/Edit/5
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

        // GET: Detalle/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Detalle/Delete/5
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
