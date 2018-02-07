using datos.Objetos;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace datos.db
{
    public class FacturacionDbContext : DbContext
    {
        public virtual DbSet<Usuario> Usuarios { get; set; }
        public virtual DbSet<Rol> Roles { get; set; }
        public virtual DbSet<Especificacion> Especificaciones { get; set; }

        public FacturacionDbContext(DbContextOptions options) : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            //se mapea la bd para saber que de que tabla cargar el DbSet
            modelBuilder.Entity<Usuario>().ToTable("tbl_Usuarios");
            modelBuilder.Entity<Rol>().ToTable("tbl_Roles");
            modelBuilder.Entity<Especificacion>().ToTable("tbl_Especificaciones");
        }
    }
}
