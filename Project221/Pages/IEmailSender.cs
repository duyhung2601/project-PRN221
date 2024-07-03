namespace Project221.Pages
{
    public interface IEmailSender
    {
        Task SendEmailAsync(string email, string subject, int otp);
    }
}
