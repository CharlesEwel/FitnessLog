using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Newtonsoft.Json;

namespace FitnessLog.Models
{
    [Table("Log")]
    public class Entry
    {
        [Key]
        public int EntryId { get; set; }
        public string UserId { get; set; }
        [JsonIgnore]
        public virtual ApplicationUser User { get; set; }
        public DateTime Date { get; set; }
        public string Description { get; set; }
        [JsonIgnore]
        public virtual ICollection<EntryExerciseJoin> EntryExerciseJoins { get; set; }
    }
}
