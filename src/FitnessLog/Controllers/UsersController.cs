using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using FitnessLog.Models;
using FitnessLog.ViewModels;
using Microsoft.AspNetCore.Identity;
using FitnessLog.Models.Repositories;
using System;
using System.Collections.Generic;

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
            ViewBag.GenderNames = new List<string> { "Male", "Female", "Non-Binary", "No Answer" };
            var thisUser = entryRepo.Users.FirstOrDefault(users => users.Id == id);
            return View(thisUser);
        }
        public async Task<IActionResult> Profile(string id)
        {
            ViewBag.GenderNames = new List<string> { "Male", "Female", "Non-Binary", "No Answer" };
            var thisUser = await _userManager.FindByNameAsync(User.Identity.Name);
            var userInfo = entryRepo.Users.Include(user => user.Log).ThenInclude(log => log.EntryExerciseJoins).FirstOrDefault(users => users.Id == thisUser.Id);
            List<Exercise> Exercises = entryRepo.Exercises.ToList();
            ViewBag.More = Exercises[0];
            ViewBag.Fewer = Exercises[12];
            Dictionary<Exercise, double> UserExerciseFrequencyArray = Exercises.ToDictionary(x => x, x => 0.0);
            int totalExercises = 0;
            foreach(var entry in userInfo.Log)
            {
                foreach(var join in entry.EntryExerciseJoins)
                {
                    UserExerciseFrequencyArray[join.Exercise] += 1;
                    totalExercises += 1;
                }
            }
            Dictionary<Exercise, double> normalizedFrequencies = new Dictionary<Exercise, double> { };
            foreach(KeyValuePair<Exercise, double> pair in UserExerciseFrequencyArray)
            {
                normalizedFrequencies.Add(pair.Key, 100*(pair.Value/totalExercises));
            }
            ViewBag.UserFrequencies = normalizedFrequencies;
            return View(thisUser);
        }
        public IActionResult Log(string id)
        {
            ViewBag.Exercises = entryRepo.Exercises.ToList();
            var thisUser = entryRepo.Users.Include(user => user.Log).ThenInclude(log => log.EntryExerciseJoins).FirstOrDefault(users => users.Id == id);
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
            return RedirectToAction("AddExercise", new { id = entry.EntryId });
        }
        public IActionResult AddExercise(int id)
        {
            ViewBag.Exercises = entryRepo.Exercises;
            ViewBag.EntryId = id;
            return View();
        }
        [HttpPost]
        public IActionResult AddExercise(int entryId, int exerciseId, int sets, int reps, int weight)
        {
            EntryExerciseJoin newJoin = new EntryExerciseJoin { EntryId = entryId, ExerciseId = exerciseId, Sets = sets, Reps = reps, Weight = weight };
            entryRepo.Save(newJoin);
            return Json(newJoin);
        }
        
        [HttpPost]
        public async Task<IActionResult> Search(string searchQuery)
        {
            Search newSearch = new Search(searchQuery);
            var result = await newSearch.Run();
            return Json(result);
        }
        [HttpPost]
        public IActionResult FindLogs(string userId, int gender, int age, int height, int weight)
        {
            var Userlist = entryRepo.Users.Include(user => user.Log).ThenInclude(log => log.EntryExerciseJoins).ToList();
            Dictionary<ApplicationUser, double> scoredUsers = new Dictionary<ApplicationUser, double>{};
            ApplicationUser userInfo = entryRepo.Users.Include(user => user.Log).ThenInclude(log => log.EntryExerciseJoins).FirstOrDefault(users => users.Id == userId);
            List<Exercise> Exercises = entryRepo.Exercises.ToList();
            Dictionary<Exercise, double> UserExerciseFrequencyArray = Exercises.ToDictionary(x => x, x => 0.0);
            int totalExercises = 0;
            foreach (var entry in userInfo.Log)
            {
                foreach (var join in entry.EntryExerciseJoins)
                {
                    UserExerciseFrequencyArray[join.Exercise] += 1;
                    totalExercises += 1;
                }
            }
            Dictionary<Exercise, double> normalizedFrequencies = new Dictionary<Exercise, double> { };
            foreach (KeyValuePair<Exercise, double> pair in UserExerciseFrequencyArray)
            {
                normalizedFrequencies.Add(pair.Key, 100 * (pair.Value / totalExercises));
            }
            foreach (ApplicationUser user in Userlist)
            {
                double differenceScore = 0;
                if(gender != user.Gender) { differenceScore += 30; };
                differenceScore += Math.Pow(height - user.Height, 2);
                differenceScore += Math.Pow((age - user.Age)/4, 2);
                differenceScore += Math.Pow((weight - user.Weight)/10, 2);
                if(userId != user.Id) { scoredUsers.Add(user, differenceScore); }
            }
            Dictionary<ApplicationUser, double> orderedUserDict = scoredUsers.OrderBy(x => x.Value).ToDictionary(x => x.Key, x => x.Value);
            List<Object> orderedUsers = new List<Object> { };
            int i = 0;
            Exercise DoMoreOfThese = Exercises[0];
            Exercise DoFewerOfThese = Exercises[1];
            double biggestFrequencyDeficit = 0;
            double biggestFrequencySurplus = 0;
            foreach (KeyValuePair<ApplicationUser, double> pair in orderedUserDict)
            {
                if (i < 3)
                {
                    Dictionary<Exercise, double> topUserExerciseFrequencyArray = Exercises.ToDictionary(x => x, x => 0.0);
                    int topTotalExercises = 0;
                    foreach (Entry entry in pair.Key.Log)
                    { 
                        foreach (EntryExerciseJoin join in entry.EntryExerciseJoins)
                        {
                            topUserExerciseFrequencyArray[join.Exercise] += 1;
                            topTotalExercises += 1;
                        }
                    }
                    Dictionary<Exercise, double> topNormalizedFrequencies = new Dictionary<Exercise, double> { };
                    foreach (KeyValuePair<Exercise, double> topPair in topUserExerciseFrequencyArray)
                    {
                        topNormalizedFrequencies.Add(topPair.Key, 100 * (topPair.Value / topTotalExercises));
                        double frequencyGap = normalizedFrequencies[topPair.Key] - topNormalizedFrequencies[topPair.Key];
                        if (frequencyGap > biggestFrequencySurplus)
                        {
                            biggestFrequencySurplus = frequencyGap;
                            DoFewerOfThese = topPair.Key;
                        }
                        if (frequencyGap < biggestFrequencyDeficit)
                        {
                            biggestFrequencyDeficit = frequencyGap;
                            DoMoreOfThese = topPair.Key;
                        }
                    }
                    orderedUsers.Add(pair.Key);
                }
                i++;
            }
            orderedUsers.Add(DoMoreOfThese);
            orderedUsers.Add(DoFewerOfThese);
            return Json(orderedUsers);
        }
    }
}
