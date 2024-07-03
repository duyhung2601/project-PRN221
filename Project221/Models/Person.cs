using System;
using System.Collections.Generic;

namespace Project221.Models
{
    public partial class Person
    {
        public Person()
        {
            Orders = new HashSet<Order>();
            Rates = new HashSet<Rate>();
        }

        public int Id { get; set; }
        public string FullName { get; set; } = null!;
        public bool? Gender { get; set; }
        public string Email { get; set; } = null!;
        public string Password { get; set; } = null!;
        public int Role { get; set; }
        public bool? Otpcheck { get; set; }

        public virtual ICollection<Order> Orders { get; set; }
        public virtual ICollection<Rate> Rates { get; set; }
    }
}
