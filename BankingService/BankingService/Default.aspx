<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BankingService.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Online Banking Service</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 1000px;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1, h2, h3 {
            color: #003366;
        }
        .btn {
            background-color: #003366;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 10px;
            font-size: 16px;
        }
        .btn:hover {
            background-color: #004080;
        }
        .feature-box {
            margin: 20px 0;
            padding: 15px;
            background-color: #f9f9f9;
            border-left: 4px solid #003366;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #003366;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Welcome to SecureBank Online Banking Services</h1>
            
            <div class="feature-box">
                <h2>About Our Banking Platform</h2>
                <p>SecureBank offers a comprehensive online banking solution that provides secure access to your financial information and allows you to manage your accounts efficiently. Our platform is designed with state-of-the-art security features to protect your financial data.</p>
            </div>

            <h2>Services Offered</h2>
            <ul>
                <li>View account balances and transaction history</li>
                <li>Transfer funds between accounts</li>
                <li>Pay bills online</li>
                <li>Set up recurring payments</li>
                <li>Apply for loans and credit cards</li>
                <li>Deposit checks remotely</li>
                <li>Secure messaging with customer service</li>
            </ul>

            <h2>Access Your Account</h2>
            <p>Please select one of the options below to access your account:</p>
            <div>
                <asp:Button ID="btnMember" runat="server" Text="Member Login" CssClass="btn" OnClick="btnMember_Click" />
                <asp:Button ID="btnStaff" runat="server" Text="Staff Login" CssClass="btn" OnClick="btnStaff_Click" />
            </div>

            <div class="feature-box">
                <h2>New to SecureBank?</h2>
                <p>Sign up for online banking to access your accounts anytime, anywhere. Registration is quick and secure.</p>
                <asp:Button ID="btnSignUp" runat="server" Text="Sign Up Now" CssClass="btn" OnClick="btnSignUp_Click" />
            </div>

            <h2>Test Cases & Instructions</h2>
            <p>To test this application, you can use the following credentials:</p>
            <ul>
                <li>For Member access: Username: "testuser" / Password: "Password1!"</li>
                <li>For Staff access: Username: "TA" / Password: "Cse445!"</li>
            </ul>

            <h2>Service Directory</h2>
            <table>
                <tr>
                    <th>Provider Name</th>
                    <th>Component Type</th>
                    <th>Operation Name</th>
                    <th>Parameters</th>
                    <th>Return Type</th>
                    <th>Description</th>
                    <th>Test Link</th>
                </tr>
                <tr>
                    <td>Your Name</td>
                    <td>DLL</td>
                    <td>HashPassword</td>
                    <td>String: password</td>
                    <td>String</td>
                    <td>Converts a password into a secure hash</td>
                    <td><asp:Button ID="btnTestHash" runat="server" Text="Try It" OnClick="btnTestHash_Click" /></td>
                </tr>
                <tr>
                    <td>Your Name</td>
                    <td>User Control</td>
                    <td>LoginControl</td>
                    <td>N/A</td>
                    <td>N/A</td>
                    <td>Custom login control with validation</td>
                    <td><asp:Button ID="btnTestLogin" runat="server" Text="Try It" OnClick="btnTestLogin_Click" /></td>
                </tr>
                <tr>
                    <td>Your Name</td>
                    <td>Web Service</td>
                    <td>CalculateInterest</td>
                    <td>Double: principal, Double: rate, Int: years</td>
                    <td>Double</td>
                    <td>Calculates compound interest for a given amount</td>
                    <td><asp:Button ID="btnTestInterest" runat="server" Text="Try It" OnClick="btnTestInterest_Click" /></td>
                </tr>
                <!-- Add more rows for each component you create -->
            </table>
        </div>
    </form>
</body>
</html>