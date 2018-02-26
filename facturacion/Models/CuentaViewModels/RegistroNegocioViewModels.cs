using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace facturacion.Models
{
    public class RegistroNegocioViewModels
    {
        [Required]
        [DataType(DataType.EmailAddress)]
        public string Correo { get; set; }

        [Required]
        [DataType(DataType.PhoneNumber)]
        public int Telefono { get; set; }

        [Required]
        public string RFC { get; set; }

        /// <summary>
        /// Si es persona moral
        /// </summary>
        [Required]
        public string RazonSocial { get; set; }

        /// <summary>
        /// Si es persona fisica
        /// </summary>
        [Required]
        public string Nombre { get; set; }
    }
}
