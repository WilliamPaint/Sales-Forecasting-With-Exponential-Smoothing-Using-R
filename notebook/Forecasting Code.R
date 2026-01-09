# Load libraries
library(readxl)
library(dplyr)
library(ggplot2)
library(lubridate)

# Load the dataset from your specified path
superstore <- read_excel("C:/Users/Willi/OneDrive/Desktop/Forcasting Sales/Superstore - Sales.xlsx", sheet = "Sales")

# Convert Order Date to Date format
superstore$`Order Date` <- as.Date(superstore$`Order Date`)

# Summarize monthly sales
monthly_sales <- superstore %>%
  mutate(Month = floor_date(`Order Date`, unit = "month")) %>%
  group_by(Month) %>%
  summarise(Total_Sales = sum(Sales, na.rm = TRUE))

# Plot monthly sales trend
ggplot(monthly_sales, aes(x = Month, y = Total_Sales)) +
  geom_line(color = "steelblue", size = 1) +
  geom_point(color = "darkred") +
  labs(title = "Monthly Sales Trend",
       x = "Month",
       y = "Total Sales") +
  theme_minimal()


# Plot a histogram of Sales
ggplot(superstore, aes(x = Sales)) +
  geom_histogram(binwidth = 50, fill = "skyblue", color = "black") +
  scale_x_continuous(limits = c(0, 2000)) +  # adjust to focus on typical range
  labs(title = "Sales Distribution",
       x = "Sales Amount",
       y = "Frequency") +
  theme_minimal()


# Summary statistics
summary(superstore$Sales)


# Boxplot to spot outliers
ggplot(superstore, aes(y = Sales)) +
  geom_boxplot(fill = "tomato", color = "black") +
  coord_cartesian(ylim = c(0, 3000)) +  # zoom in to better visualize lower-end outliers
  labs(title = "Boxplot of Sales",
       y = "Sales") +
  theme_minimal()




# Step 1: Aggregate monthly sales (already done previously)
monthly_sales <- superstore %>%
  mutate(Month = floor_date(`Order Date`, unit = "month")) %>%
  group_by(Month) %>%
  summarise(Total_Sales = sum(Sales, na.rm = TRUE))

# Step 2: Create time series object
sales_ts <- ts(monthly_sales$Total_Sales,
               start = c(year(min(monthly_sales$Month)), month(min(monthly_sales$Month))),
               frequency = 12)  # monthly frequency

# Step 3: Plot time series
plot(sales_ts,
     main = "Monthly Sales Time Series",
     ylab = "Sales",
     xlab = "Time",
     col = "blue") 





# Step 1: Install (if needed) and load required packages
if (!require(forecast)) install.packages("forecast", dependencies = TRUE)
if (!require(ggplot2)) install.packages("ggplot2", dependencies = TRUE)

library(forecast)
library(ggplot2)

# Step 2: Suppress scientific notation
options(scipen = 999)

# Step 3: Create Naïve Forecast Model
naive_model <- naive(sales_ts, h = 12)

# Step 4: Plot Forecast
autoplot(naive_model) +
  labs(title = "Naïve Forecast for Monthly Sales",
       x = "Year",
       y = "Forecasted Sales") +
  theme_minimal()

# Step 5: Evaluate Forecast Accuracy
accuracy(naive_model) 
summary(naive_model)


#############
# Load TTR for moving average (optional if not installed)
if (!require(TTR)) install.packages("TTR", dependencies = TRUE)
library(TTR)

# Step 1: Apply 3-month moving average
ma_3 <- SMA(sales_ts, n = 3)

# Step 2: Plot original vs 3-month moving average
plot(sales_ts,
     main = "3-Month Moving Average vs. Original Sales",
     ylab = "Sales",
     xlab = "Time",
     col = "gray")
lines(ma_3, col = "blue", lwd = 2)
legend("topleft", legend = c("Original Sales", "3-Month MA"),
       col = c("gray", "blue"), lwd = 2)

###################subject to change





# Load required packages
if (!require(forecast)) install.packages("forecast", dependencies = TRUE)
library(forecast)

# Suppress scientific notation
options(scipen = 999)

# Step 1: Fit ETS model
ets_model <- ets(sales_ts)

# Step 2: Forecast the next 12 months
ets_forecast <- forecast(ets_model, h = 12)

# Step 3: Plot ETS forecast
autoplot(ets_forecast) +
  labs(title = "Exponential Smoothing (ETS) Forecast for Monthly Sales",
       x = "Year",
       y = "Forecasted Sales") +
  theme_minimal()

