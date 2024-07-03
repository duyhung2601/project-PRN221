using System;
using System.Collections.Generic;

namespace Project221.Models
{
    public partial class Product
    {
        public Product()
        {
            OrderDetails = new HashSet<OrderDetail>();
            Rates = new HashSet<Rate>();
        }

        public int Id { get; set; }
        public int CategoryId { get; set; }
        public string? ProductImage { get; set; }
        public string ProductName { get; set; } = null!;
        public double Price { get; set; }
        public string? Description { get; set; }
        public int UnitInStock { get; set; }

        public virtual Category Category { get; set; } = null!;
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
        public virtual ICollection<Rate> Rates { get; set; }
    }
}
