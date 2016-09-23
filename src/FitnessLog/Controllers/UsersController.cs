using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using FitnessLog.Models;
using FitnessLog.ViewModels;
using Microsoft.AspNetCore.Identity;

// For more information on enabling MVC for empty projects, visit http://go.microsoft.com/fwlink/?LinkID=397860

namespace FitnessLog.Controllers
{
    public class UsersController : Controller
    {
        private readonly FitnessLogDbContext _db;
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly SignInManager<ApplicationUser> _signInManager;
        public UsersController(UserManager<ApplicationUser> userManager, SignInManager<ApplicationUser> signInManager, FitnessLogDbContext db)
        {
            _userManager = userManager;
            _signInManager = signInManager;
            _db = db;
        }
        public IActionResult Index()
        {
            return View(_db.Users.ToList());
        }
        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Create(RegisterViewModel model)
        {
            var user = new ApplicationUser { UserName = model.Email, Age = model.Age, Height  =model.Height, Weight = model.Weight, Gender = model.Gender };
            IdentityResult result = await _userManager.CreateAsync(user, model.Password);
            if (result.Succeeded)
            {
                return RedirectToAction("Index");
            }
            else
            {
                return View();
            }
        }
        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> LogIn(string username, string password)
        {
            LoginViewModel model = new LoginViewModel { Email = username, Password = password };
            Microsoft.AspNetCore.Identity.SignInResult result = await _signInManager.PasswordSignInAsync(model.Email, model.Password, isPersistent: true, lockoutOnFailure: false);
            return Json(result);
        }
        [HttpPost]
        public async Task<IActionResult> LogOff()
        {
            await _signInManager.SignOutAsync();
            return RedirectToAction("Index");
        }
        public IActionResult Edit(string id)
        { 
            var thisUser = _db.Users.FirstOrDefault(users => users.Id == id);
            return View(thisUser);
        }

        [HttpPost]
        public IActionResult Edit(ApplicationUser user)
        {
            _db.Entry(user).State = EntityState.Modified;
            _db.SaveChanges();
            return RedirectToAction("Index");
        }
        public IActionResult Delete(string id)
        {
            var thisUser = _db.Users.FirstOrDefault(users => users.Id == id);
            return View(thisUser);
        }

        [HttpPost, ActionName("Delete")]
        public IActionResult DeleteConfirmed(string id)
        {
            var thisUser = _db.Users.FirstOrDefault(users => users.Id == id);
            _db.Users.Remove(thisUser);
            _db.SaveChanges();
            return RedirectToAction("Index");
        }
        public IActionResult Details(string id)
        {
            var thisUser = _db.Users.FirstOrDefault(users => users.Id == id);
            return View(thisUser);
        }
        public IActionResult Log(string id)
        {
            var thisUser = _db.Users.Include(user => user.Log).FirstOrDefault(users => users.Id == id);
            return View(thisUser);
        }
        public IActionResult CreateEntry(string id)
        {
            ViewBag.UserId = id;
            return View();
        }
        [HttpPost]
        public IActionResult CreateEntry(Entry entry)
        {
            _db.Log.Add(entry);
            _db.SaveChanges();
            return RedirectToAction("Log", new { id = entry.UserId });
        }
    }
}
