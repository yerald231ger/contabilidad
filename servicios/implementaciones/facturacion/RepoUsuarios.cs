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
            var d = _context.Set<Role>().FromSql("").ToList();
            return d;
        }

        public Usuario LeerUsario(int idUser)
        {
            var d = _dbSet.Find(idUser);
            return d;
        }
    }


    public static class UsuarioExtensions
    {
        public static Usuario CargarRoles(this Usuario usuario)
        {
            return null;
        }
    }
}
