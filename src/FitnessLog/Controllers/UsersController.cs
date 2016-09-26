using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using FitnessLog.Models;
using FitnessLog.ViewModels;
using Microsoft.AspNetCore.Identity;
using FitnessLog.Models.Repositories;

// For more information on enabling MVC for empty projects, visit http://go.microsoft.com/fwlink/?LinkID=397860

namespace FitnessLog.Controllers
{
    public class UsersController : Controller
    {
        private IEntryRepository entryRepo;
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly SignInManager<ApplicationUser> _signInManager;
        
        public UsersController(UserManager<ApplicationUser> userManager, SignInManager<ApplicationUser> signInManager, IEntryRepository thisRepo = null)
        {
            _userManager = userManager;
            _signInManager = signInManager;
            if (thisRepo == null)
            {
                this.entryRepo = new EFEntryRepository();
            }
            else
            {
                this.entryRepo = thisRepo;
            }
        }
        public IActionResult Index()
        {
            return View(entryRepo.Users.ToList());
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
            if (result.Succeeded)
            {
                return Json(model);
            }
            else
            {
                LoginViewModel failmodel = new LoginViewModel { Email = "fail", Password = password };
                return Json(failmodel);
            }
            
        }
        [HttpPost]
        public async Task<IActionResult> LogOff()
        {
            await _signInManager.SignOutAsync();
            return RedirectToAction("Index");
        }
        public IActionResult Edit(string id)
        { 
            var thisUser = entryRepo.Users.FirstOrDefault(users => users.Id == id);
            return View(thisUser);
        }

        [HttpPost]
        public IActionResult Edit(ApplicationUser user)
        {
            entryRepo.Edit(user);
            return RedirectToAction("Index");
        }
        public IActionResult Delete(string id)
        {
            var thisUser = entryRepo.Users.FirstOrDefault(users => users.Id == id);
            return View(thisUser);
        }

        [HttpPost, ActionName("Delete")]
        public IActionResult DeleteConfirmed(string id)
        {
            var thisUser = entryRepo.Users.FirstOrDefault(users => users.Id == id);
            entryRepo.Remove(thisUser);
            return RedirectToAction("Index");
        }
        public IActionResult Details(string id)
        {
            var thisUser = entryRepo.Users.FirstOrDefault(users => users.Id == id);
            return View(thisUser);
        }
        public IActionResult Log(string id)
        {
            var thisUser = entryRepo.Users.Include(user => user.Log).FirstOrDefault(users => users.Id == id);
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
            entryRepo.Save(entry);
            return RedirectToAction("Log", new { id = entry.UserId });
        }
    }
}
