# Cashew-Eco-Efficiency: Stochastic Frontier Analysis (SFA) & Tobit Modeling

## 📌 Context & Overview
In agroforestry, reaching maximum production potential is as much about technical skill as it is about resources. This project evaluates the technical efficiency of cashew agroforestry farms in Benin. By estimating a "production frontier," we quantify how close farmers are to optimal technology and identify the socio-economic factors that hinder their performance.

## 🎯 Objectives
* **Efficiency Estimation:** Measuring individual technical efficiency scores relative to the stochastic production frontier.
* **Determinant Analysis:** Identifying structural and socio-economic drivers of efficiency variations.
* **Productivity Optimization:** Quantifying the potential output gains achievable through best-practice adoption.

## 🛠️ Statistical Methodology & Tech Stack
* **Language:** R 📊
* **Key Frameworks:** `frontier` (for SFA), `AER` / `VGAM` (for Tobit modeling).

### Mathematical Approach:
1. **Stochastic Frontier Analysis (SFA):** Implementation of a **Cobb-Douglas Log function** to separate the error term into random noise ($v$) and technical inefficiency ($u$).
   $$\ln(Y_i) = \beta_0 + \sum \beta_j \ln(X_{ji}) + v_i - u_i$$
2. **Efficiency Diagnostics:** Calculation of the **Gamma parameter ($\gamma$)** to determine the share of total variance attributed to inefficiency.
3. **Tobit Regression:** Using a censored regression model (0 to 1) to analyze the determinants of efficiency scores, accounting for data truncation.



## 🚀 Key Results
* **Production Dynamics:** * Strong positive elasticity for land area (+2.37), indicating **increasing returns to scale**.
    * Access to extension services and education significantly shifts the production frontier upward.
* **Efficiency Scores:**
    * **Mean Efficiency:** 51.7% (Farmers are only operating at half their potential).
    * **Gap Analysis:** 48.3% of current production is "lost" due to technical inefficiency.
    * **Gamma ($\gamma$):** 51.85% of output variance is strictly due to inefficiency, not random luck.
* **Determinants:** Interestingly, experience showed a slight negative impact on efficiency, while gender and surface area influenced the *potential* but not the *optimal use* of resources.

## 🔮 Perspectives for Improvement
* **Functional Robustness:** Testing a **Translog** function to allow for non-constant elasticities of substitution.
* **Exogenous Factors:** Integrating soil quality and land tenure security data.
* **Advanced Econometrics:** Experimenting with Bayesian or Hierarchical censored models to refine the significance of efficiency drivers.
