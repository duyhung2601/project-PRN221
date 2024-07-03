using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Project221.Models;

namespace Project221.Pages
{
    public class CheckOTPModel : PageModel
    {
        
        private readonly ShopDBContext _context;
        private readonly IEmailSender _emailSender;

        public CheckOTPModel(ShopDBContext context, IEmailSender emailSender)
        {
            _context = context;
            _emailSender = emailSender;
        }

        public async Task<IActionResult> OnPost()
        {
            string otp1 = HttpContext?.Request?.Form["otp1"];
            int otp2 = EmailSender.OTP;
            string email1 = TempData["email1"] as string;

            if (!string.IsNullOrEmpty(otp1) && otp1.Equals(otp2.ToString()))
            {
                var person = _context.People.FirstOrDefault(p => p.Email == email1);
                if (person != null)
                {
                    person.Otpcheck = true;
                    
                    _context.SaveChanges();
                }
                return Redirect("/Login");
            }
            else { return Redirect("/SignUp"); }
           
        }

        public async Task SendOTPAsync(string email)
        {
            var subject = "Hệ thống gửi mã OTP";
            int otp = EmailSender.GenerateOTP();
            await _emailSender.SendEmailAsync(email, subject, otp);
        }
    }
}
