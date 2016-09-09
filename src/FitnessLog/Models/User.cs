 using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FitnessLog.Models
{
    [Table("Users")]
    public class User
    {
        [Key]
        public int UserId { get; set; }
        public string UserName { get; set; }
        public int Age { get; set; }
        public int Height { get; set; }
        public int Gender { get; set; }
        public int Weight { get; set; }
        public virtual ICollection<Entry> Log { get; set; }
    };
}
