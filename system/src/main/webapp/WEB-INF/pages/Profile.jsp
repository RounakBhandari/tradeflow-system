<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile - TradeFlow</title>
<link rel="stylesheet" href="">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/topNav.css?v=2">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/Profile.css">
</head>
<body>
<body>

<div class="main-container">

    <div class="top-nav">
        <div class="nav-left">
            <div class="logo profile"><a href="<%= request.getContextPath() %>/admin/dashboard">TradeFlow</a></div>
        </div>
    </div>

    
    <div class="profile-container">

        <div class="profile-card">

            <h2>Edit Profile</h2>

            <div class="avatar-section">
                <img src="profile.jpg" class="avatar" alt="Profile">
                <button class="upload-btn">Change Photo</button>
            </div>

            <form class="profile-form">

                <div class="input-group">
                    <label>Full Name</label>
                    <input type="text" value="Binishaan Basnet">
                </div>

                <div class="input-group">
                    <label>Email</label>
                    <input type="email" value="binishaan@email.com">
                </div>

                <div class="input-group">
                    <label>Phone</label>
                    <input type="text" value="9800000000">
                </div>

                <div class="input-group">
                    <label>Password</label>
                    <input type="password" placeholder="New Password">
                </div>

                <button type="submit" class="save-btn">Save Changes</button>

            </form>

        </div>

    </div>

</div>

</body>
</body>
</html>