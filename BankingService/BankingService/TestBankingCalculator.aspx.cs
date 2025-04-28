using System;
using System.Web.UI;
using BankingService;

namespace BankingService
{
    public partial class TestBankingCalculator : System.Web.UI.Page
    {
        // Reference to the web service
        // Note: You'll need to add a web reference to your project for this to work
        private BankingCalculator calculatorService = new BankingCalculator();

        protected void Page_Load(object sender, EventArgs e)
        {
            // Nothing needed on page load
        }

        protected void btnCalculateSimple_Click(object sender, EventArgs e)
        {
            try
            {
                // Get input values
                double principal = Convert.ToDouble(txtPrincipal1.Text);
                double rate = Convert.ToDouble(txtRate1.Text);
                int years = Convert.ToInt32(txtYears1.Text);

                // Call web service method
                double interest = calculatorService.CalculateSimpleInterest(principal, rate, years);

                // Display result
                lblSimpleResult.Text = string.Format("Principal: ${0:N2}<br/>Interest Rate: {1}%<br/>Time Period: {2} years<br/><br/>Simple Interest: ${3:N2}<br/>Total Amount: ${4:N2}",
                    principal, rate, years, interest, principal + interest);
                divSimpleResult.Visible = true;
            }
            catch (Exception ex)
            {
                lblSimpleResult.Text = "Error: " + ex.Message;
                divSimpleResult.Visible = true;
            }
        }

        protected void btnCalculateCompound_Click(object sender, EventArgs e)
        {
            try
            {
                // Get input values
                double principal = Convert.ToDouble(txtPrincipal2.Text);
                double rate = Convert.ToDouble(txtRate2.Text);
                int years = Convert.ToInt32(txtYears2.Text);
                int compoundingFrequency = Convert.ToInt32(ddlCompounding.SelectedValue);

                // Call web service method
                double interest = calculatorService.CalculateCompoundInterest(principal, rate, years, compoundingFrequency);
                double futureValue = principal + interest;

                // Display result
                string compoundingText = ddlCompounding.SelectedItem.Text;
                lblCompoundResult.Text = string.Format("Principal: ${0:N2}<br/>Interest Rate: {1}%<br/>Time Period: {2} years<br/>Compounding: {3}<br/><br/>Compound Interest: ${4:N2}<br/>Future Value: ${5:N2}",
                    principal, rate, years, compoundingText, interest, futureValue);
                divCompoundResult.Visible = true;
            }
            catch (Exception ex)
            {
                lblCompoundResult.Text = "Error: " + ex.Message;
                divCompoundResult.Visible = true;
            }
        }

        protected void btnCalculateLoan_Click(object sender, EventArgs e)
        {
            try
            {
                // Get input values
                double loanAmount = Convert.ToDouble(txtLoanAmount.Text);
                double interestRate = Convert.ToDouble(txtLoanRate.Text);
                int loanTerm = Convert.ToInt32(txtLoanTerm.Text);

                // Call web service method
                double monthlyPayment = calculatorService.CalculateMonthlyLoanPayment(loanAmount, interestRate, loanTerm);
                double totalPayment = monthlyPayment * loanTerm * 12;
                double totalInterest = totalPayment - loanAmount;

                // Display result
                lblLoanResult.Text = string.Format("Loan Amount: ${0:N2}<br/>Interest Rate: {1}%<br/>Loan Term: {2} years<br/><br/>Monthly Payment: ${3:N2}<br/>Total Payment: ${4:N2}<br/>Total Interest: ${5:N2}",
                    loanAmount, interestRate, loanTerm, monthlyPayment, totalPayment, totalInterest);
                divLoanResult.Visible = true;
            }
            catch (Exception ex)
            {
                lblLoanResult.Text = "Error: " + ex.Message;
                divLoanResult.Visible = true;
            }
        }

        protected void btnCalculateSavings_Click(object sender, EventArgs e)
        {
            try
            {
                // Get input values
                double monthlyDeposit = Convert.ToDouble(txtMonthlyDeposit.Text);
                double interestRate = Convert.ToDouble(txtSavingsRate.Text);
                int years = Convert.ToInt32(txtSavingsYears.Text);

                // Call web service method
                double futureValue = calculatorService.CalculateSavingsFutureValue(monthlyDeposit, interestRate, years);
                double totalDeposits = monthlyDeposit * years * 12;
                double interestEarned = futureValue - totalDeposits;

                // Display result
                lblSavingsResult.Text = string.Format("Monthly Deposit: ${0:N2}<br/>Interest Rate: {1}%<br/>Time Period: {2} years<br/><br/>Future Value: ${3:N2}<br/>Total Deposits: ${4:N2}<br/>Interest Earned: ${5:N2}",
                    monthlyDeposit, interestRate, years, futureValue, totalDeposits, interestEarned);
                divSavingsResult.Visible = true;
            }
            catch (Exception ex)
            {
                lblSavingsResult.Text = "Error: " + ex.Message;
                divSavingsResult.Visible = true;
            }
        }

        protected void btnCheckEligibility_Click(object sender, EventArgs e)
        {
            try
            {
                // Get input values
                double annualIncome = Convert.ToDouble(txtAnnualIncome.Text);
                int creditScore = Convert.ToInt32(txtCreditScore.Text);
                double monthlyDebt = Convert.ToDouble(txtMonthlyDebt.Text);
                double requestedLoan = Convert.ToDouble(txtRequestedLoan.Text);

                // Call web service method
                bool isEligible = calculatorService.CheckLoanEligibility(annualIncome, creditScore, monthlyDebt, requestedLoan);

                // Calculate debt-to-income ratio
                double debtToIncomeRatio = (monthlyDebt / (annualIncome / 12)) * 100;

                // Display result
                if (isEligible)
                {
                    lblEligibilityResult.Text = string.Format("Congratulations! You are eligible for the loan.<br/><br/>Annual Income: ${0:N2}<br/>Credit Score: {1}<br/>Monthly Debt: ${2:N2}<br/>Debt-to-Income Ratio: {3:N2}%<br/>Requested Loan: ${4:N2}",
                        annualIncome, creditScore, monthlyDebt, debtToIncomeRatio, requestedLoan);
                }
                else
                {
                    lblEligibilityResult.Text = string.Format("Sorry, you are not eligible for the loan.<br/><br/>Annual Income: ${0:N2}<br/>Credit Score: {1}<br/>Monthly Debt: ${2:N2}<br/>Debt-to-Income Ratio: {3:N2}%<br/>Requested Loan: ${4:N2}<br/><br/>Possible reasons:<br/>- Credit score below 620<br/>- Debt-to-income ratio above 43%<br/>- Requested loan amount too high compared to income",
                        annualIncome, creditScore, monthlyDebt, debtToIncomeRatio, requestedLoan);
                }

                divEligibilityResult.Visible = true;
            }
            catch (Exception ex)
            {
                lblEligibilityResult.Text = "Error: " + ex.Message;
                divEligibilityResult.Visible = true;
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}