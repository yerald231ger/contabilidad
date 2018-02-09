using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Threading.Tasks;
using datos.Objetos;
using facturacion.Models;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using servicios.interfaces;
using servicios.Utils;

namespace facturacion.Controllers
{
    public class CuentaController : Controller
    {
        private readonly ILogger _logger;
        private readonly IRepoUsuarios _repoUsuario;

        public CuentaController(ILogger<CuentaController> logger, IRepoUsuarios repoUsuarios)
        {
            _logger = logger;
            _repoUsuario = repoUsuarios;
        }

        public IActionResult Registro(string returnUrl = null)
        {
            ViewData["ReturnUrl"] = returnUrl;
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Registro(RegistroViewModel model, string returnUrl = null)
        {
            ViewData["ReturnUrl"] = returnUrl;
            if (ModelState.IsValid)
            {
                if(_repoUsuario.EstaDisponible(model.Correo))
                {
                    ModelState.AddModelError(string.Empty, "Correo no disponible");
                    return View(model);
                }   

                var usuario = _repoUsuario.Create(new Usuario
                {
                    Nombre = model.Nombre,
                    PrimerApellido = model.PrimerApellido,
                    SegundoApellido = model.SegundoApellido,
                    NumeroCelular = model.NumeroCelular,
                    NombreUsuario = model.Correo,
                    Correo = model.Correo,
                    HashContrasena = HashString.Encrypt(model.Contrasena),
                    FechaNacimiento = model.FechaNacimiento
                });


                if (usuario.Id <= 0)
                {
                    ModelState.AddModelError(string.Empty, "Error al generar el usuario");
                    return View(model);
                }

                return RedirectToLocal(returnUrl);
            }

            return View(model);
        }

        private IActionResult RedirectToLocal(string returnUrl)
        {
            if (Url.IsLocalUrl(returnUrl))
            {
                return Redirect(returnUrl);
            }
            else
            {
                return RedirectToAction(nameof(HomeController.Index), "Home");
            }
        }

        private async Task<Usuario> AuthenticateUser(string email, string password)
        {
            // For demonstration purposes, authenticate a user
            // with a static email address. Ignore the password.
            // Assume that checking the database takes 500ms

            await Task.Delay(500);

            if (email == "maria.rodriguez@contoso.com")
            {
                return new Usuario()
                {
                    Correo = "maria.rodriguez@contoso.com",
                    Nombre = "Maria Rodriguez"
                };
            }
            else
            {
                return null;
            }
        }

        public IActionResult LogIn(string returnUrl = null)
        {
            ViewData["ReturnUrl"] = returnUrl;
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> LogIn(LogInViewModel model, string returnUrl = null)
        {
            ViewData["ReturnUrl"] = returnUrl;
            if (ModelState.IsValid)
            {
                string hashModel = HashString.Encrypt(model.Contrasena);
                string hashBd = _repoUsuario.ObtenerHash(model.Cuenta);

                if (hashModel.Equals(hashBd))
                {
                    var usuario = _repoUsuario.LeerUsuario(model.Cuenta);

                    #region snippet1
                    var claims = new List<Claim>
                    {
                        new Claim(ClaimTypes.Name, usuario.Correo),
                        new Claim("FullName", usuario.ToString())
                    };

                    foreach (var claim in usuario.Especificaciones)
                    {
                        claims.Add(new Claim(claim.Nombre, claim.Valor));
                    }

                    foreach (var rol in usuario.Roles)
                    {
                        claims.Add(new Claim(ClaimTypes.Role, rol.Nombre));
                    }

                    var claimsIdentity = new ClaimsIdentity(
                        claims, CookieAuthenticationDefaults.AuthenticationScheme);

                    var authProperties = new AuthenticationProperties
                    {
                        //AllowRefresh = <bool>,
                        // Refreshing the authentication session should be allowed.

                        //ExpiresUtc = DateTimeOffset.UtcNow.AddMinutes(10),
                        // The time at which the authentication ticket expires. A 
                        // value set here overrides the ExpireTimeSpan option of 
                        // CookieAuthenticationOptions set with AddCookie.

                        IsPersistent = true
                        // Whether the authentication session is persisted across 
                        // multiple requests. Required when setting the 
                        // ExpireTimeSpan option of CookieAuthenticationOptions 
                        // set with AddCookie. Also required when setting 
                        // ExpiresUtc.

                        //IssuedUtc = <DateTimeOffset>,
                        // The time at which the authentication ticket was issued.

                        //RedirectUri = <string>
                        // The full path or absolute URI to be used as an http 
                        // redirect response value.
                    };

                    await HttpContext.SignInAsync(
                        CookieAuthenticationDefaults.AuthenticationScheme,
                        new ClaimsPrincipal(claimsIdentity),
                        authProperties);
                    #endregion
                }
                else
                {
                    ModelState.AddModelError(string.Empty, "Usuario o contraseña incorrectos");
                    return View(model);
                }
            }
            return View();
        }

        // GET: Cuenta
        public ActionResult Index()
        {
            return View();
        }

        // GET: Cuenta/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Cuenta/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Cuenta/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(IFormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: Cuenta/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Cuenta/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, IFormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: Cuenta/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Cuenta/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
    }
}