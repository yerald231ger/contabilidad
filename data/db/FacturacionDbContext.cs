using datos.Objetos;
using Microsoft.EntityFrameworkCore;

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
            modelBuilder.Entity<Usuario>().ToTable("tbUsuarios");
            modelBuilder.Entity<Rol>().ToTable("tbRoles");
            modelBuilder.Entity<Especificacion>().ToTable("tbEspecificaciones");
        }
    }
}
