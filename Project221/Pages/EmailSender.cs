using System.Net.Mail;
using System.Net;

namespace Project221.Pages
{
    public class EmailSender : IEmailSender
    {
        public static int OTP { get; private set; }

        public Task SendEmailAsync(string email, string subject, int otp)
        {
            string body = "Your OTP code is: " + otp.ToString();
            var mail = "chanvoi2006@gmail.com";
            var pw = "pczs jnzz ifru xvkd";
            var client = new SmtpClient("smtp.gmail.com", 587)
            {
                EnableSsl = true,
                Credentials = new NetworkCredential(mail, pw)
            };
            return client.SendMailAsync(new MailMessage(from: mail, to: email, subject, body));
        }

        public static int GenerateOTP()
        {
            int otp;
            Random rnd = new Random();
            otp = rnd.Next(10000, 100000);
            OTP = otp;
            return otp;
        }
    }
}
