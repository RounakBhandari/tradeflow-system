<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - TradeFlow</title>
   <link rel="stylesheet" href="<%= request.getContextPath() %>/css/About.css">
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
<div class="hero">
    <h1>Aboutx TradeFlow</h1>
    <p>Building a smarter way to manage trade operations between companies and retailers.</p>
</div>
<div class="container">

   
    <div class="card">
        <div class="text">
            <h2>Our Mission</h2>
            <p>TradeFlow System is designed with the goal of simplifying and modernizing trade operations between companies and retailers. 
                Our mission is to eliminate manual processes and replace them with a centralized digital platform that improves accuracy,
             transparency, and efficiency. By bringing orders, payments, and communication into one system, we aim to reduce operational errors and help businesses manage their day-to-day activities with greater control and confidence.

                 </p>
        </div>

        <img src="ourmission.png" alt="mission">
    </div>


    <div class="card reverse">
        <div class="text">
            <h2>What We Do</h2>
            <p>TradeFlow connects retailers, salespersons, and sales managers through a structured and easy-to-use platform. Retailers can place orders and track their dues, while salespersons manage field visits, collect payments, and assist with order processing.
                 Managers oversee inventory, approve orders, and generate reports for better decision-making. The system ensures that every transaction and activity is properly recorded, making trade operations more organized and reliable.
                </p>
        </div>

        <img src="work.jpg" alt="work">
    </div>

   
    <div class="card">
        <div class="text">
            <h2>Why TradeFlow</h2>
            <p>TradeFlow was built to solve common challenges in traditional trade systems such as miscommunication, manual record-keeping, and lack of transparency. By digitizing the entire workflow, it ensures real-time tracking of orders, payments, and customer interactions. This not only reduces errors but also improves accountability across all roles. 
                With a clean and structured system, businesses can operate more efficiently and make informed decisions based on accurate data.
                   </p>
        </div>

        <img src="Why.jpg" alt="why">
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