using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Newtonsoft.Json;

namespace FitnessLog.Models
{
    [Table("Users")]
    public class ApplicationUser : IdentityUser
    {
        public int Age { get; set; }
        public int Height { get; set; }
        public int Gender { get; set; }
        public int Weight { get; set; }
        [JsonIgnore]
        public virtual ICollection<Entry> Log { get; set; }
    };
}
