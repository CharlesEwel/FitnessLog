using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FitnessLog.Models.Repositories
{
    public class EFEntryRepository: IEntryRepository
    {
        FitnessLogDbContext db = new FitnessLogDbContext();
        public IQueryable<Entry> Log
        { get { return db.Log; } }

        public IQueryable<ApplicationUser> Users
        { get { return db.Users; } }

        public IQueryable<Exercise> Exercises
        { get { return db.Exercises; } }

        public Entry Save(Entry entry)
        {
            db.Log.Add(entry);
            db.SaveChanges();
            return entry;
        }

        public Entry Edit(Entry entry)
        {
            db.Entry(entry).State = EntityState.Modified;
            db.SaveChanges();
            return entry;
        }

        public void Remove(Entry entry)
        {
            db.Log.Remove(entry);
            db.SaveChanges();
        }

        public ApplicationUser Edit(ApplicationUser user)
        {
            db.Entry(user).State = EntityState.Modified;
            db.SaveChanges();
            return user;
        }

        public void Remove(ApplicationUser user)
        {
            db.Users.Remove(user);
            db.SaveChanges();
        }
        public void DeleteAll()
        {
            db.Dispose();
            db.SaveChanges();
        }
        public EFEntryRepository(FitnessLogDbContext connection = null)
        {
            if (connection == null)
            {
                this.db = new FitnessLogDbContext();
            }
            else
            {
                this.db = connection;
            }
        }
    }
}
