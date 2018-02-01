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
        
        public List<Rol> LeerRoles(int idUser)
        {
            var usuario = _context.Set<Rol>().FromSql("").ToList();
            return usuario;
        }

        public Usuario LeerUsario(int idUser)
        { 
            var usuario = _dbSet.Find(idUser);
            usuario.CargarRoles(this);
            return usuario;
        }
    }

    public static class UsuarioExtensions
    {
        public static Usuario CargarRoles(this Usuario usuario, RepoUsuarios repo)
        {
            usuario.Roles = repo.LeerRoles(usuario.Id);
            return usuario;
        }
    }
}
