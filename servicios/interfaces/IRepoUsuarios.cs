using datos.Objetos;
using System;
using System.Collections.Generic;
using System.Text;

namespace servicios.interfaces
{

    public interface IRepoUsuarios : IRepo<Usuario, int>
    {
        string ObtenerHash(string nombreUsuario);
        Usuario LeerUsuario(int idUsuario);
        Usuario LeerUsuario(string nombreUsuario);
        List<Rol> LeerRoles(int idUsuario);
        List<Especificacion> LeerEspecificaciones(int idUsuario);
    }
}
