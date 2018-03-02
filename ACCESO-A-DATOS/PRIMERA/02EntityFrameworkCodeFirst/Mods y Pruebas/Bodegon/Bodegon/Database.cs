using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace Bodegon
{
    public class Database : DbContext
    {
        public DbSet<Wine> Wines { get; set; }
        public DbSet<Winery> Winery { get; set; }
    }
}