# Step 4: Evaluate model accuracy
accuracy(ets_forecast)
summary(ets_forecast)



# Load required packages
if (!require(forecast)) install.packages("forecast", dependencies = TRUE)
library(forecast)

# Suppress scientific notation
options(scipen = 999)

# Step 1: Fit ARIMA model automatically
arima_model <- auto.arima(sales_ts)

# Step 2: Forecast the next 12 months
arima_forecast <- forecast(arima_model, h = 12)

# Step 3: Plot ARIMA forecast
autoplot(arima_forecast) +
  labs(title = "ARIMA Forecast for Monthly Sales",
       x = "Year",
       y = "Forecasted Sales") +
  theme_minimal()

# Step 4: Evaluate model accuracy
accuracy(arima_forecast)
summary(arima_forecast)


##check stationarity

if (!require(tseries)) install.packages("tseries", dependencies = TRUE)
library(tseries)

# Augmented Dickey-Fuller Test
adf.test(sales_ts)


# Compare model accuracy using metrics from full dataset (row 1)
accuracy_df <- data.frame(
  Model = c("Naive", "ETS", "ARIMA"),
  MASE = c(accuracy(naive_model)[1, "MASE"],
           accuracy(ets_forecast)[1, "MASE"],
           accuracy(arima_forecast)[1, "MASE"]),
  RMSE = c(accuracy(naive_model)[1, "RMSE"],
           accuracy(ets_forecast)[1, "RMSE"],
           accuracy(arima_forecast)[1, "RMSE"]),
  MAE = c(accuracy(naive_model)[1, "MAE"],
          accuracy(ets_forecast)[1, "MAE"],
          accuracy(arima_forecast)[1, "MAE"])
)

print(accuracy_df)




# ACF plots for residuals of each model
par(mfrow = c(1, 3))  # Plot side-by-side
Acf(residuals(naive_model), main = "ACF Naive Model")
Acf(residuals(ets_model), main = "ACF ETS")
Acf(residuals(arima_model), main = " ACF ARIMA ")
par(mfrow = c(1, 1))  # Reset layout



# Time series residual plots
tsdisplay(residuals(naive_model), main = "Naive Model Residuals")
tsdisplay(residuals(ets_model), main = "ETS Model Residuals")
tsdisplay(residuals(arima_model), main = "ARIMA Model Residuals")




library(patchwork)  # install.packages("patchwork") if needed

# Create plots for each forecast
naive_plot <- autoplot(naive_model) +
  ggtitle("Naïve Forecast") + theme_minimal()

ets_plot <- autoplot(ets_forecast) +
  ggtitle("ETS Forecast") + theme_minimal()

arima_plot <- autoplot(arima_forecast) +
  ggtitle("ARIMA Forecast") + theme_minimal()

# Combine plots side-by-side
naive_plot + ets_plot + arima_plot











# Load required packages
library(forecast)
library(ggplot2)

# ---- Naïve Forecast Plot ----
naive_plot <- autoplot(naive_model) +
  ggtitle("Naïve Forecast") +
  xlab("Year") + ylab("Forecasted Sales") +
  theme_minimal()

# View plot
print(naive_plot)

# Save plot to file
ggsave("naive_forecast_plot.png", plot = naive_plot, width = 8, height = 5)


# ---- ETS Forecast Plot ----
ets_plot <- autoplot(ets_forecast) +
  ggtitle("ETS Forecast") +
  xlab("Year") + ylab("Forecasted Sales") +
  theme_minimal()

# View plot
print(ets_plot)

# Save plot to file
ggsave("ets_forecast_plot.png", plot = ets_plot, width = 8, height = 5)


# ---- ARIMA Forecast Plot ----
arima_plot <- autoplot(arima_forecast) +
  ggtitle("ARIMA Forecast") +
  xlab("Year") + ylab("Forecasted Sales") +
  theme_minimal()

# View plot
print(arima_plot)

# Save plot to file
ggsave("arima_forecast_plot.png", plot = arima_plot, width = 8, height = 5)


#Differencing to get stationary time series
# Load the required package
library(forecast)

# Apply first-order differencing
sales_diff <- diff(sales_ts, differences = 1)

# Plot the differenced series
plot(sales_diff,
     main = "Differenced Monthly Sales Time Series (1st Order)",
     ylab = "Differenced Sales",
     xlab = "Time",
     col = "black")






