<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TryIt.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <h1>TryIt Page</h1>
    <form id="form1" runat="server">
        <div>
            <h2>Cookies</h2>
            <div>
                <b>Save sessionID</b>
                <asp:TextBox ID="CookieSaveInput" runat="server"></asp:TextBox>
                <asp:Button ID="CookieSaveButton" runat="server" Text="Submit" OnClick="CookieSaveButton_Click" />
            </div>
            <div>
                <b>Retrieve sessionID</b>
                <asp:Literal ID="CookieRetrieveLiteral" runat="server"></asp:Literal>
                <asp:Button ID="CookieRetrieveButton" runat="server" Text="Retrieve" OnClick="CookieRetrieveButton_Click" />
            </div>
        </div>
        <div>
            <h2>Crypto - DLL</h2>
            <i>Encrypt: (toEncrypt: string)->(encrypted: string)</i>
            <div>
                <b>To Encrypt:</b>
                <asp:TextBox ID="EncryptInput" runat="server"></asp:TextBox>
                <asp:Button ID="EncryptButton" runat="server" Text="Submit" OnClick="EncryptButton_Click" />
            </div>
            <div>
                <b>Encrypted: </b>
                <asp:Literal ID="EncryptLiteral" runat="server"></asp:Literal>
            </div>
            <i>Decrypt: (toDecrypt: string)->(decrypted: string)</i>
            <div>
                <b>To Decrypt: </b>
                <asp:TextBox ID="DecryptInput" runat="server"></asp:TextBox>
                <asp:Button ID="DecryptButton" runat="server" Text="Submit" OnClick="DecryptButton_Click" />
            </div>
            <div>
                <b>Decrypted: </b>
                <asp:Literal ID="DecryptLiteral" runat="server"></asp:Literal>
            </div>
            <i>Hash: (toHash: string)->(hashed: string)</i>
            <div>
                <b>To Hash: </b>
                <asp:TextBox ID="HashInput" runat="server"></asp:TextBox>
                <asp:Button ID="HashButton" runat="server" Text="Submit" OnClick="HashButton_Click" />
            </div>
            <div>
                <b>Hashed: </b>
                <asp:Literal ID="HashLiteral" runat="server"></asp:Literal>
            </div>
            <i>GenerateSalt: ()->(salt: string)</i>
            <div>
                <div>
                    <asp:Button ID="SaltButton" runat="server" Text="Submit" OnClick="SaltButton_Click" />
                </div>
                <b>Hashed: </b>
                <asp:Literal ID="SaltLiteral" runat="server"></asp:Literal>
            </div>
        </div>
        <div>
            <h2>Login Service - SOAP</h2>
            <i>This service provides a way for users to register an account with the service. They can register, login, change account info, and remove their account. All emails are verified using a remote REST web service.</i>
            <div>
                <i>Service Url: </i>
                <a href="http://localhost:55416/Service1.svc">http://localhost:55416/Service1.svc</a>
            </div>
            <i>CreateAccount: (username: string, password: string, email: string)->(result: bool)</i>
            <div>
                <b>Username: </b>
                <asp:TextBox ID="LoginRegisterUsername" runat="server"></asp:TextBox>
                <b>Password: </b>
                <asp:TextBox ID="LoginRegisterPassword" runat="server"></asp:TextBox>
                <b>Email: </b>
                <asp:TextBox ID="LoginRegisterEmail" runat="server"></asp:TextBox>
                <asp:Button ID="LoginRegisterSubmit" runat="server" Text="Submit" OnClick="LoginRegisterSubmit_Click" />
            </div>
            <div>
                <b>Result: </b>
                <asp:Literal ID="LoginRegisterLiteral" runat="server"></asp:Literal>
            </div>
            <i>Login: (username: string, password: string)->(sessionId: string)</i>
            <div>
                <b>Username: </b>
                <asp:TextBox ID="LoginLoginUsername" runat="server"></asp:TextBox>
                <b>Password: </b>
                <asp:TextBox ID="LoginLoginPassword" runat="server"></asp:TextBox>
                <asp:Button ID="LoginLoginButton" runat="server" Text="Submit" OnClick="LoginLoginButton_Click" />
            </div>
            <div>
                <b>Result: </b>
                <asp:Literal ID="LoginLoginLiteral" runat="server"></asp:Literal>
            </div>
            <i>Logout: (sessionId: string)->(result: bool)</i>
            <div>
                <b>Session ID: </b>
                <asp:TextBox ID="LoginLogoutSessionID" runat="server"></asp:TextBox>
                <asp:Button ID="LoginLogoutButton" runat="server" Text="Submit" OnClick="LoginLogoutButton_Click" />
            </div>
            <div>
                <b>Result: </b>
                <asp:Literal ID="LoginLogoutLiteral" runat="server"></asp:Literal>
            </div>
            <i>IsUserLoggedIn: (username: string)->(result: bool)</i>
            <div>
                <b>Username: </b>
                <asp:TextBox ID="LoginIsLoggedInUsername" runat="server"></asp:TextBox>
                <asp:Button ID="LoginIsLoggedInButton" runat="server" Text="Submit" OnClick="LoginIsLoggedInButton_Click" />
            </div>
            <div>
                <b>Result: </b>
                <asp:Literal ID="LoginIsLoggedInLiteral" runat="server"></asp:Literal>
            </div>
            <i>ChangeUsername: (sessionId: string, username: string)->(result: bool)</i>
            <div>
                <b>Session ID: </b>
                <asp:TextBox ID="LoginChangeUsernameSessionID" runat="server"></asp:TextBox>
                <b>Username: </b>
                <asp:TextBox ID="LoginChangeUsernameUsername" runat="server"></asp:TextBox>
                <asp:Button ID="LoginChangeUsernameButton" runat="server" Text="Submit" OnClick="LoginChangeUsernameButton_Click" />
            </div>
            <div>
                <b>Result: </b>
                <asp:Literal ID="LoginChangeUsernameLiteral" runat="server"></asp:Literal>
            </div>
            <i>ChangePassword: (sessionId: string, oldPassword: string, newPassword: string)->(result: bool)</i>
            <div>
                <b>Session ID: </b>
                <asp:TextBox ID="LoginChangePasswordSessionID" runat="server"></asp:TextBox>
                <b>Old Password: </b>
                <asp:TextBox ID="LoginChangePasswordOldPass" runat="server"></asp:TextBox>
                <b>New Password: </b>
                <asp:TextBox ID="LoginChangePasswordNewPass" runat="server"></asp:TextBox>
                <asp:Button ID="LoginChangePasswordButton" runat="server" Text="Submit" OnClick="LoginChangePasswordButton_Click" />
            </div>
            <div>
                <b>Result: </b>
                <asp:Literal ID="LoginChangePasswordLiteral" runat="server"></asp:Literal>
            </div>
            <i>ChangeEmail: (sessionId: string, email: string)->(result: bool)</i>
            <div>
                <b>Session ID: </b>
                <asp:TextBox ID="LoginChangeEmailSessionID" runat="server"></asp:TextBox>
                <b>Email: </b>
                <asp:TextBox ID="LoginChangeEmailEmail" runat="server"></asp:TextBox>
                <asp:Button ID="LoginChangeEmailButton" runat="server" Text="Submit" OnClick="LoginChangeEmailButton_Click" />
            </div>
            <div>
                <b>Result: </b>
                <asp:Literal ID="LoginChangeEmailLiteral" runat="server"></asp:Literal>
            </div>
            <i>RemoveAccount: (sessionId: string, username: string, password: string)->(result: bool)</i>
            <div>
                <b>Session ID: </b>
                <asp:TextBox ID="LoginRemoveAccountSessionID" runat="server"></asp:TextBox>
                <b>Username: </b>
                <asp:TextBox ID="LoginRemoveAccountUsername" runat="server"></asp:TextBox>
                <b>Password: </b>
                <asp:TextBox ID="LoginRemoveAccountPassword" runat="server"></asp:TextBox>
                <asp:Button ID="LoginRemoveAccountButton" runat="server" Text="Submit" OnClick="LoginRemoveAccountButton_Click" />
            </div>
            <div>
                <b>Result: </b>
                <asp:Literal ID="LoginRemoveAccountLiteral" runat="server"></asp:Literal>
            </div>
        </div>
    </form>
</body>
</html>
