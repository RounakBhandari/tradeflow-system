<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

 <a href="<%=request.getContextPath()%>/home">Home</a>
        <a href="<%=request.getContextPath()%>/contactUs">Contact Us</a>
        <a href="<%=request.getContextPath()%>/aboutUs">About Us</a>

        <div class="sys-functions">
            <div class="nav-tabs">
                <a href="<%=request.getContextPath()%>/login" class="nav-tab">Login</a>
                <a href="<%=request.getContextPath()%>/" class="nav-tab active">Register</a>
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
                    <label for="first_name" >First Name</label>
                    <input type="text" placeholder="First Name" id="first_name" name="first_name" required>
                </div>

                <div class="input-group">
                    <label for="last_name">Last Name</label>
                    <input type="text" placeholder="Last Name" id="last_name" name="last_name" required>
                </div>
            </div>
            <div class="form-grid">
                <div class="input-group">
            <label for="email">Email</label>
                    <input type="email" placeholder="Enter email" id="email" name="email" required>
        </div>

                <div class="input-group">
         <label for="phone">Phone</label>
                    <input type="tel" placeholder="Phone Number" id="phone" name="phone"required>
                </div>
            </div>

            <div class="form-grid">
                <div class="input-group">
                    <label for="password">Password</label>
                    <input type="password" placeholder="Password" id="password" name="password" required>
                </div>

                <div class="input-group">
               <label for="confirm_password">Confirm Password</label>
                    <input type="password" placeholder="Confirm password" id="confirm_password" name="confirm_password" required>
                	<c:if test="${not empty error}">
    					<p style="color:red;">${error}</p>
					</c:if>
                </div>
            </div>

         <div class="input-group">
         	<label for="address">Address</label>
         	<input type="text" placeholder="Enter Address" id="address" name="address" required>
         </div>
         
    
      <div class="role-row">
    <label for="role">Role :</label>
    <select name="role" id="role"  required>
        <option value="" disabled selected>Choose your role</option>
        <option value="salesperson">Sales Person</option>
        <option value="retailer">Retailer</option>
    </select>
</div>         
         
         
         
            <div class="input-group full">
                <label>Upload Profile Image</label>
                <input type="file" accept="image/*" id="profile_img" name="profile_img" required>
            </div>

            <button type="submit" class="register">Create Account</button>

        </form>

    </div>

    <footer>
        © 2026 TradeFlow System. All rights reserved.
    </footer>

</div>

</body>
</html>