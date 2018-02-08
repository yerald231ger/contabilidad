using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace datos.Objetos
{
    public class Usuario : Base<int>
    {
        public string PrimerApellido { get; set; }
        public string SegundoApellido { get; set; }
        public string NombreUsuario { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public string Correo { get; set; }
        public string NumeroCelular { get; set; }

        public string HashContrasena { get; set; }
        
        [NotMapped]
        public ICollection<Rol> Roles { get; set; }
        [NotMapped]
        public ICollection<Especificacion> Especificaciones { get; set; }
    }
}
