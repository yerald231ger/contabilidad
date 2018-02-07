using datos.db;
using datos.Objetos;
using servicios.interfaces;

namespace servicios.implementaciones.facturacion
{
    public class RepoEspecificaciones : Repo<Especificacion, int>, IRepoEspecificaciones
    {
        public RepoEspecificaciones(FacturacionDbContext dbContext) : base(dbContext)
        {

        }
    }
}