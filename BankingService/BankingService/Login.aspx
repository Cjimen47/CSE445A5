<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BankingService.Login" %>
<%@ Register Src="~/LoginControl.ascx" TagPrefix="bank" TagName="LoginControl" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - Banking Service</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #003366;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>SecureBank Login</h1>
            
            <bank:LoginControl runat="server" ID="bankLogin" OnLoginSuccessful="bankLogin_LoginSuccessful" />
        </div>
    </form>
</body>
</html>