<div id="header" align="center">
 <img src="https://github.com/paweenachodpaseart/Linear-Regression-Analysis/blob/main/NewYork%20House.jpg?raw=true"width="900"/>
</div>

# Regression-Analysis
Predicting house prices in New York City 🏠

### 📌 Project Overview 
#### 1. Background & Significance
New York City is the most densely populated city in the United States and a global economic hub. The high demand for housing has led to rising prices. This project examines the factors influencing housing prices, including the number of bedrooms, number of bathrooms, living area, house type, and location, to develop a model that can accurately predict housing prices.

#### 2. Dataset
- Data Source: Kaggle (Collected by NIDULA ELGIRIYEWITHANA)
- Data Size: 4,383 rows, 6 columns
##### Key Variables:
- PRICE: Housing price (USD)
- BEDS: Number of bedrooms
- BATH: Number of bathrooms
- PROPERTYSQFT: Living area (square feet)
- TYPE: House type (Co-op, Condo, House, Multi-family home, Townhouse)
- COUNTY: Location of the house in New York City (Brooklyn, Manhattan, Queens, Staten Island, The Bronx)

#### 3. Data Analysis Methods
  1. Preliminary Data Exploration
     - Analyzed mean, median, min-max values, and standard deviation.
  2. Relationship Analysis
     - Used scatter plots to identify trends between housing prices and independent variables.
  3. Developed a Multiple Linear Regression Model
     - Incorporated multiple independent variables to predict housing prices.
     - Identified statistically significant variables.
  4. Model Assumption Testing
     - Checked for linear relationships.
     - Examined residual distribution.
     - Assessed multicollinearity among independent variables.
     - Applied log transformation to improve data distribution.
  5. Feature Selection
     - Used Forward Selection, Backward Elimination, and Stepwise Regression to determine the most influential variables.

#### 4.Results & Conclusion
- The optimal regression equation identified key factors influencing housing prices: number of bathrooms, living area, house type, and location.
- The model achieved a coefficient of determination 𝑅2 = 0.6283, indicating that these variables explain 62.83% of the variation in housing prices.
- Townhouses and Condos were found to have higher prices than Co-ops.
- Houses in Manhattan were significantly more expensive than those in Brooklyn, Queens, Staten Island, and The Bronx.

---

### 📑Conclusion
The number of bathrooms and living area are crucial factors in determining housing prices.
House type and location significantly impact housing prices.
The multiple linear regression model provides a reasonable prediction of housing prices.
These findings can assist homebuyers and real estate investors in making informed decisions about properties in New York City.

### 🛠️ Tool: R
