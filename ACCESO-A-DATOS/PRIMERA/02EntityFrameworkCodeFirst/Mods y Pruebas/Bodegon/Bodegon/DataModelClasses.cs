using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Bodegon
{
    public class DataModelClasses
    {
    }

    public class Wine
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int IdWinery { get; set; }
        [ForeignKey("IdWinery")]
        Winery Winery { get; set; }
    }

    public class Winery
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }

}