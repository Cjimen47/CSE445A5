<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestHash.aspx.cs" Inherits="BankingService.TestHash" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Test Hash Functions - Banking Service</title>
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
        h1, h2 {
            color: #003366;
        }
        .section {
            margin-bottom: 20px;
            padding: 15px;
            background-color: #f9f9f9;
            border-radius: 5px;
        }
        .btn {
            background-color: #003366;
            color: white;
            padding: 8px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
        }
        .textbox {
            width: 100%;
            padding: 8px;
            margin: 5px 0;
            box-sizing: border-box;
        }
        .result {
            margin-top: 10px;
            padding: 10px;
            background-color: #e9f7ef;
            border-left: 4px solid #2ecc71;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Security Library Test Page</h1>
            <p>This page demonstrates the functionality of the encryption and hashing DLL.</p>
            
            <div class="section">
                <h2>Password Hashing</h2>
                <p>Enter a password to generate a secure hash:</p>
                <asp:TextBox ID="txtPasswordToHash" runat="server" CssClass="textbox" placeholder="Enter password to hash"></asp:TextBox>
                <br />
                <asp:Button ID="btnHash" runat="server" Text="Generate Hash" CssClass="btn" OnClick="btnHash_Click" />
                
                <div class="result" runat="server" id="divHashResult" visible="false">
                    <strong>Hashed Password:</strong>
                    <br />
                    <asp:Label ID="lblHashResult" runat="server"></asp:Label>
                </div>
            </div>
            
            <div class="section">
                <h2>Password Verification</h2>
                <p>Verify a password against a hash:</p>
                <asp:TextBox ID="txtPasswordToVerify" runat="server" CssClass="textbox" placeholder="Enter password"></asp:TextBox>
                <br />
                <asp:TextBox ID="txtHashToVerify" runat="server" CssClass="textbox" placeholder="Enter hash to verify against"></asp:TextBox>
                <br />
                <asp:Button ID="btnVerify" runat="server" Text="Verify Password" CssClass="btn" OnClick="btnVerify_Click" />
                
                <div class="result" runat="server" id="divVerifyResult" visible="false">
                    <strong>Verification Result:</strong>
                    <br />
                    <asp:Label ID="lblVerifyResult" runat="server"></asp:Label>
                </div>
            </div>
            
            <div class="section">
                <h2>Data Encryption</h2>
                <p>Encrypt sensitive data:</p>
                <asp:TextBox ID="txtDataToEncrypt" runat="server" CssClass="textbox" placeholder="Enter data to encrypt"></asp:TextBox>
                <br />
                <asp:TextBox ID="txtEncryptionKey" runat="server" CssClass="textbox" placeholder="Enter encryption key (optional)"></asp:TextBox>
                <br />
                <asp:Button ID="btnEncrypt" runat="server" Text="Encrypt Data" CssClass="btn" OnClick="btnEncrypt_Click" />
                
                <div class="result" runat="server" id="divEncryptResult" visible="false">
                    <strong>Encrypted Data:</strong>
                    <br />
                    <asp:Label ID="lblEncryptResult" runat="server"></asp:Label>
                </div>
            </div>
            
            <div class="section">
                <h2>Data Decryption</h2>
                <p>Decrypt encrypted data:</p>
                <asp:TextBox ID="txtDataToDecrypt" runat="server" CssClass="textbox" placeholder="Enter encrypted data" TextMode="MultiLine" Rows="3"></asp:TextBox>
                <br />
                <asp:TextBox ID="txtDecryptionKey" runat="server" CssClass="textbox" placeholder="Enter decryption key"></asp:TextBox>
                <br />
                <asp:Button ID="btnDecrypt" runat="server" Text="Decrypt Data" CssClass="btn" OnClick="btnDecrypt_Click" />
                
                <div class="result" runat="server" id="divDecryptResult" visible="false">
                    <strong>Decrypted Data:</strong>
                    <br />
                    <asp:Label ID="lblDecryptResult" runat="server"></asp:Label>
                </div>
            </div>
            
            <div>
                <asp:Button ID="btnBack" runat="server" Text="Back to Home" OnClick="btnBack_Click" CssClass="btn" />
            </div>
        </div>
    </form>
</body>
</html>