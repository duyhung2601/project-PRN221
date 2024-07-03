using System;
using System.Collections.Generic;

namespace Project221.Models
{
    public partial class Rate
    {
        public int Id { get; set; }
        public int ProductId { get; set; }
        public int PersonId { get; set; }
        public string? Comment { get; set; }
        public int RateStar { get; set; }
        public TimeSpan Time { get; set; }

        public virtual Person Person { get; set; } = null!;
        public virtual Product Product { get; set; } = null!;
    }
}
