using System;
using System.Web;
using Security;

namespace TryIt
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void EncryptButton_Click(object sender, EventArgs e)
        {
            Crypto crypto = new Crypto();
            EncryptLiteral.Text = Convert.ToBase64String(crypto.Encrypt(EncryptInput.Text));
        }

        protected void DecryptButton_Click(object sender, EventArgs e)
        {
            Crypto crypto = new Crypto();
            DecryptLiteral.Text = crypto.Decrypt(Convert.FromBase64String(DecryptInput.Text));
        }

        protected void LoginRegisterSubmit_Click(object sender, EventArgs e)
        {
            if (LoginRegisterEmail.Text != String.Empty && LoginRegisterUsername.Text != String.Empty && LoginRegisterPassword.Text != String.Empty)
            {
                LoginService.LoginServiceClient prxy = new LoginService.LoginServiceClient();
                bool result = prxy.CreateAccount(LoginRegisterUsername.Text, LoginRegisterEmail.Text, LoginRegisterPassword.Text);
                LoginRegisterLiteral.Text = result ? "Success" : "Failure";
            }
            else
            {
                LoginRegisterLiteral.Text = "Please fill out the required fields.";
            }
        }

        protected void LoginLoginButton_Click(object sender, EventArgs e)
        {
            if (LoginLoginUsername.Text != String.Empty && LoginLoginPassword.Text != String.Empty)
            {
                LoginService.LoginServiceClient prxy = new LoginService.LoginServiceClient();
                LoginLoginLiteral.Text = prxy.Login(LoginLoginUsername.Text, LoginLoginPassword.Text);
            }
            else
            {
                LoginLoginLiteral.Text = "Please fill out the required fields.";
            }
        }

        protected void LoginLogoutButton_Click(object sender, EventArgs e)
        {
            if (LoginLogoutSessionID.Text != String.Empty)
            {
                LoginService.LoginServiceClient prxy = new LoginService.LoginServiceClient();
                bool result = prxy.Logout(LoginLogoutSessionID.Text);
                LoginLogoutLiteral.Text = result ? "Success" : "Failure";
            }
            else
            {
                LoginLogoutLiteral.Text = "Please fill out the required fields.";
            }
        }

        protected void LoginIsLoggedInButton_Click(object sender, EventArgs e)
        {
            if (LoginIsLoggedInUsername.Text != String.Empty)
            {
                LoginService.LoginServiceClient prxy = new LoginService.LoginServiceClient();
                bool result = prxy.IsUserLoggedIn(LoginIsLoggedInUsername.Text);
                LoginIsLoggedInLiteral.Text = result ? "Yes" : "No";
            }
            else
            {
                LoginIsLoggedInLiteral.Text = "Please fill out the required fields.";
            }
        }

        protected void LoginChangeUsernameButton_Click(object sender, EventArgs e)
        {
            if (LoginChangeUsernameUsername.Text != String.Empty && LoginChangeUsernameSessionID.Text != String.Empty)
            {
                LoginService.LoginServiceClient prxy = new LoginService.LoginServiceClient();
                bool result = prxy.ChangeUsername(LoginChangeUsernameSessionID.Text, LoginChangeUsernameUsername.Text);
                LoginChangeUsernameLiteral.Text = result ? "Success" : "Failure";
            }
            else
            {
                LoginChangeUsernameLiteral.Text = "Please fill out the required fields.";
            }
        }

        protected void LoginChangePasswordButton_Click(object sender, EventArgs e)
        {
            if (LoginChangePasswordSessionID.Text != String.Empty && LoginChangePasswordOldPass.Text != String.Empty && LoginChangePasswordNewPass.Text != String.Empty)
            {
                LoginService.LoginServiceClient prxy = new LoginService.LoginServiceClient();
                bool result = prxy.ChangePassword(LoginChangePasswordSessionID.Text, LoginChangePasswordOldPass.Text, LoginChangePasswordNewPass.Text);
                LoginChangePasswordLiteral.Text = result ? "Success" : "Failure";
            }
            else
            {
                LoginChangePasswordLiteral.Text = "Please fill out the required fields.";
            }
        }

        protected void LoginChangeEmailButton_Click(object sender, EventArgs e)
        {
            if (LoginChangeEmailSessionID.Text != String.Empty && LoginChangeEmailEmail.Text != String.Empty)
            {
                LoginService.LoginServiceClient prxy = new LoginService.LoginServiceClient();
                bool result = prxy.ChangeEmail(LoginChangeEmailSessionID.Text, LoginChangeEmailEmail.Text);
                LoginChangeEmailLiteral.Text = result ? "Success" : "Failure";
            }
            else
            {
                LoginChangeEmailLiteral.Text = "Please fill out the required fields.";
            }
        }

        protected void LoginRemoveAccountButton_Click(object sender, EventArgs e)
        {
            if (LoginRemoveAccountSessionID.Text != String.Empty && LoginRemoveAccountUsername.Text != String.Empty && LoginRemoveAccountPassword.Text != String.Empty)
            {
                LoginService.LoginServiceClient prxy = new LoginService.LoginServiceClient();
                bool result = prxy.RemoveAccount(LoginRemoveAccountSessionID.Text, LoginRemoveAccountUsername.Text, LoginRemoveAccountPassword.Text);
                LoginRemoveAccountLiteral.Text = result ? "Success" : "Failure";
            }
            else
            {
                LoginRemoveAccountLiteral.Text = "Please fill out the required fields.";
            }
        }

        protected void CookieSaveButton_Click(object sender, EventArgs e)
        {
            HttpCookie cookie = new HttpCookie("session-cookie");
            cookie["id"] = CookieSaveInput.Text;
            cookie.Expires = DateTime.Now.AddDays(1);
            Response.Cookies.Add(cookie);
        }

        protected void CookieRetrieveButton_Click(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["session-cookie"];
            if (cookie != null && cookie["id"] != "")
            {
                CookieRetrieveLiteral.Text = cookie["id"];
            }
        }

        protected void HashButton_Click(object sender, EventArgs e)
        {
            HashLiteral.Text = Hash.SHA256Hash(HashInput.Text);
        }

        protected void SaltButton_Click(object sender, EventArgs e)
        {
            SaltLiteral.Text = Hash.GenerateSalt();
        }
    }
}