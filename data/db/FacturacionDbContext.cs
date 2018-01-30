using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace datos.db
{
    public class FacturacionDbContext : DbContext
    {
        public FacturacionDbContext(DbContextOptions options) : base(options)
        {
        }
    }
}
