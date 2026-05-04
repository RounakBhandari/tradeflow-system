<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - TradeFlow</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Contact.css">
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

<div class="hero">
<h2>Get in Touch with us</h2>
<p>We'd love to hear from you! Reach out to us with any questions or feedback.</p>
</div>
<div class="contact">
<div class="contact-form">
    <form action="#">
        <h2>Send your feedback</h2>
        <input type="text" placeholder="Your Name" required>
        <input type="email" placeholder="Your Email" required>
        <textarea placeholder="Your Message" required></textarea>
        <button type="submit">Send Message</button>
    </form>
</div>
<div class="contact-info">
    <h2>Contact Information</h2>
    <p><strong>Email:</strong> info@tradeflow.com</p>
    <p><strong>Phone:</strong> +977 984000000</p>
    <p><strong>Address:</strong> Kathmandu, Nepal</p>
    <div class="note">
            We usually respond within 24 hours.
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