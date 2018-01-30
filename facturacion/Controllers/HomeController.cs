using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using facturacion.Models;
using servicios.interfaces;

namespace facturacion.Controllers
{
    public class HomeController : Controller
    {
        IRepoUsuarios _repoUsuarios;

        public HomeController(IRepoUsuarios repoUsuarios)
        {
            this._repoUsuarios = repoUsuarios;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult About()
        {
            ViewData["Message"] = "Your application description page.";

            return View();
        }

        public IActionResult Contact()
        {
            ViewData["Message"] = "Your contact page.";

            return View();
        }

        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
