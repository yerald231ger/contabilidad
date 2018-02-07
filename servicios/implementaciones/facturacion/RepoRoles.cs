using datos.db;
using datos.Objetos;
using servicios.interfaces;

namespace servicios.implementaciones.facturacion
{
    public class RepoRoles : Repo<Rol, int>, IRepoRoles
    {
        public RepoRoles(FacturacionDbContext dbContext) : base(dbContext)
        {

        }
    }
}


