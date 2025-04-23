<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tryit.aspx.cs" Inherits="WebApplication1.Tryit" %>

<%@ Register Src="~/Login.ascx" TagPrefix="uc1" TagName="Login" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
            <uc1:Login runat="server" id="Login" />
            
    </form>
    <asp:Label ID="Label1" runat="server" Text="Output"></asp:Label>
    
</body>
</html>

<script language="C#" RunAt="server">
   void Page_Load (Object sender, EventArgs e) {
        if (IsPostBack)
        Output.Text = “Hello, ” + MyLogin.UserName;
}
</script>

