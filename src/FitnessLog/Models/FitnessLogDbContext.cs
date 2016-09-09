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

        public FitnessLogDbContext(DbContextOptions<FitnessLogDbContext> options)
        : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);
        }
    }
}
    
