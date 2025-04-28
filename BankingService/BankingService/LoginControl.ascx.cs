// LoginControl.ascx.cs
using System;
using System.Web;
using System.Web.UI;
using System.Xml;
using BankingSecurityLibrary;

namespace BankingService
{
    public partial class LoginControl : System.Web.UI.UserControl
    {
        // Property to set login type (Member or Staff)
        private string _loginType = "Member";
        public string LoginType
        {
            get { return _loginType; }
            set
            {
                _loginType = value;
                lblLoginType.Text = value;
            }
        }

        // Event that fires when login is successful
        public event EventHandler<LoginEventArgs> LoginSuccessful;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set login type label
                lblLoginType.Text = LoginType;

                // Check if there's a cookie with the username
                HttpCookie userCookie = Request.Cookies["BankUserName"];
                if (userCookie != null)
                {
                    txtUsername.Text = userCookie.Value;
                    chkRememberMe.Checked = true;
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text;

            if (ValidateUser(username, password))
            {
                // Save username in cookie if Remember Me is checked
                if (chkRememberMe.Checked)
                {
                    HttpCookie userCookie = new HttpCookie("BankUserName", username);
                    userCookie.Expires = DateTime.Now.AddDays(30); // Cookie expires in 30 days
                    Response.Cookies.Add(userCookie);
                }
                else
                {
                    // Remove the cookie if it exists
                    if (Request.Cookies["BankUserName"] != null)
                    {
                        HttpCookie userCookie = new HttpCookie("BankUserName");
                        userCookie.Expires = DateTime.Now.AddDays(-1); // Expire the cookie
                        Response.Cookies.Add(userCookie);
                    }
                }

                // Set session variables
                if (LoginType.ToLower() == "member")
                {
                    Session["MemberAuthenticated"] = true;
                    Session["MemberUsername"] = username;
                }
                else if (LoginType.ToLower() == "staff")
                {
                    Session["StaffAuthenticated"] = true;
                    Session["StaffUsername"] = username;
                }

                // Fire the LoginSuccessful event
                LoginSuccessful?.Invoke(this, new LoginEventArgs(username, LoginType));
            }
            else
            {
                lblMessage.Text = "Invalid username or password. Please try again.";
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            // Clear form fields and redirect to Default page
            txtUsername.Text = string.Empty;
            txtPassword.Text = string.Empty;
            lblMessage.Text = string.Empty;

            Response.Redirect("Default.aspx");
        }

        private bool ValidateUser(string username, string password)
        {
            try
            {
                // Create instance of security manager from DLL
                SecurityManager securityManager = new SecurityManager();

                // Determine which XML file to use based on login type
                string xmlFile = (LoginType.ToLower() == "member") ? "Member.xml" : "Staff.xml";
                string xmlPath = HttpContext.Current.Server.MapPath("~/App_Data/" + xmlFile);

                XmlDocument doc = new XmlDocument();
                doc.Load(xmlPath);

                // Find the user in the XML file
                XmlNode userNode = doc.SelectSingleNode($"//User[Username='{username}']");

                if (userNode != null)
                {
                    // Get the stored hashed password
                    string storedHash = userNode.SelectSingleNode("Password").InnerText;

                    // Verify the password using our security DLL
                    return securityManager.VerifyPassword(password, storedHash);
                }

                return false;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "An error occurred during login. Please try again later.";
                // Log the exception (in a real application)
                return false;
            }
        }
    }

    // Custom EventArgs for login events
    public class LoginEventArgs : EventArgs
    {
        public string Username { get; private set; }
        public string UserType { get; private set; }

        public LoginEventArgs(string username, string userType)
        {
            Username = username;
            UserType = userType;
        }
    }
}