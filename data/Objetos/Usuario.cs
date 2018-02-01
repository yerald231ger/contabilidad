﻿using System;
using System.Collections.Generic;
using System.Text;

namespace datos.Objetos
{
    public class Usuario : Base<int>
    {
        public string PrimerApellido { get; set; }
        public string SegundoApellido { get; set; }
        public string NombreUsuario { get; set; }
        public DateTime FechaNacimineto { get; set; }
        public string Correo { get; set; }
        public string NumeroCelular { get; set; }

        public ICollection<Rol> Roles { get; set; }
    }
}
