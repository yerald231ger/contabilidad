using System;
using System.Collections.Generic;
using System.Text;

namespace datos.Objetos
{
    public class Base<TKey> : Identidad<TKey>
    {
        public string Nombre { get; set; }
        public DateTime FechaAlta { get; set; }
        public DateTime FechaModificacion { get; set; }
        public bool EsActivo { get; set; }
    }

    public class Identidad<TKey>
    {
        public TKey Id { get; set; }
    }
}
