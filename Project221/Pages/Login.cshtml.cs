using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Project221.Models;
using System.Net;
using System.Net.Mail;

namespace Project221.Pages
{
    public class LoginModel : PageModel
    {
        public string Notification { get; set; }
        public string userError { get; set; }
        public string repassError { get; set; }
        private readonly ShopDBContext _context;
        public int id {get;set; }
        public LoginModel(ShopDBContext context)
        {
            _context = context;
        }
        public Person person { get; set; }
        public IActionResult OnPost()
        {

            string email = HttpContext.Request.Form["email"];
            string password = HttpContext.Request.Form["password"];
            person = _context.People.SingleOrDefault(a => a.Email.Equals(email) && a.Password.Equals(password));
            
                if (person != null)
                {
                if (person.Otpcheck == true)
                {
                    HttpContext.Session.SetString("name12", person.FullName.ToString());
                    //id = person.Id;
                    HttpContext.Session.SetString("type", person.Id.ToString());
                    var a = HttpContext.Session.GetString("type");
                    if (person.Role == 1)
                    {
                        HttpContext.Session.SetString("isAdmin", person.Role.ToString());
                    }
                    return Redirect("Index");
                }
                else
                {
                    return Page();
                } 
            }
            else { return RedirectToPage("/SignUp"); }
            //lay id o ben login gui sang ben cart để hiển thị thông tin người dùng 
        }

    }
}
