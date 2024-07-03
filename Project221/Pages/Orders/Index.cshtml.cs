using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Project221.Models;

namespace Project221.Pages.Orders
{
    public class IndexModel : PageModel
    {
        private readonly Project221.Models.ShopDBContext _context;

        public IndexModel(Project221.Models.ShopDBContext context)
        {
            _context = context;
        }

        public IList<Order> Order { get;set; } = default!;

        public async Task OnGetAsync()
        {
            if (_context.Orders != null)
            {
                Order = await _context.Orders
                .Include(o => o.Person).ToListAsync();
            }
        }
    }
}
