﻿using System;
using System.Collections.Generic;

namespace Project221.Models
{
    public partial class Category
    {
        public Category()
        {
            Products = new HashSet<Product>();
        }

        public int Id { get; set; }
        public string CategoryName { get; set; } = null!;

        public virtual ICollection<Product> Products { get; set; }
    }
}
