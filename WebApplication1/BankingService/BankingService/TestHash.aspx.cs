using System;
using BankingSecurityLibrary;

namespace BankingService
{
    public partial class TestHash : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Nothing needed on page load
        }

        protected void btnHash_Click(object sender, EventArgs e)
        {
            string password = txtPasswordToHash.Text;

            if (!string.IsNullOrEmpty(password))
            {
                // Create instance of security manager from DLL
                SecurityManager securityManager = new SecurityManager();

                // Generate hash
                string hash = securityManager.HashPassword(password);

                // Display result
                lblHashResult.Text = hash;
                divHashResult.Visible = true;
            }
        }

        protected void btnVerify_Click(object sender, EventArgs e)
        {
            string password = txtPasswordToVerify.Text;
            string hash = txtHashToVerify.Text;

            if (!string.IsNullOrEmpty(password) && !string.IsNullOrEmpty(hash))
            {
                // Create instance of security manager from DLL
                SecurityManager securityManager = new SecurityManager();

                // Verify password
                bool result = securityManager.VerifyPassword(password, hash);

                // Display result
                lblVerifyResult.Text = result ? "Password matches the hash." : "Password does not match the hash.";
                divVerifyResult.Visible = true;
            }
        }

        protected void btnEncrypt_Click(object sender, EventArgs e)
        {
            string data = txtDataToEncrypt.Text;
            string key = txtEncryptionKey.Text;

            if (!string.IsNullOrEmpty(data))
            {
                // Create instance of security manager from DLL
                SecurityManager securityManager = new SecurityManager();

                // Encrypt data
                string encryptedData = securityManager.EncryptData(data, key);

                // Display result
                lblEncryptResult.Text = encryptedData;
                divEncryptResult.Visible = true;
            }
        }

        protected void btnDecrypt_Click(object sender, EventArgs e)
        {
            string encryptedData = txtDataToDecrypt.Text;
            string key = txtDecryptionKey.Text;

            if (!string.IsNullOrEmpty(encryptedData) && !string.IsNullOrEmpty(key))
            {
                try
                {
                    // Create instance of security manager from DLL
                    SecurityManager securityManager = new SecurityManager();

                    // Decrypt data
                    string decryptedData = securityManager.DecryptData(encryptedData, key);

                    // Display result
                    lblDecryptResult.Text = decryptedData;
                    divDecryptResult.Visible = true;
                }
                catch (Exception ex)
                {
                    lblDecryptResult.Text = "Error decrypting data. Make sure you have the correct key and encrypted data.";
                    divDecryptResult.Visible = true;
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}