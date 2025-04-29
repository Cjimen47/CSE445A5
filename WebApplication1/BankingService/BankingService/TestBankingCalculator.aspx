<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestBankingCalculator.aspx.cs" Inherits="BankingService.TestBankingCalculator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Banking Calculator - Test Page</title>
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
            width: 200px;
            padding: 8px;
            margin: 5px 0;
        }
        .result {
            margin-top: 10px;
            padding: 10px;
            background-color: #e9f7ef;
            border-left: 4px solid #2ecc71;
        }
        label {
            display: inline-block;
            width: 150px;
            margin: 5px 0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Banking Calculator Service</h1>
            <p>This page tests the Banking Calculator Web Service functions.</p>
            
            <div class="section">
                <h2>Simple Interest Calculator</h2>
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
                
                <div class="result" runat="server" id="divSimpleResult" visible="false">
                    <asp:Label ID="lblSimpleResult" runat="server"></asp:Label>
                </div>
            </div>
            
            <div class="section">
                <h2>Compound Interest Calculator</h2>
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
                    <asp:Label ID="lblCompoundResult" runat="server"></asp:Label>
                </div>
            </div>
            
            <div class="section">
                <h2>Loan Calculator</h2>
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
                    <asp:Label ID="lblLoanResult" runat="server"></asp:Label>
                </div>
            </div>
            
            <div class="section">
                <h2>Savings Calculator</h2>
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
                    <asp:Label ID="lblSavingsResult" runat="server"></asp:Label>
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
                
                <div class="result" runat="server" id="divEligibilityResult" visible="false">
                    <asp:Label ID="lblEligibilityResult" runat="server"></asp:Label>
                </div>
            </div>
            
            <div>
                <asp:Button ID="btnBack" runat="server" Text="Back to Home" OnClick="btnBack_Click" CssClass="btn" />
            </div>
        </div>
    </form>
</body>
</html>