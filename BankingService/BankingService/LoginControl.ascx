<%-- LoginControl.ascx --%>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginControl.ascx.cs" Inherits="BankingService.LoginControl" %>

<div style="width: 100%; max-width: 400px; margin: 0 auto; padding: 20px; border: 1px solid #ddd; border-radius: 5px; background-color: #f9f9f9;">
    <h3 style="color: #003366; margin-top: 0;">Account Login</h3>
    
    <div style="margin-bottom: 15px;">
        <asp:Label ID="lblUserType" runat="server" Text="Login Type:" Font-Bold="true"></asp:Label>
        <asp:Label ID="lblLoginType" runat="server" Text="Member"></asp:Label>
    </div>
    
    <div style="margin-bottom: 15px;">
        <asp:Label ID="lblUsername" runat="server" Text="Username:" AssociatedControlID="txtUsername"></asp:Label>
        <asp:TextBox ID="txtUsername" runat="server" Width="100%" CssClass="form-control" placeholder="Enter your username"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername" 
            ErrorMessage="Username is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
    
    <div style="margin-bottom: 15px;">
        <asp:Label ID="lblPassword" runat="server" Text="Password:" AssociatedControlID="txtPassword"></asp:Label>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="100%" CssClass="form-control" placeholder="Enter your password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" 
            ErrorMessage="Password is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
    
    <div style="margin-bottom: 15px;">
        <asp:CheckBox ID="chkRememberMe" runat="server" Text="Remember me" />
    </div>
    
    <div>
        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" 
            style="background-color: #003366; color: white; padding: 8px 15px; border: none; border-radius: 4px; cursor: pointer;" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CausesValidation="false"
            style="background-color: #777; color: white; padding: 8px 15px; border: none; border-radius: 4px; cursor: pointer; margin-left: 10px;" />
    </div>
    
    <div style="margin-top: 15px;">
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
    </div>
</div>