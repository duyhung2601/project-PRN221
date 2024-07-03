using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Project221.Models;

namespace Project221.Pages.Productts
{
    public class IndexModel : PageModel
    {
        private readonly Project221.Models.ShopDBContext _context;

        public IndexModel(Project221.Models.ShopDBContext context)
        {
            _context = context;
        }

        public IList<Product> Product { get;set; } = default!;

        public async Task OnGetAsync()
        {
            string role = HttpContext.Session.GetString("isAdmin");
            ViewData["role"] = role;
            if (role!= null)
            {
                if (_context.Products != null)
                {
                    Product = await _context.Products
                    .Include(p => p.Category).ToListAsync();
                }
            }
            else { Response.Redirect("/Login"); }
        }
    }
}
