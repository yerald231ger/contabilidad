using datos.db;
using System.Collections.Generic;
using System.Linq;
using datos.Objetos;
using servicios.interfaces;
using Microsoft.EntityFrameworkCore;

namespace servicios.implementaciones.facturacion
{
    public class RepoUsuarios : Repo<Usuario, int>, IRepoUsuarios
    {
        public RepoUsuarios(FacturacionDbContext dbContext) : base(dbContext)
        {
        }
        
        public List<Role> LeerRoles(int idUser)
        {
            return _context.Set<Role>().FromSql("").ToList();
        }
    }
}
