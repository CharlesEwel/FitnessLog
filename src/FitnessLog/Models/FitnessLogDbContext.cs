using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace FitnessLog.Models
{
    public class FitnessLogDbContext: DbContext
    {
        public DbSet<User> Users { get; set; }
        public DbSet<Entry> Log { get; set; }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);
        }
        protected override void OnConfiguring(DbContextOptionsBuilder options)
        {
            options.UseSqlServer(@"Server=(localdb)\mssqllocaldb;Database=FitnessLog;integrated security=True");
        }
    }
}
    
