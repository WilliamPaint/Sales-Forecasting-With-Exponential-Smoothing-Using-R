<h1>Forecasting Superstore Sales with ETS (R)</h1>
<img width="800" height="239" alt="image" src="https://github.com/user-attachments/assets/dc0e945d-2a8a-4c23-8f3b-67950689ef46" />

<div style="margin:12px 0 18px 0;">
  <span style="background:#0f172a;color:#fff;padding:6px 10px;border-radius:6px;font-size:13px;font-weight:600;">
    Time Series Forecasting
  </span>
  <span style="background:#1f2937;color:#fff;padding:6px 10px;border-radius:6px;font-size:13px;font-weight:600;margin-left:6px;">
    R • ETS • ARIMA
  </span>
  <span style="background:#111827;color:#fff;padding:6px 10px;border-radius:6px;font-size:13px;font-weight:600;margin-left:6px;">
    ADF • Diagnostics • Inventory Planning
  </span>
</div>

<hr/>

<!-- Optional: Project Cover Image -->
<!-- Upload an image to /assets/ and uncomment below -->
<!--
<p align="center">
  <img src="assets/project_cover.png" width="820" alt="Project cover" style="pointer-events:none;" />
</p>
-->

<div style="background:#f3f4f6;padding:8px 12px;border-left:5px solid #2563eb;margin:18px 0 10px 0;">
  <strong>Skills</strong>
</div>
<p>
  <strong>R</strong> • Time Series Forecasting • Exponential Smoothing (ETS) • ARIMA •
  ADF Test • Model Diagnostics (ACF/Residuals)
</p>

<div style="background:#f3f4f6;padding:8px 12px;border-left:5px solid #6366f1;margin:18px 0 10px 0;">
  <strong>Overview</strong>
</div>
<p>
  This project applies time series forecasting to Superstore’s monthly retail sales data (2014–2017)
  to support inventory planning and marketing decisions. Three models were evaluated — Naïve, ARIMA,
  and ETS (Exponential Smoothing). The ETS model delivered the strongest performance and was used
  to forecast sales through 2019.
</p>

<div style="background:#f3f4f6;padding:8px 12px;border-left:5px solid #eab308;margin:18px 0 10px 0;">
  <strong>Objectives</strong>
</div>
<ul>
  <li>Compare forecasting models (Naïve, ARIMA, ETS) for retail sales prediction.</li>
  <li>Identify the most accurate model for forecasting monthly sales.</li>
  <li>Provide insights to optimize inventory, marketing, and operations.</li>
</ul>

<div style="background:#f3f4f6;padding:8px 12px;border-left:5px solid #16a34a;margin:18px 0 10px 0;">
  <strong>Methodology</strong>
</div>
<ul>
  <li><strong>Data Source:</strong> Superstore sales dataset (2014–2017), aggregated monthly.</li>
  <li><strong>Transformation:</strong> Stationarity tested using Augmented Dickey-Fuller (ADF); no differencing required.</li>
  <li><strong>Modeling:</strong>
    <ul>
      <li>Naïve (baseline)</li>
      <li>ARIMA (auto.arima; ARIMA (2,1,2) explored)</li>
      <li>ETS (trend + seasonality)</li>
    </ul>
  </li>
  <li><strong>Validation:</strong> Train (2014–2016), Test (2017); evaluated using MASE and MSE.</li>
  <li><strong>Diagnostics:</strong> ACF plots and residual analysis used to check model assumptions.</li>
</ul>

<div style="background:#f3f4f6;padding:8px 12px;border-left:5px solid #db2777;margin:18px 0 10px 0;">
  <strong>Key Findings</strong>
</div>
<ul>
  <li><strong>Best model:</strong> ETS achieved the lowest errors (MASE = <strong>1.196</strong>, MSE = <strong>244,857.13</strong>).</li>
  <li>ETS captured both trend and seasonal patterns effectively, outperforming ARIMA (which showed signs of overfitting).</li>
  <li>Forecasts projected steady growth with strong seasonal peaks in mid-year and end-of-year months.</li>
</ul>

<div style="background:#f3f4f6;padding:8px 12px;border-left:5px solid #22c55e;margin:18px 0 10px 0;">
  <strong>Recommendations</strong>
</div>
<ul>
  <li>Reduce overstock-related costs (~$150K annually).</li>
  <li>Improve inventory turnover by 10–15%.</li>
  <li>Boost seasonal sales by 5–8% via targeted promotions.</li>
</ul>

<div style="background:#f3f4f6;padding:8px 12px;border-left:5px solid #06b6d4;margin:18px 0 10px 0;">
  <strong>Impact</strong>
</div>
<p>
  This project demonstrates how ETS-based forecasts can improve retail decision-making by optimizing
  inventory, reducing uncertainty, and strategically timing promotions. The approach is transferable
  to supply chain planning, financial forecasting, and demand management across industries.
</p>

<div style="background:#f3f4f6;padding:8px 12px;border-left:5px solid #7c3aed;margin:18px 0 10px 0;">
  <strong>Files</strong>
</div>
<ul>
  <li><code>/notebooks/</code> – R scripts used for modeling</li>
</ul>


