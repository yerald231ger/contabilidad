using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace facturacion.Models
{
    public class RegistroViewModel
    {
        [Required]
        [EmailAddress]
        [Display(Name = "Correo")]
        public string Correo { get; set; }

        [Required]
        [RegularExpression(@"^(?=.*\d).{4,8}$", ErrorMessage = "La Contraseña debe de tener al menos 4 y un maximo de 8 caracteres con almenos un numerico")]
        [DataType(DataType.Password)]
        [Display(Name = "Contraseña")]
        public string Contrasena { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirmar Contraseña")]
        [Compare("Contrasena", ErrorMessage = "The password and confirmation password do not match.")]
        public string ConfirmarContrasena { get; set; }

        [Required]
        [Display(Name = "Nombre")]
        public string Nombre { get; set; }

        [Required]
        [Display(Name = "Primer Apellido")]
        public string PrimerApellido { get; set; }

        [Required]
        [Display(Name = "Segundo Apellido")]
        public string SegundoApellido { get; set; }

        [Required]
        [Display(Name = "Fecha Nacimiento")]
        [DataType(DataType.Date)]
        public DateTime FechaNacimiento { get; set; }

        [Display(Name = "Movil")]
        public string NumeroCelular { get; set; }
    }
}


