<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Member.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Member Page</title>
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
     .section {
        margin-bottom: 20px;
        padding: 15px;
        background-color: #f9f9f9;
        border-radius: 5px;
     }

      .result {
        margin-top: 10px;
        padding: 10px;
        background-color: #e9f7ef;
        border-left: 4px solid #2ecc71;
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
     .textbox {
       width: 200px;
        padding: 8px;
        margin: 5px 0;
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
            <h1>Welcome Member!</h1>

            <div class="feature-box">
                <p>SecureBank Members also have access 
                   to multiple kinds of calculators to help them make responsible financial 
                   decisions.
                </p>
            </div>
            

            <div class="section">
            <h3>Simple Interest Calculator</h3>

            <div>
                <label for="txtPrincipal1">Principal Amount ($):</label>
                <asp:TextBox ID="txtPrincipal1" runat="server" CssClass="textbox" Text="1000"></asp:TextBox>
            </div>
                <div>
                    <label for="txtRate1">Annual Interest Rate (%):</label>
                    <asp:TextBox ID="txtRate1" runat="server" CssClass="textbox" Text="5"></asp:TextBox>
                </div>

                <div>
                    <label for="txtYears1">Time Period (years):</label>
                    <asp:TextBox ID="txtYears1" runat="server" CssClass="textbox" Text="3"></asp:TextBox>
                </div>
                <asp:Button ID="btnCalculateSimple" runat="server" Text="Calculate Simple Interest" CssClass="btn" OnClick="btnCalculateSimple_Click" />

                <div class = "result" runat="server" id="divEligibilityResult" visible="false">
                 <asp:Label ID="lblEligibilityResult" runat="server">Result</asp:Label>
               </div>
            </div>

            <div class="section">
            <h3>Compound Interest Calculator</h3>
               <div>
                 <label for="txtPrincipal2">Principal Amount ($):</label>
                 <asp:TextBox ID="txtPrincipal2" runat="server" CssClass="textbox" Text="1000"></asp:TextBox>
                </div>
                <div>
                    <label for="txtRate2">Annual Interest Rate (%):</label>
                    <asp:TextBox ID="txtRate2" runat="server" CssClass="textbox" Text="5"></asp:TextBox>
                </div>
                <div>
                    <label for="txtYears2">Time Period (years):</label>
                    <asp:TextBox ID="txtYears2" runat="server" CssClass="textbox" Text="3"></asp:TextBox>
                </div>
                <div>
                    <label for="ddlCompounding">Compounding Frequency:</label>
                    <asp:DropDownList ID="ddlCompounding" runat="server" CssClass="textbox">
                    <asp:ListItem Value="1" Text="Annually"></asp:ListItem>
                    <asp:ListItem Value="2" Text="Semi-Annually"></asp:ListItem>
                    <asp:ListItem Value="4" Text="Quarterly"></asp:ListItem>
                    <asp:ListItem Value="12" Text="Monthly"></asp:ListItem>
                    <asp:ListItem Value="365" Text="Daily"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                 <asp:Button ID="btnCalculateCompound" runat="server" Text="Calculate Compound Interest" CssClass="btn" OnClick="btnCalculateCompound_Click" />
    
                  <div class="result" runat="server" id="divCompoundResult" visible="false">
                    <asp:Label ID="lblCompoundResult" runat="server">Result</asp:Label>
                 </div>
            </div>

            <div class="section">
             <h3>Loan Calculator</h3>
                <div>
                 <label for="txtLoanAmount">Loan Amount ($):</label>
                 <asp:TextBox ID="txtLoanAmount" runat="server" CssClass="textbox" Text="10000"></asp:TextBox>
                </div>

                <div>
                    <label for="txtLoanRate">Annual Interest Rate (%):</label>
                    <asp:TextBox ID="txtLoanRate" runat="server" CssClass="textbox" Text="4.5"></asp:TextBox>
                </div>
                <div>
                    <label for="txtLoanTerm">Loan Term (years):</label>
                    <asp:TextBox ID="txtLoanTerm" runat="server" CssClass="textbox" Text="5"></asp:TextBox>
                </div>
                <asp:Button ID="btnCalculateLoan" runat="server" Text="Calculate Monthly Payment" CssClass="btn" OnClick="btnCalculateLoan_Click" />
    
                <div class="result" runat="server" id="divLoanResult" visible="false">
                    <asp:Label ID="lblLoanResult" runat="server">Result</asp:Label>
               </div>
             </div>

            <div class="section">
            <h3>Savings Calculator</h3>
             <div>
            <label for="txtMonthlyDeposit">Monthly Deposit ($):</label>
                <asp:TextBox ID="txtMonthlyDeposit" runat="server" CssClass="textbox" Text="200"></asp:TextBox>
            </div>
            <div>
                <label for="txtSavingsRate">Annual Interest Rate (%):</label>
                <asp:TextBox ID="txtSavingsRate" runat="server" CssClass="textbox" Text="3"></asp:TextBox>
            </div>
            <div>
            <label for="txtSavingsYears">Time Period (years):</label>
            <asp:TextBox ID="txtSavingsYears" runat="server" CssClass="textbox" Text="10"></asp:TextBox>
            </div>
            <asp:Button ID="btnCalculateSavings" runat="server" Text="Calculate Future Value" CssClass="btn" OnClick="btnCalculateSavings_Click" />
    
            <div class="result" runat="server" id="divSavingsResult" visible="false">
                <asp:Label ID="lblSavingsResult" runat="server">Result</asp:Label>
            </div>
        </div>

            <div class="section">
                <h2>Loan Eligibility Check</h2>
                <div>
                    <label for="txtAnnualIncome">Annual Income ($):</label>
                    <asp:TextBox ID="txtAnnualIncome" runat="server" CssClass="textbox" Text="60000"></asp:TextBox>
                </div>
                <div>
                    <label for="txtCreditScore">Credit Score (300-850):</label>
                    <asp:TextBox ID="txtCreditScore" runat="server" CssClass="textbox" Text="700"></asp:TextBox>
                </div>
                 <div>
                     <label for="txtMonthlyDebt">Monthly Debt ($):</label>
                     <asp:TextBox ID="txtMonthlyDebt" runat="server" CssClass="textbox" Text="1200"></asp:TextBox>
                </div>
                <div>
                    <label for="txtRequestedLoan">Requested Loan ($):</label>
                    <asp:TextBox ID="txtRequestedLoan" runat="server" CssClass="textbox" Text="150000"></asp:TextBox>
                </div>
                <asp:Button ID="btnCheckEligibility" runat="server" Text="Check Eligibility" CssClass="btn" OnClick="btnCheckEligibility_Click" />
    
                <div class="result" runat="server" id="div1" visible="false">
                <asp:Label ID="Label1" runat="server">Result</asp:Label>
                </div>
               </div>
            
            

        </div>
        
    </form>
</body>
</html>
