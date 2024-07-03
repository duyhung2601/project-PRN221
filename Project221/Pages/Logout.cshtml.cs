using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Project221.Pages
{
    public class LogoutModel : PageModel
    {
        public IActionResult OnGet()
        {
            HttpContext.Session.Remove("type");
            HttpContext.Session.Remove("isAdmin");
            HttpContext.Session.Clear();
            return Redirect("Index");
        }
    }
}
