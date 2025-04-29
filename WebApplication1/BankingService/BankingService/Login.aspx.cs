using System;

namespace BankingService
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check for the login type parameter
                string loginType = Request.QueryString["type"];

                if (!string.IsNullOrEmpty(loginType))
                {
                    // Set the login type on the control
                    if (loginType.ToLower() == "staff")
                    {
                        bankLogin.LoginType = "Staff";
                    }
                    else
                    {
                        bankLogin.LoginType = "Member";
                    }
                }
            }
        }

        protected void bankLogin_LoginSuccessful(object sender, LoginEventArgs e)
        {
            // Redirect based on the user type
            if (e.UserType.ToLower() == "member")
            {
                Response.Redirect("Member.aspx");
            }
            else if (e.UserType.ToLower() == "staff")
            {
                Response.Redirect("Staff.aspx");
            }
        }
    }
}