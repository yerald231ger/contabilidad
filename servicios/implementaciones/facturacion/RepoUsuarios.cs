using datos.db;
using datos.Objetos;
using servicios.interfaces;
using System;
using System.Collections.Generic;
using System.Text;

namespace servicios.implementaciones.facturacion
{
    public class RepoUsuarios : Repo<Usuario, int>, IRepoUsuarios
    {
        public RepoUsuarios(FacturacionDbContext dbContext) : base(dbContext)
        {

        }
    }
}
