using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MiConcesionario.Models;
using System.Data.SqlClient;

namespace MiConcesionario.Controllers
{
    public class VehiculoController : Controller
    {
        public class VehiculoTotal
        {
            public string NombreMarca { get; set; }
            public string NombreSerie { get; set; }
            public string Matricula { get; set; }
            public string Color { get; set; }
        }

        Contexto BD = new Contexto();
        // GET: Vehiculo
        public ActionResult Index()
        {
            ViewBag.Series = BD.Series.ToList();
            ViewBag.Marcas = BD.Marcas.ToList();
            return View(BD.Vehiculos.ToList());
        }

        // GET: Vehiculo/Details/5
        public ActionResult DetailsOLDDOESNOTWORK(int id)
        {
            ViewBag.Series = BD.Series.ToList();
            ViewBag.Marcas = BD.Marcas.ToList();
            Vehiculo Vehiculo = BD.Vehiculos.Find(id);
            Vehiculo.Extras = BD.ExtrasVehiculos.Where(e => e.VehiculoID.Equals(id)).ToList();
            ViewBag.Extras = new MultiSelectList(BD.Extras.ToList(), "ID", "Nombre", Vehiculo.Extras);
            return View(Vehiculo);
        }

        public ActionResult Details(int id)
        {
            ViewBag.Series = BD.Series.ToList();
            ViewBag.Marcas = BD.Marcas.ToList();
            Vehiculo Vehiculo = BD.Vehiculos.Find(id);
            Vehiculo.ExtrasID = BD.ExtrasVehiculos.Where(e => e.VehiculoID.Equals(id)).Select(e => e.ExtraID).ToList();
            ViewBag.Extras = new MultiSelectList(BD.Extras.ToList(), "ID", "Nombre", Vehiculo.Extras);
            return View(Vehiculo);
        }

        // GET: Vehiculo/Create
        public ActionResult Create()
        {
            ViewBag.Marcas = BD.Marcas.ToList();
            // ViewBag.Series = BD.Series.ToList();
            ViewBag.SerieID = new SelectList(BD.Series, "ID", "Nombre");
            ViewBag.Extras = new MultiSelectList(BD.Extras, "ID", "Nombre");
            return View();
        }

        // POST: Vehiculo/Create
        [HttpPost]
        public ActionResult Create(Vehiculo Vehiculo)
        {
            try
            {
                BD.Vehiculos.Add(Vehiculo);
                foreach(int clave in Vehiculo.ExtrasID)
                {
                    ExtrasVehiculos Relacion = new ExtrasVehiculos()
                    {
                        ExtraID = clave,
                        VehiculoID = Vehiculo.ID
                    };
                    BD.ExtrasVehiculos.Add(Relacion);
                }
                BD.SaveChanges();
                return RedirectToAction("Create");
            }
            catch
            {
                return View();
            }
        }

        // GET: Vehiculo/Edit/5
        public ActionResult Edit(int id)
        {
            // ViewBag.Series = BD.Series.ToList();
            ViewBag.SerieID = new SelectList(BD.Series, "ID", "Nombre");
            ViewBag.Marcas = BD.Marcas.ToList();
            Vehiculo Vehiculo = BD.Vehiculos.Find(id);
            Vehiculo.ExtrasID = BD.ExtrasVehiculos.Where(m => m.VehiculoID.Equals(id)).Select(a => a.ExtraID).ToList();
            ViewBag.Extras = new MultiSelectList(BD.Extras, "ID", "Nombre", Vehiculo.ExtrasID);
            return View(Vehiculo);
        }

