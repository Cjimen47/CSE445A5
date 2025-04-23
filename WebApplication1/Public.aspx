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
    <div style =" background-color: #ccffcc; height: auto;" class ="center">
<h1 class = "center" style ="text-align: center; border: 3px solid #73AD21; padding: 10px;">Public Page</h1> 
         <h2 class = "center" style="padding: 10px;">Login</h2> 
            <form id="Form1" runat ="server" class = "center" >
               <uc1:Login runat ="server" />
            </form>
      <div style ="padding-top: 10px;" class ="center">
          <h2>Introduction</h2>
         <p>
             Explanation of functionality that Banking application offers
             <br /><br />
             How end users can sign up for services
         </p>
          <h2>For Users</h2>
           <p>
        How users can test this application and what test cases should be used
        </p>
      </div >
        <h3 class = "center"  style= "padding-top:30px;">Other Pages</h3>
        <button type="button" style ="margin: 30px 0px 30px 150px;">Member Page</button>
        <button type="button" style ="margin: 30px 0px 30px 100px;">Staff Page</button>

        <div class = "center"  >
        <h2>Service Directory</h2>
        <p>To be implemented</p>
            </div>

    </div>
</body>
</html>
