using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace datos.Objetos
{
    public class Especificacion : Base<int>
    {
        public string Valor { get; set; }

        [NotMapped]
        public int IdUsuario { get; set; }
    }
}
