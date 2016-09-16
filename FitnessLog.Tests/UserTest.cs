using FitnessLog.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Xunit;

namespace FitnessLog.Tests
{
    public class UserTest
    {
        [Fact]
        public void GetAgeWeightandHeightTest()
        {
            var newUser = new ApplicationUser();

            var age = newUser.Age;
            var weight = newUser.Weight;
            var height = newUser.Height;

            Assert.Equal(26, age);
            Assert.Equal(188, weight);
            Assert.Equal(74, height);
        }
    }
}
