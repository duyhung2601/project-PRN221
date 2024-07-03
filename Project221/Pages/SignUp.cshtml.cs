using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Project221.Models;
using System;

namespace Project221.Pages
{
    public class SignUpModel : PageModel
    {
        public string Notification { get; set; }
        public string userError { get; set; }
        public string repassError { get; set; }
        private readonly ShopDBContext _context;
        public Person person { get; set; }
        public SignUpModel(ShopDBContext context)
        {
            _context = context;
        }
        public void OnGet()
        {
        }
        public IActionResult OnPost()
        {
            // Xử lý logic đăng ký ở đây
            string name = HttpContext.Request.Form["name"];
            string email = HttpContext.Request.Form["email1"];
            string password = HttpContext.Request.Form["password1"];
            string repassword = HttpContext.Request.Form["repassword"];
            if (email == null || password == null || repassword == null || name == null)
            {
                Notification = "You must enter all input cells";
                return Page();
            }
            if (password != repassword)
            {
                repassError = "Re-password must be equal than password, please re-enter";
                return Page();
            }
            if (!checkUsername(email))
            {
                userError = "Email is exist, please re-enter";
                return Page();
            }
            int max_id = 0;
            if (_context.People.Count() > 0)
            {
                max_id = _context.People.Max(a => a.Id);
            }
            // Ví dụ: Tạo một đối tượng Person mới và thêm vào cơ sở dữ liệu
            person = new Person { FullName = name, Email = email, Password = password, Role = 0 ,Otpcheck=false};
            _context.People.Add(person);
            _context.SaveChanges();

            // Sau khi đăng ký, bạn có thể thực hiện hành động khác như chuyển hướng đến trang đăng nhập hoặc thực hiện đăng nhập tự động
            var checkOTPModel = new CheckOTPModel(_context, new EmailSender());
            TempData["email1"] = email;
            //checkOTPModel.OnGetAsync();
            checkOTPModel.SendOTPAsync(email);
            return Redirect("/CheckOTP");
            // gop 2 ham la 1 
            //check dupplicate 
        }
        public bool checkUsername(string email)
        {
            Person acount = _context.People.SingleOrDefault(a => a.Email == email);
            if (acount != null)
            {
                return false;
            }
            else
            {
                return true;
            }
        }
    }
}
