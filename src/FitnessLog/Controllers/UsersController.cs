using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using FitnessLog.Models;

// For more information on enabling MVC for empty projects, visit http://go.microsoft.com/fwlink/?LinkID=397860

namespace FitnessLog.Controllers
{
    public class UsersController : Controller
    {
        private FitnessLogDbContext db = new FitnessLogDbContext();
        public IActionResult Index()
        {
            return View(db.Users.ToList());
        }
        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Create(User user)
        {
            db.Users.Add(user);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public IActionResult Edit(int id)
        {
            var thisUser = db.Users.FirstOrDefault(users => users.UserId == id);
            return View(thisUser);
        }

        [HttpPost]
        public IActionResult Edit(User user)
        {
            db.Entry(user).State = EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public IActionResult Delete(int id)
        {
            var thisUser = db.Users.FirstOrDefault(users => users.UserId == id);
            return View(thisUser);
        }

        [HttpPost, ActionName("Delete")]
        public IActionResult DeleteConfirmed(int id)
        {
            var thisUser = db.Users.FirstOrDefault(users => users.UserId == id);
            db.Users.Remove(thisUser);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public IActionResult Log(int id)
        {
            var thisUser = db.Users.Include(users => users.Log).FirstOrDefault(users => users.UserId == id);
            return View(thisUser);
        }
        public IActionResult CreateEntry(int id)
        {
            ViewBag.UserId = id;
            return View();
        }
        [HttpPost]
        public IActionResult CreateEntry(Entry entry)
        {
            db.Log.Add(entry);
            db.SaveChanges();
            return RedirectToAction("Log", new { id = entry.UserId });
        }
    }
}
