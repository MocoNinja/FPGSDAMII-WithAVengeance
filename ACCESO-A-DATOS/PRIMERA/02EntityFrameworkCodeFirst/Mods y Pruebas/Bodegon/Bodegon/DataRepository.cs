using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Bodegon
{
    public class DataRepository
    {
        Database DB = new Database();

        public List<Wine> SelectWines()
        {
            return DB.Wines.ToList();
        }

        public List<Winery> SelectWinery()
        {
            return DB.Winery.ToList();
        }

        public void InsertWine(Wine EnteredWine)
        {
            DB.Wines.Add(EnteredWine);
            DB.SaveChanges();
        }

        public void InsertWinery(Winery EnteredWinery)
        {
            DB.Winery.Add(EnteredWinery);
            DB.SaveChanges();
        }

        public void DeleteWine(Wine SelectedWine)
        {
            Wine Wine2Delete = DB.Wines.FirstOrDefault(e => e.Id == SelectedWine.Id);
            DB.Wines.Remove(SelectedWine);
            DB.SaveChanges();
        }
    }
}