﻿using datos.db;
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

        public Usuario LeerUsuario(int idUsuario) 
            => LeerUsuario(idUsuario, string.Empty);

        public string ObtenerHash(string nombreUsuario) 
            => _dbSet.Where(u => u.Correo == nombreUsuario).Select(u => u.HashContrasena).First();

        public Usuario LeerUsuario(string nombreUsuario) 
            => LeerUsuario(0, nombreUsuario);

        public List<Rol> LeerRoles(int idUsuario) 
            => _context.Set<Rol>().FromSql("" +
                "SELECT A.Id, A.Nombre, A.FechaAlta, A.FechaModificacion, A.EsActivo " +
                "FROM tbl_Roles A JOIN tbl_RolesUsuario B ON A.Id = B.IdRol " +
                $"WHERE B.IdUsuario = {idUsuario} " +
                "AND A.EsActivo = 1").ToList();

        public List<Especificacion> LeerEspecificaciones(int idUsuario) 
            => _context.Set<Especificacion>().FromSql(
                $"SELECT * FROM tbl_Especificaciones " +
                $"WHERE IdUsuario = {idUsuario}").ToList();

        public bool EstaDisponible(string nombreUsuario) 
            => (_dbSet.Where(u => u.Correo == nombreUsuario).First() == null) ? false : true;

        private Usuario LeerUsuario(int idUsuario, string nombreUsuario)
        {
            var usuario = _dbSet.Where(u => u.Correo == nombreUsuario || u.Id == idUsuario).First();
            if (usuario == null)
                return null;

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
