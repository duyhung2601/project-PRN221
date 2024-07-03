using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Project221.Models;

namespace Project221.Pages
{
    public class RateModel : PageModel
    {
        private readonly Project221.Models.ShopDBContext _context;
        private readonly IConfiguration Configuration;

        public RateModel(Project221.Models.ShopDBContext context, IConfiguration configuration)
        {
            _context = context;
            Configuration = configuration;
        }
        public IList<Category> Categories { get; set; } = default!;
        public string CategoryName { get; set; }

        public PaginatedList<Product> products { get; set; }

        [BindProperty(SupportsGet = true)]
        public List<string> selectedcate { get; set; } = new List<string>();
        public async Task OnGetAsync(int? pageIndex, List<string>? selectedcate)
        {
            Categories = await _context.Categories.ToListAsync();
            //IQueryable<Product> product =  _context.Products.Include(p => p.Category);
            IQueryable<Product> product = from s in _context.Products.Include(a => a.Category) select s;
            if (selectedcate != null && selectedcate.Any())
            {
                product = product.Where(s => selectedcate.Contains(s.CategoryId.ToString()));
            }
            //IQueryable<Product> pro = from s in _context.Products.Include(a => a.Category) select s;
            var pageSize = Configuration.GetValue("PageSize", 6);
            products = await PaginatedList<Product>.CreateAsync(
            product.AsNoTracking(), pageIndex ?? 1, pageSize);
        }
        public async Task OnPostAsync()
        {
            // Reload the page with the selected filters


        }
    }
}
