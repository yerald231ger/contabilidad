using datos.Objetos;
using System;
using System.Collections.Generic;
using System.Text;

namespace servicios.interfaces
{
    public interface IRepoUsuarios : IRepo<Usuario, int>
    {
        List<Role> LeerRoles(int idUser);
    }
}
