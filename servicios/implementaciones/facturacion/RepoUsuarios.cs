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
        
        public Usuario LeerUsario(int idUsuario)
        {
            var usuario = _dbSet.Find(idUsuario);
            usuario.CargarRoles(this);
            usuario.CargarEspecificaciones(this);
            return usuario;
        }

        public List<Rol> LeerRoles(int idUsuario)
        {
            var roles = _context.Set<Rol>().FromSql("" +
                "SELECT A.Id, A.Nombre, A.FechaAlta, A.FechaModificacion, A.EsActivo " +
                "FROM tbl_Roles A JOIN tbl_RolesUsuario B ON A.Id = B.IdRol " +
                $"WHERE B.IdUsuario = {idUsuario} " +
                "AND A.EsActivo = 1").ToList();
            return roles;
        }
        
        public List<Especificacion> LeerEspecificaciones(int idUsuario)
        {
            var especs = _context.Set<Especificacion>().FromSql(
                $"SELECT * FROM tbl_Especificaciones " +
                $"WHERE IdUsuario = {idUsuario}").ToList();

            return especs;
        }

        public string ObtenerHash(string nombreUsuario)
        {
            return _dbSet.Where(u => u.Correo == nombreUsuario).Select(u => u.HashContrasena).First();
        }

        public Usuario LeerUsario(string nombreUsuario)
        {
            var usuario = _dbSet.First(u => u.NombreUsuario == nombreUsuario);
            usuario.CargarRoles(this);
            usuario.CargarEspecificaciones(this);
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

        public static Usuario CargarEspecificaciones(this Usuario usuario, RepoUsuarios repo)
        {
            usuario.Especificaciones = repo.LeerEspecificaciones(usuario.Id);
            return usuario;
        }
    }
}
