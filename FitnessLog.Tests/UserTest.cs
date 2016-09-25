using FitnessLog.Controllers;
using FitnessLog.Models;
using FitnessLog.Models.Repositories;
using FitnessLog.ViewModels;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Xunit;

namespace FitnessLog.Tests
{
    public class UserTest
    {
        EFEntryRepository db = new EFEntryRepository(new TestDbContext());
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly SignInManager<ApplicationUser> _signInManager;
        //public void Teardown()
        //{
        //    db.DeleteAll();
        //}
        [Fact]
        public void GetAgeWeightandHeightTest()
        {
            var newUser = new ApplicationUser { Age = 26, Weight = 188, Height = 74 };

            var age = newUser.Age;
            var weight = newUser.Weight;
            var height = newUser.Height;

            Assert.Equal(26, age);
            Assert.Equal(188, weight);
            Assert.Equal(74, height);
        }
        [Fact]
        public void DB_CreateNewUser_Test()
        {
            // Arrange
            UsersController controller = new UsersController(_userManager, _signInManager, db);
            RegisterViewModel newUserRegistration = new RegisterViewModel { Email = "test@test.com", Password = "F92gh67Z?", ConfirmPassword = "F92gh67Z?", Age = 26, Weight = 196, Height = 74 };

            // Act
           controller.Create(newUserRegistration);
            var collection = (controller.Index() as ViewResult).ViewData.Model as IEnumerable<ApplicationUser>;

            // Assert
            Assert.Empty(collection);
        }
    }
}