        // POST: Vehiculo/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, Vehiculo Vehiculo)
        {
            try
            {
                Vehiculo Editar = BD.Vehiculos.Find(id);
                Editar.Color = Vehiculo.Color;
                Editar.Matricula = Vehiculo.Matricula;
                Editar.Serie = Vehiculo.Serie;
                Editar.SerieID = Vehiculo.SerieID;

                // borrar los registros de este vehiculos en la tabla intermedia
                List<ExtrasVehiculos> RegistrosBorrar = BD.ExtrasVehiculos.Where(e => e.VehiculoID.Equals(id)).ToList();
                foreach (ExtrasVehiculos Registro in RegistrosBorrar)
                {
                    BD.ExtrasVehiculos.Remove(Registro);
                }

                // meter los nuevos
                List<int> NuevosRegistros = Vehiculo.ExtrasID;
                foreach (int Codigo in NuevosRegistros)
                {
                    ExtrasVehiculos NuevoRegistro = new ExtrasVehiculos() { VehiculoID = id, ExtraID = Codigo };
                    BD.ExtrasVehiculos.Add(NuevoRegistro);
                }
                BD.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Vehiculo/Delete/5
        public ActionResult Delete(int id)
        {
            ViewBag.Series = BD.Series.ToList();
            ViewBag.Marcas = BD.Marcas.ToList();
            return View(BD.Vehiculos.Find(id));
        }

        // POST: Vehiculo/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                Vehiculo Borrar = BD.Vehiculos.Find(id);
                BD.Vehiculos.Remove(Borrar);
                BD.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        public ActionResult BuscarPorMatricula(string Matricula = "")
        {
            List<Vehiculo> VehiculosFiltadros =
                (
                    from v in BD.Vehiculos
                    where v.Matricula.Contains(Matricula)
                    select v
                ).ToList();
            ViewBag.Series = BD.Series.ToList();
            return View(VehiculosFiltadros);
        }

        public ActionResult EncontrarPorMatricula(string Matricula = "")
        {
            List<Vehiculo> VehiculosFiltadros =
                (
                    from v in BD.Vehiculos
                    where v.Matricula.Equals(Matricula)
                    select v
                ).ToList();
            ViewBag.Series = BD.Series.ToList();
            return View(VehiculosFiltadros);
        }

        public ActionResult SeleccionarPorMatricula(string Matricula = "")
        {
            /*
             * // MI forma
            List<String> Matriculas =
            (
                from m in BD.Vehiculos
                select m.Matricula
            ).ToList();

            ViewBag.Matriculas = Matriculas;
            */
            ViewBag.Matricula = new SelectList(BD.Vehiculos, "Matricula", "Matricula");
            List<Vehiculo> VehiculosFiltadros =
                (
                    from v in BD.Vehiculos
                    where v.Matricula.Equals(Matricula)
                    select v
                ).ToList();
            ViewBag.Series = BD.Series.ToList();
            return View(VehiculosFiltadros);
        }

        public ActionResult SeleccionarPorFiltros(int MarcaID = 0, int SerieID = 0)
        {
            ViewBag.MarcaID = new SelectList(BD.Marcas, "ID", "Nombre");
            // ViewBag.SerieID = new SelectList(BD.Series, "ID", "Nombre");
            List<Serie> Series = (
                from m in BD.Series
                where m.MarcaID.Equals(MarcaID)
                select m
                ).ToList();
            ViewBag.SerieID = new SelectList(Series, "ID", "Nombre");
            List<Vehiculo> Vehiculos = (
                from v in BD.Vehiculos
                where v.SerieID.Equals(SerieID)
                select v
                ).ToList();

            return View(Vehiculos);
        }

        /*
         // Procedure
         create procedure getResumen
            as
            begin
	            select Marcas.Nombre As NombreMarca, Series.Nombre As NombreSerie, Vehiculoes.Color, Vehiculoes.Matricula from Vehiculoes
	            join Series
	            on Series.ID = Vehiculoes.SerieID
	            join Marcas
	            on MarcaID = Series.MarcaID
            end
         */
        public ActionResult ResumenProcedure()
        {
            List<VehiculoTotal> Filtro = BD.Database.SqlQuery<VehiculoTotal>("getResumen").ToList();
            return View(Filtro);
        }

        /*
         //
         create procedure getVehiculosColor
        @ColorSeleccionado nvarchar(30)
        as
        begin
	        select Series.Nombre As NombreSerie, Marcas.Nombre As NombreMarca, Vehiculoes.Color, Vehiculoes.Matricula from Vehiculoes
	        join Series
	        on SerieID = Vehiculoes.SerieID
	        join Marcas
	        on MarcaID = Series.MarcaID
	        where Vehiculoes.Color = @ColorSeleccionado
        end 
        */

        public ActionResult ParametroProcedure(String color="")
        {
            List<string> Colores = BD.Vehiculos.Select(l => l.Color).Distinct().ToList();
            ViewBag.color = new SelectList(Colores);
            List<VehiculoTotal> Filtro = BD.Database.SqlQuery<VehiculoTotal>("getVehiculosColor @ColorSeleccionado", 
                new SqlParameter("@ColorSeleccionado", color)).ToList();
            return View(Filtro);
        }
    }
}
