using datos.Objetos;
using System;
using System.Collections.Generic;
using System.Text;

namespace servicios.interfaces
{

    public interface IRepoUsuarios : IRepo<Usuario, int>
    {
        string ObtenerHash(string NombreUsuario);
        Usuario LeerUsario(int idUsuario);
        List<Rol> LeerRoles(int idUsuario);
    }
}
