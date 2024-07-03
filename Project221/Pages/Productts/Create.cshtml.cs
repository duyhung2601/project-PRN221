using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.SignalR;
using Project221.Models;

namespace Project221.Pages.Productts
{
    public class CreateModel : PageModel
    {
        private readonly Project221.Models.ShopDBContext _context;

        


        public CreateModel(Project221.Models.ShopDBContext context)
        {
            _context = context;
            
        }
        [BindProperty]
        public Product Product { get; set; } = default!;
        [BindProperty]
        public IFormFile ProductImageFile { get; set; }

        public IActionResult OnGet()
        {
            ViewData["CategoryId"] = new SelectList(_context.Categories, "Id", "CategoryName");
            return Page();
        }




        // To protect from overposting attacks, see https://aka.ms/RazorPagesCRUD
        public async Task<IActionResult> OnPostAsync()
        {
            if (Product == null)
            {
                return BadRequest();
            }
            IFormFile a = ProductImageFile;
            if (ProductImageFile != null && ProductImageFile.Length > 0)
            {
                var fileName = Path.GetFileName(ProductImageFile.FileName);
                var filePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/ImgPRN", fileName);

                using (var stream = new FileStream(filePath, FileMode.Create))
                {
                    await ProductImageFile.CopyToAsync(stream);
                }

                Product.ProductImage = fileName;
            }

            _context.Products.Add(Product);
            await _context.SaveChangesAsync();
            

            return RedirectToPage("./Index");
        }
    }
}
