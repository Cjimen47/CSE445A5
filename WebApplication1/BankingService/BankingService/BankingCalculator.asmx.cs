
using System;
using System.Web.Services;

namespace BankingService
{
    /// <summary>
    /// Banking Calculator Service provides various financial calculations for banking applications
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [System.Web.Script.Services.ScriptService]
    public class BankingCalculator : System.Web.Services.WebService
    {
        /// <summary>
        /// Calculates simple interest for a given principal, rate and time period
        /// </summary>
        /// <param name="principal">Initial amount (in dollars)</param>
        /// <param name="rate">Annual interest rate (in percentage)</param>
        /// <param name="years">Time period (in years)</param>
        /// <returns>The interest amount</returns>
        [WebMethod]
        public double CalculateSimpleInterest(double principal, double rate, int years)
        {
            // Simple Interest = Principal × Rate × Time
            return principal * (rate / 100) * years;
        }

        /// <summary>
        /// Calculates compound interest for a given principal, rate, time period and compounding frequency
        /// </summary>
        /// <param name="principal">Initial amount (in dollars)</param>
        /// <param name="rate">Annual interest rate (in percentage)</param>
        /// <param name="years">Time period (in years)</param>
        /// <param name="compoundingFrequency">Number of times interest is compounded per year (1=annually, 4=quarterly, 12=monthly, 365=daily)</param>
        /// <returns>The future value after compound interest</returns>
        [WebMethod]
        public double CalculateCompoundInterest(double principal, double rate, int years, int compoundingFrequency)
        {
            // Compound Interest = Principal × (1 + Rate/Frequency)^(Frequency×Time) - Principal
            double rateDecimal = rate / 100;
            double futureValue = principal * Math.Pow(1 + (rateDecimal / compoundingFrequency), compoundingFrequency * years);
            return futureValue - principal;
        }

        /// <summary>
        /// Calculates monthly payment for a loan
        /// </summary>
        /// <param name="loanAmount">Total loan amount (in dollars)</param>
        /// <param name="annualInterestRate">Annual interest rate (in percentage)</param>
        /// <param name="loanTermYears">Loan term (in years)</param>
        /// <returns>Monthly payment amount</returns>
        [WebMethod]
        public double CalculateMonthlyLoanPayment(double loanAmount, double annualInterestRate, int loanTermYears)
        {
            double monthlyRate = (annualInterestRate / 100) / 12;
            int numberOfPayments = loanTermYears * 12;

            if (monthlyRate == 0)
                return loanAmount / numberOfPayments;

            double monthlyPayment = loanAmount *
                (monthlyRate * Math.Pow(1 + monthlyRate, numberOfPayments)) /
                (Math.Pow(1 + monthlyRate, numberOfPayments) - 1);

            return Math.Round(monthlyPayment, 2);
        }

        /// <summary>
        /// Calculates future value of regular deposits
        /// </summary>
        /// <param name="monthlyDeposit">Monthly deposit amount (in dollars)</param>
        /// <param name="annualInterestRate">Annual interest rate (in percentage)</param>
        /// <param name="years">Number of years</param>
        /// <returns>Future value of savings</returns>
        [WebMethod]
        public double CalculateSavingsFutureValue(double monthlyDeposit, double annualInterestRate, int years)
        {
            double monthlyRate = (annualInterestRate / 100) / 12;
            int months = years * 12;

            if (monthlyRate == 0)
                return monthlyDeposit * months;

            double futureValue = monthlyDeposit * ((Math.Pow(1 + monthlyRate, months) - 1) / monthlyRate);
            return Math.Round(futureValue, 2);
        }

        /// <summary>
        /// Determines if a user is eligible for a loan based on income, credit score, and existing debt
        /// </summary>
        /// <param name="annualIncome">Annual income (in dollars)</param>
        /// <param name="creditScore">Credit score (300-850)</param>
        /// <param name="monthlyDebt">Current total monthly debt payments (in dollars)</param>
        /// <param name="requestedLoanAmount">Requested loan amount (in dollars)</param>
        /// <returns>True if eligible, false otherwise</returns>
        [WebMethod]
        public bool CheckLoanEligibility(double annualIncome, int creditScore, double monthlyDebt, double requestedLoanAmount)
        {
            // Calculate debt-to-income ratio
            double monthlyIncome = annualIncome / 12;
            double debtToIncomeRatio = monthlyDebt / monthlyIncome;

            // Minimum credit score requirement
            bool creditScoreOk = creditScore >= 620;

            // Maximum debt-to-income ratio (typically 43% for mortgages)
            bool debtRatioOk = debtToIncomeRatio <= 0.43;

            // Loan amount should not exceed 5 times annual income for basic eligibility
            bool loanAmountOk = requestedLoanAmount <= (annualIncome * 5);

            return creditScoreOk && debtRatioOk && loanAmountOk;
        }
    }
}