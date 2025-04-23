<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Login.ascx.cs" Inherits="WebApplication1.Login" %>

<div>
<asp:Label ID="UserID" runat="server" Text ="User Name:"></asp:Label> 
<asp:TextBox ID="MyUserName" runat="server"></asp:TextBox>
       </div>
 <div>
 <asp:Label ID="PassID" runat="server" Text ="Password:"></asp:Label>
 <asp:TextBox ID="MyPassword" runat="server"></asp:TextBox>
</div>

<div><asp:LinkButton ID="LinkButton1" Text="Log In" RunAt="server" />
</div>

<script language="C#" RunAt="server">

     public string UserName { get { return MyUserName.Text; }
                              set { MyUserName.Text = value; } }
     public string Password { get { return MyPassword.Text; }
                              set { MyPassword.Text = value; } }
</script> 
