using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Project221.Models;

namespace Project221.Pages
{
    public class IndexModel : PageModel
    {
        private readonly ILogger<IndexModel> _logger;

        private readonly Project221.Models.ShopDBContext _context;
        public IndexModel(Project221.Models.ShopDBContext context)
        {
            _context = context;
        }
        public IList<Product> Product { get; set; } = default!;
        public void OnGet()
        {
            if (_context.Products != null)
            {
                Product =  _context.Products
                .Include(p => p.Category).Take(3).ToList();
            }
        }
    }
}