<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Public.aspx.cs" Inherits="WebApplication1.Default" %>

<%@ Register src="Login.ascx" tagname="Login" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Default Page</title>
    <style>
    .center {
    margin: auto;
    width: 60%;
    }
    </style>
</head>
<body>
       <h1 class = "center" style ="text-align: center; border: 3px solid #73AD21; padding: 10px;">Public Page</h1>
        <div>
           <h2 class = "center" style="padding: 10px;">Login</h2>

            <div>
            <form id="Form 1" runat ="server" class = "center" >
                <uc1:Login runat ="server" />
            </form>
                </div>
        </div>

    
</body>
</html>
