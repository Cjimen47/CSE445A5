<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Staff.aspx.cs" Inherits="WebApplication1.Staff" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Staff Page</title>
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
     <h1>Staff Page</h1>
           <p>Please enter the credentials of the staff member you wish to add</p>
           
           <div class="section">
               
               <h3>Username</h3>
               <asp:TextBox runat="server" placeholder="Username"></asp:TextBox>

               <h3>Password</h3>
               <asp:TextBox runat="server" placeholder="Password"></asp:TextBox>
              
           </div>

           <asp:Button runat="server" Text="Enter" class="btn" style="margin-top: 20px;"></asp:Button>

 </div>

    </form>
</body>
</html>
