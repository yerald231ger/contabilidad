using datos.Objetos;
using System;
using System.Collections.Generic;
using System.Text;

namespace servicios.interfaces
{

    public interface IRepoUsuarios : IRepo<Usuario, int>
    {
        Usuario LeerUsario(int idUser);
        List<Role> LeerRoles(int idUser);
    }
}
