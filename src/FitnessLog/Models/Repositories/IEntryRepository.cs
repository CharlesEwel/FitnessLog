using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FitnessLog.Models.Repositories
{
    public interface IEntryRepository
    {
        IQueryable<Entry> Log { get; }
        IQueryable<ApplicationUser> Users { get; }

        IQueryable<Exercise> Exercises { get; }
        IQueryable<EntryExerciseJoin> EntryExerciseJoins { get; }
        EntryExerciseJoin Save(EntryExerciseJoin entryExerciseJoin);
        Entry Save(Entry entry);
        Entry Edit(Entry entry);
        void Remove(Entry entry);
        ApplicationUser Edit(ApplicationUser user);
        void Remove(ApplicationUser user);
    }
}
