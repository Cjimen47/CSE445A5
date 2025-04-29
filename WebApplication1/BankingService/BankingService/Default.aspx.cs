using System;
using System.Web;

namespace BankingService
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if user is already logged in as Member
            if (Session["MemberAuthenticated"] != null && (bool)Session["MemberAuthenticated"])
            {
                Response.Redirect("Member.aspx");
            }

            // Check if user is already logged in as Staff
            if (Session["StaffAuthenticated"] != null && (bool)Session["StaffAuthenticated"])
            {
                Response.Redirect("Staff.aspx");
            }
        }

        protected void btnMember_Click(object sender, EventArgs e)
        {
            // Redirect to Member login page
            Response.Redirect("Login.aspx?type=member");
        }

        protected void btnStaff_Click(object sender, EventArgs e)
        {
            // Redirect to Staff login page
            Response.Redirect("Login.aspx?type=staff");
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            // Redirect to Sign Up page
            Response.Redirect("SignUp.aspx");
        }

        protected void btnTestHash_Click(object sender, EventArgs e)
        {
            // Redirect to the Hash Test page
            Response.Redirect("TestHash.aspx");
        }

        protected void btnTestLogin_Click(object sender, EventArgs e)
        {
            // Redirect to the Login Control Test page
            Response.Redirect("TestLoginControl.aspx");
        }

        protected void btnTestInterest_Click(object sender, EventArgs e)
        {
            // Redirect to the Interest Calculator Test page
            Response.Redirect("TestInterestCalculator.aspx");
        }
    }
}