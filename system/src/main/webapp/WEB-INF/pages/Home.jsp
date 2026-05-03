<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TradeFlow System</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/Home.css">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
</head>
<body>


<div class="navbar">
    <div class="logo"><a href="<%=request.getContextPath()%>/home">TradeFlow</a></div>
    <div class="nav-links">
        <a href="<%=request.getContextPath()%>/home">Home</a>
        <a href="<%=request.getContextPath()%>/contactUs">Contact Us</a>
        <a href="<%=request.getContextPath()%>/aboutUs">About Us</a>
        <a href="<%=request.getContextPath()%>/login" class="login-btn">Login</a>
        <a href="<%=request.getContextPath()%>/register" class="register-btn">Register</a>
    </div>
</div>
<div class="main-container">
  <div class="content">

    <div class="left-content">
        <h1>
            Welcome to <span style="color:#2563eb;">TradeFlow</span>
        </h1>

        <div class="left-subtext">
            <p>
                Experience high-precision trade management with our curated data dashboard.
                Clarity meets complexity.
            </p>

            <a href="Register.html" class="start-btn">
                Get Started →
            </a>
        </div>
    </div>

    <div class="right-content">
        <img src="Homeimg.jpg" alt="">
    </div>
</div>
<h2 class="hero">Core Features</h2>
<div class="features">
    <div class="feature-item">
            <h3>Real-Time Data</h3>
            <p>Access up-to-the-minute market data for informed trading decisions.</p>
        </div>
        <div class="feature-item">
            <h3>Customizable Dashboard</h3>
            <p>Tailor your dashboard to focus on the metrics that matter most to you.</p>
        </div>
        <div class="feature-item">
            <h3>Advanced Analytics</h3>
            <p>Leverage powerful analytics tools to identify trends and optimize your strategy.</p>
        </div>
        <div class="feature-item">
            <h3>Order Approval System</h3>
            <p>Approve or reject orders with full visibility to ensure controlled and accurate processing.</p>
        </div>
        <div class="feature-item">
            <h3>Payment Collection System</h3>
            <p>Streamline your payment processes with our efficient collection system.</p>
        </div>
        <div class="feature-item">
            <h3>Visit Tracking</h3>
            <p>Track and analyze visitor behavior to optimize your marketing strategies.</p>
        </div>
</div>
<h2 class="hero">User Roles</h2>
<div class="roles">
    <div class="role-item">
        <h3>Sales Manager</h3>
        <p>Manage users, oversee system operations, and ensure smooth functioning of the platform.</p>
    </div>
    <div class="role-item">
        <h3>Sales Person</h3>
        <p>Acts as a field agent who visits retailers, records interactions, collects payments, and places orders on their behalf to ensure smooth trade operations.</p>
    </div>
     <div class="role-item">
        <h3>Retailer</h3>
        <p>Execute trades, analyze market data, and optimize trading strategies for maximum profitability.</p>
    </div>
</div>
</div>
<footer class="footer">

    <div class="footer-container">

       
        <div class="footer-links">
            <h4>Quick Links</h4>
            <a href="Home.html">Home</a>
            <a href="About.html">About Us</a>
            <a href="Contact.html">Contact Us</a>
        </div>

        <div class="footer-links">
            <h4>Account</h4>
            <a href="Login.html">Login</a>
            <a href="Register.html">Register</a>
        </div>

    </div>
     <div class="footer-left">
            <h2>TradeFlow</h2>
            <p>TradeFlow System is a web-based platform designed to streamline and manage trade operations between a trading company and its retailers.

                
            </p>
        </div>


    <div class="footer-bottom">
        <p>© 2026 TradeFlow System. All rights reserved.</p>
    </div>

</footer>
</body>
</html>