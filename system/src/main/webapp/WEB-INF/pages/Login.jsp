<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Poppins:wght@500;600&display=swap" rel="stylesheet">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome!</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/login.css">
    
</head>
<body>

<div class="intro-card">

    <nav class="main-pages">
        <a href="#">
            <div class="name-sys" style="font-family:'Sora',sans-serif;font-weight:700;font-size:20px;color:#4F8CFF;">
                Trade<span style="color:#111;">Flow</span>
            </div>
        </a>

         <a href="<%=request.getContextPath()%>/home">Home</a>
        <a href="<%=request.getContextPath()%>/contactUs">Contact Us</a>
        <a href="<%=request.getContextPath()%>/aboutUs">About Us</a>

        <div class="sys-functions">
            <div class="nav-tabs">
                <a href="<%=request.getContextPath()%>/login" class="nav-tab active">Login</a>
                <a href="<%=request.getContextPath()%>/register" class="nav-tab ">Register</a>

            </div>
        </div>
    </nav>

    <div class="left-content">
        <div class="badge">
            <div class="badge-dot"></div>
            Trade Management Platform
        </div>

        <div class="illustration">
            <img src="<%= request.getContextPath()%>/resources/logvector.jpeg" alt="">
        </div>

        <div class="welcome-message">
            <h2>
                Sign In to
                <span style="color:#4F8CFF;">TradeFlow</span>
                System
            </h2>

            <p>
                Experience high-precision trade management with our curated data dashboard. Clarity meets complexity.
            </p>

            <div class="features">
                <div class="feat-pill"><i data-lucide="package"></i>Order Tracking</div>
                <div class="feat-pill"><i data-lucide="bar-chart-2"></i>Reports</div>
                <div class="feat-pill"><i data-lucide="refresh-cw"></i>Stock Updates</div>
            </div>
        </div>
    </div>

    <footer>
        © 2026 TradeFlow System. All rights reserved.
    </footer>

    <div class="login-form">
        <h2>Welcome Back!!</h2>
        <p class="sub-text">Login to your account</p>

        <form method="post" action="<%=request.getContextPath()%>/login">
            <div class="input-group">
                <label>Email</label>
                <input type="email" placeholder="Enter your email" name="email" required>
            </div>

            <div class="input-group">
                <label>Password</label>
                <input type="password" placeholder="Enter your password" name="password" required>
            </div>
            <button type="submit">Login</button>
        </form>
    </div>

</div>


</body>
</html>