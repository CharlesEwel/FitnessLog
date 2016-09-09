using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FitnessLog.Models
{
    [Table("Exercises")]
    public class Exercise
    {
        [Key]
        public int ExerciseId { get; set; }
        public string Name { get; set; }
        public string Category { get; set; }
    }
}
