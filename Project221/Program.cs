using Microsoft.EntityFrameworkCore;
using Project221.Models;
using Project221.Pages;

var builder = WebApplication.CreateBuilder(args);

//Bo sung service cua ung dung vao Web Container
builder.Services.AddRazorPages();
builder.Services.AddSession();
//Bo sung doi tuong DBContext su dung chung toan project
builder.Services.AddDbContext<ShopDBContext>(opt =>
    opt.UseSqlServer(builder.Configuration.GetConnectionString("MyCnn")));
builder.Services.AddSignalR();
builder.Services.AddTransient<IEmailSender,EmailSender>();
var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();
app.UseSession();
app.MapRazorPages();

app.MapRazorPages();

app.Run();
