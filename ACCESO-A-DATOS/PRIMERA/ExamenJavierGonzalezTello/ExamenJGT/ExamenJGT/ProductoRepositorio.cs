using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ExamenJGT
{
    public class ProductoRepositorio
    {
        BaseDatos BD = new BaseDatos();

        public List<Producto> SelectProductos()
        {
            return BD.TablaProductos.ToList();
        }

        public void InsertProducto(Producto Insertando)
        {
            BD.TablaProductos.Add(Insertando);
            BD.SaveChanges();
        }

        public void DeleteProducto (Producto Borrando)
        {
            Producto Rescatar = BD.TablaProductos.FirstOrDefault(elemento => elemento.Id == Borrando.Id);
            BD.TablaProductos.Remove(Rescatar);
            BD.SaveChanges();
        }

        public void UpdateProducto (Producto Actualizando)
        {
            Producto Rescatar = BD.TablaProductos.FirstOrDefault(elemento => elemento.Id == Actualizando.Id);
            Rescatar.Nom_Producto = Actualizando.Nom_Producto;
            Rescatar.Foto = Actualizando.Foto;
            BD.SaveChanges();
        }
    }
}