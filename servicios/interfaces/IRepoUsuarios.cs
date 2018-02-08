using datos.Objetos;
using System;
using System.Collections.Generic;
using System.Text;

namespace servicios.interfaces
{

    public interface IRepoUsuarios : IRepo<Usuario, int>
    {
        string ObtenerHash(string nombreUsuario);
        Usuario LeerUsario(int idUsuario);
        Usuario LeerUsario(string nombreUsuario);
        List<Rol> LeerRoles(int idUsuario);
    }
}
