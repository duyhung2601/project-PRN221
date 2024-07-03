//using Microsoft.AspNetCore.Http;
//using Microsoft.AspNetCore.Mvc;
//using Microsoft.AspNetCore.Mvc.RazorPages;
//using Microsoft.EntityFrameworkCore;
//using Newtonsoft.Json;
//using Project221.Models;

//namespace Project221.Pages
//{
//    public class ProductDetailModel : PageModel
//    {
//        private readonly ShopDBContext _context;
//        public ProductDetailModel(ShopDBContext context)
//        {
//            _context = context;
//        }

//        public Product product { get; set; }
//        [BindProperty]
//        public int Quantity { get; set; }
//        public async Task<IActionResult> OnGetAsync(int? productId)
//        {
//            if (productId == null)
//            {
//                return Redirect("Index");
//            }
//            else
//            {
//                product = _context.Products.Include(c => c.Category).FirstOrDefault(a => a.Id == productId);
//                return Page();
//            }
//        }

//        public void OnPostAddCart(int id, int quantity)
//        {
//            List<CartItem> numbers = new List<CartItem>();
//            if (HttpContext.Session.GetString("listCart") != null)
//            {
//                string numbersJson = HttpContext.Session.GetString("listCart");
//                numbers = JsonConvert.DeserializeObject<List<CartItem>>(numbersJson);
//            }
//            CartItem cartItem = new CartItem
//            {
//                product = _context.Products.FirstOrDefault(a => a.Id == id),
//                quantity = quantity,
//            };
//            int check = 0;
//            foreach (var a in numbers)
//            {
//                if (id == a.product.Id)
//                {
//                    a.quantity += quantity;
//                    check = 1;
//                }
//            }
//            if (check == 0)
//            {
//                numbers.Add(cartItem);

//            }
//            HttpContext.Session.SetString("quantityCart", numbers.Count.ToString());
//            string numbersJson1 = JsonConvert.SerializeObject(numbers);
//            HttpContext.Session.SetString("listCart", numbersJson1);
//            ViewData["productId"] = "Add product with id " + id + " to cart successfully";
//            OnGetAsync(id);
//        }
//    }
//}
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using Project221.Models;
using System;
using System.Collections.Generic;

namespace Project221.Pages
{
    public class ProductDetailModel : PageModel
    {
        private readonly ShopDBContext _context;
        public ProductDetailModel(ShopDBContext context)
        {
            _context = context;
        }

        public Product product { get; set; }
        [BindProperty]
        public int Quantity { get; set; }

        public async Task<IActionResult> OnGetAsync(int? productId)
        {
            if (productId == null)
            {
                return Redirect("Index");
            }
            else
            {
                product = await _context.Products.Include(c => c.Category).FirstOrDefaultAsync(a => a.Id == productId);
                return Page();
            }
        }

        public IActionResult OnPostAddCart(int id, int quantity)
        {
            //int quantitycart = 0;
            List<CartItem> cartItems = new List<CartItem>();
            var existingCartItems = HttpContext.Request.Cookies["listCart"];
            if (existingCartItems != null)
            {
                cartItems = JsonConvert.DeserializeObject<List<CartItem>>(existingCartItems);
            }
            CartItem cartItem = new CartItem
            {
                product = _context.Products.FirstOrDefault(a => a.Id == id),
                quantity = quantity,
            };
            int check = 0;
            foreach (var item in cartItems)
            {
                if (id == item.product.Id)
                {
                    item.quantity += quantity;
                    check = 1;
                }
            }
            if (check == 0)
            {
                cartItems.Add(cartItem);
            }
            var options = new CookieOptions
            {
                Expires = DateTime.Now.AddDays(1) // Set the cookie expiration time
            };
            HttpContext.Response.Cookies.Append("quantityCart", cartItems.Count.ToString(), new CookieOptions
            {
                Expires = DateTime.Now.AddDays(1) // Th?i gian h?t h?n c?a cookie (ví d?: 1 ngày)
            });
            string cartItemsJson = JsonConvert.SerializeObject(cartItems);
            HttpContext.Response.Cookies.Append("listCart", cartItemsJson, options);
            ViewData["productId"] = "Add product with id " + id + " to cart successfully";
            //quantitycart = cartItems.Count;
            //HttpContext.Session.SetInt32("quantitycart", quantitycart);
            return RedirectToPage("/ProductDetail", new { productId = id });

        }
    }
}
