using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ExamenJGT
{
    public class Receta_ProductosRepositorio
    {
        BaseDatos BD = new BaseDatos();

        public List<Receta_Productos> SelectReceta_Productos()
        {
            return BD.TablaReceta_Productos.ToList();
        }

        public void InsertReceta_Productos(Receta_Productos Insertar)
        {
            BD.TablaReceta_Productos.Add(Insertar);
            BD.SaveChanges();
        }

        public void DeleteReceta_Productos(Receta_Productos Borrando)
        {
            Receta_Productos Rescatada = BD.TablaReceta_Productos.FirstOrDefault
                (
                    Elemento => Elemento.IdProducto == Borrando.IdProducto
                    &&
                    Elemento.IdReceta == Borrando.IdReceta
                 );
            BD.TablaReceta_Productos.Remove(Rescatada);
            BD.SaveChanges();
            // NO actualizo las Ids por ser únicas
        }

        public void UpdateReceta_Productos(Receta_Productos Actualizando)
        {
            Receta_Productos Rescatada = BD.TablaReceta_Productos.FirstOrDefault
                (
                    Elemento => Elemento.IdProducto == Actualizando.IdProducto
                    &&
                    Elemento.IdReceta == Actualizando.IdReceta
                 );
            Rescatada.MedidaId = Actualizando.MedidaId;
            Rescatada.Cantidad = Actualizando.Cantidad;
            // NO actualizo las Ids por ser únicas
            BD.SaveChanges();
        }

        public List<Receta_Productos> SelectRecetaProductosFromReceta(String IdInsertada)
        {
            List<Receta_Productos> SusRecetaProductos = null;
            int IdReceta = int.Parse(IdInsertada);
            SusRecetaProductos =
                (
                from Ellos in BD.TablaReceta_Productos
                where Ellos.IdReceta == IdReceta
                select Ellos
                ).ToList();
            return SusRecetaProductos;
        }
    }
}