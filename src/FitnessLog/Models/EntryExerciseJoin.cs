using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Newtonsoft.Json;

namespace FitnessLog.Models
{
    
    public class EntryExerciseJoin
    {
        [Key]
        public int JoinId { get; set; }
        public int EntryId { get; set; }
        [JsonIgnore]
        public virtual Entry Entry { get; set; }
        public int ExerciseId { get; set; }
        [JsonIgnore]
        public virtual Exercise Exercise { get; set; }
        public int Sets { get; set; }
        public int Reps { get; set; }
        public int Weight { get; set; }
    }
}
