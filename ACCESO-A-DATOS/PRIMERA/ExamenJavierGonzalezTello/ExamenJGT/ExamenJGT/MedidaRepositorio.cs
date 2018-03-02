using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ExamenJGT
{
    public class MedidaRepositorio
    {
        BaseDatos BD = new BaseDatos();

        public List<Medida> SelectMedidas()
        {
            return BD.TablaMedidas.ToList();
        }

        public void InsertMedida(Medida Insertando)
        {
            BD.TablaMedidas.Add(Insertando);
            BD.SaveChanges();
        }

        public void DeleteMedida(Medida Borrando)
        {
            Medida Rescatar = BD.TablaMedidas.FirstOrDefault(elemento => elemento.Id == Borrando.Id);
            BD.TablaMedidas.Remove(Rescatar);
            BD.SaveChanges();
        }

        public void UpdateMedida(Medida Actualizando)
        {
            Medida Rescatar = BD.TablaMedidas.FirstOrDefault(elemento => elemento.Id == Actualizando.Id);
            Rescatar.TipoMedida = Actualizando.TipoMedida;
            BD.SaveChanges();
        }
    }
}