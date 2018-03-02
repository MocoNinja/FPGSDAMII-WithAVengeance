using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Vinoteca
{
    public class ClienteRepositorio
    {
        BaseDatos BD = new BaseDatos();

        public List<Cliente> SelectClientes()
        {
            return BD.TablaClientes.ToList();
        }

        public void InsertCliente(Cliente Cliente)
        {
            BD.TablaClientes.Add(Cliente);
            BD.SaveChanges();
        }

        public void DeleteCliente(Cliente Cliente)
        {
            Cliente Target = BD.TablaClientes.FirstOrDefault(b => b.Id == Cliente.Id);
            BD.TablaClientes.Remove(Target);
            BD.SaveChanges();
        }

        public void UpdateCliente(Cliente Cliente)
        {
            Cliente Target = BD.TablaClientes.FirstOrDefault(b => b.Id == Cliente.Id);
            Target.Nombre = Cliente.Nombre;
            Target.Apellidos = Cliente.Apellidos;
            BD.SaveChanges();
        }
    }
}