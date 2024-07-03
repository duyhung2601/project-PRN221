using System;
using System.Collections.Generic;

namespace Project221.Models
{
    public partial class Order
    {
        public Order()
        {
            OrderDetails = new HashSet<OrderDetail>();
        }

        public int Id { get; set; }
        public int PersonId { get; set; }
        public DateTime OrderDate { get; set; }
        public double TotalAmount { get; set; }
        public string Address { get; set; } = "";

        public virtual Person Person { get; set; } 
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
    }
}
