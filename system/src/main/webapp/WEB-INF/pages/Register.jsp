<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Poppins:wght@500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/register.css">
</head>
<body>

<div class="intro-card">

  
    <nav class="main-pages">
        <a href="#">
            <div class="name-sys" style="font-family:'Sora',sans-serif;font-weight:700;font-size:20px;color:#4F8CFF;">
               Trade<span style="color:#111;">Flow</span>
            </div>
        </a>

<a href="Home.html">Home</a>
    <a href="Contact.html">Contact</a>
        <a href="About.html">About Us</a>

        <div class="sys-functions">
            <div class="nav-tabs">
                <a href="Login.html" class="nav-tab">Login</a>
                <a href="Register.html" class="nav-tab active">Register</a>
            </div>
        </div>
 </nav>
<div class="left-content">
        <div class="badge">
            <div class="badge-dot"></div>
            Create Account
 </div>
        <div class="welcome-message">
            <h2>
                Join <span>TradeFlow</span>
            </h2>

            <p>
                Create your account to manage trades, track inventory, and access your dashboard.
            </p>
        </div>
        <div class="illustration">
            <img src="<%=request.getContextPath()%>/resources/regVector.jpeg" alt="">
         
        </div>
</div> 
    <div class="register-form">
        <h2>Create Account</h2>
     <p class="sub-text">Fill in your details</p>

        <form action="<%=request.getContextPath()%>/register" method="POST" enctype="multipart/form-data">
      <div class="form-grid">
                <div class="input-group">
                    <label>First Name</label>
                    <input type="text" placeholder="First Name" name="first_name" required>
                </div>

                <div class="input-group">
                    <label>Last Name</label>
                    <input type="text" placeholder="Last Name" name="last_name" required>
                </div>
            </div>
            <div class="form-grid">
                <div class="input-group">
            <label>Email</label>
                    <input type="email" placeholder="Enter email" name="email" required>
        </div>

                <div class="input-group">
         <label>Phone</label>
                    <input type="tel" placeholder="Phone Number" name="phone" required>
                </div>
            </div>

            <div class="form-grid">
                <div class="input-group">
                    <label>Password</label>
                    <input type="password" placeholder="Password" name="password" required>
                </div>

                <div class="input-group">
               <label>Confirm Password</label>
                    <input type="password" placeholder="Repeat password" name="confirm_password" required>
                	<% if (request.getAttribute("error") != null) { %>
    					<p style="color:red;">
        					<%= request.getAttribute("error") %>
    					</p>
					<% } %>
                </div>
            </div>

           
            <div class="input-group full">
                <label>Upload Profile Image</label>
                <input type="file" accept="image/*" name="profile_img"  required>
            </div>

            <button type="submit">Create Account</button>

        </form>

    </div>

    <footer>
        © 2026 TradeFlow System. All rights reserved.
    </footer>

</div>

</body>
</html>