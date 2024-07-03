//using Microsoft.AspNetCore.Mvc;
//using Microsoft.AspNetCore.Mvc.RazorPages;
//using Newtonsoft.Json;
//using Project221.Models;

//namespace Project221.Pages
//{
//    public class AddtocartModel : PageModel
//    {
//        private readonly Project221.Models.ShopDBContext _context;

//        public AddtocartModel(Project221.Models.ShopDBContext context)
//        {
//            _context = context;
//        }
//        [ViewData]
//        public List<Product> list { get; set; }
//        [BindProperty] 
//        public List<CartItem> listProduct { get; set; }
//        public double totalPrice { get; set; }
//        public IActionResult OnGet()
//        {
//            var db = new ShopDBContext();
//            list = db.Products.ToList();
//            if (HttpContext.Session.GetString("type") == null)
//            {
//                return RedirectToPage("/Login");
//            }
//            else
//            {
//                if (HttpContext.Session.GetString("listCart") != null)
//                {
//                    string numbersJson = HttpContext.Session.GetString("listCart");
//                    listProduct = JsonConvert.DeserializeObject<List<CartItem>>(numbersJson);

//                    return Page();
//                }
//            }
//            return Page();
//        }
//        public void OnPostPay()
//        {
//            string id = Request.Form["id"];
//            string quantity = Request.Form["quantity"];
//            string price = Request.Form["price"];
//            string[] ArrayId = quantity.Split(',');
//            string[] ArrayQuantity = quantity.Split(',');
//            string[] ArrayPrice = price.Split(',');
//            totalPrice = totalOfPrice(ArrayPrice, ArrayQuantity);
//            Order order = addOrder(totalPrice);
//            for (int i = 0; i < ArrayQuantity.Length; i++)
//            {
//                if (int.Parse(ArrayQuantity[i]) > 0)
//                {
//                    addOrderDetail(int.Parse(ArrayId[i]), order.Id, double.Parse(ArrayPrice[i]), int.Parse(ArrayQuantity[i]));
//                }
//                else
//                {

//                }
//            }

//            HttpContext.Session.Remove("listCart");

//        }
//        public double totalOfPrice(string[] price, string[] quantity)
//        {
//            double total = 0;
//            for (int i = 0; i < quantity.Length; i++)
//            {
//                total += double.Parse(price[i]) * int.Parse(quantity[i]);
//            }
//            return total;
//        }
//        public void addOrderDetail(int productid, int orderId, double price, int quantity)
//        {
//            OrderDetail detail = new OrderDetail()
//            {
//                OrderId = orderId,
//                ProductId = productid,
//                Quantity = quantity,
//                PricePerUnit = price,
//            };
//            _context.OrderDetails.Add(detail);
//            _context.SaveChanges();
//        }

//        public Order addOrder(double totalPrice)
//        {

//            //string address = Request.Form["address"];
//            int personId = int.Parse(HttpContext.Session.GetString("type"));
//            Order order = new Order()
//            {
//                PersonId = personId,
//                OrderDate = DateTime.Now,
//                TotalAmount = totalPrice,
//                //Address = address
//            };
//            _context.Orders.Add(order);
//            _context.SaveChanges();
//            int max = _context.Orders.Max(a => a.Id);
//            order = _context.Orders.FirstOrDefault(a => a.Id == max);
//            return order;
//        }
//    }
//}
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Newtonsoft.Json;
using Project221.Models;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Project221.Pages
{
    public class AddtocartModel : PageModel
    {
        private readonly ShopDBContext _context;

        public AddtocartModel(ShopDBContext context)
        {
            _context = context;
        }

        [ViewData]
        public List<Product> list { get; set; }

        [BindProperty]
        public List<CartItem> listProduct { get; set; }

        public double totalPrice { get; set; }

        public IActionResult OnGet()
        {
            var db = new ShopDBContext();
            list = db.Products.ToList();
            if (HttpContext.Session.GetString("type") == null)
            {
                return RedirectToPage("/Login");
            }
            else
            {
                if (Request.Cookies["listCart"] != null)
                {
                    string numbersJson = Request.Cookies["listCart"];
                    listProduct = JsonConvert.DeserializeObject<List<CartItem>>(numbersJson);
                }
                return Page();
            }
        }

        public void OnPostPay()
        {
            string id = Request.Form["productId"];
            string quantity = Request.Form["quantity"];
            string price = Request.Form["price"];
            string[] ArrayId = id.Split(',');
            string[] ArrayQuantity = quantity.Split(',');
            string[] ArrayPrice = price.Split(',');
            totalPrice = TotalOfPrice(ArrayPrice, ArrayQuantity);
            Order order = AddOrder(totalPrice);
            for (int i = 0; i < ArrayQuantity.Length; i++)
            {
                if (int.Parse(ArrayQuantity[i]) > 0)
                {
                    AddOrderDetail(int.Parse(ArrayId[i]), order.Id, double.Parse(ArrayPrice[i]), int.Parse(ArrayQuantity[i]));
                }
            }

            Response.Cookies.Delete("listCart");

            
        }

        public double TotalOfPrice(string[] price, string[] quantity)
        {
            double total = 0;
            for (int i = 0; i < quantity.Length; i++)
            {
                total += double.Parse(price[i]) * int.Parse(quantity[i]);
            }
            return total;
        }

        public void AddOrderDetail(int productId, int orderId, double price, int quantity)
        {
            OrderDetail detail = new OrderDetail()
            {
                OrderId = orderId,
                ProductId = productId,
                Quantity = quantity,
                PricePerUnit = price,
            };
            _context.OrderDetails.Add(detail);
            _context.SaveChanges();
        }

        public Order AddOrder(double totalPrice)
        {
            int personId = int.Parse(HttpContext.Session.GetString("type"));
            Order order = new Order()
            {
                PersonId = personId,
                OrderDate = DateTime.Now,
                TotalAmount = totalPrice,
            };
            _context.Orders.Add(order);
            _context.SaveChanges();
            int max = _context.Orders.Max(a => a.Id);
            order = _context.Orders.FirstOrDefault(a => a.Id == max);
            return order;
        }
    }
}
