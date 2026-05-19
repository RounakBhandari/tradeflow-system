<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Profile - TradeFlow</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/topNav.css?v=2">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Profile.css">
</head>
<body>

    <div class="top-nav">
        <div class="nav-left">
            <div class="logo profile">
                <a href="<%= request.getContextPath() %>/admin/dashboard">TradeFlow</a>
            </div>
        </div>
    </div>

    <div class="main-container">
        <div class="profile-container">
            <div class="profile-card">

                <h2>My Profile</h2>

                <c:if test="${not empty errorMessage}">
                    <div class="alert error">${errorMessage}</div>
                </c:if>

                <!-- Avatar -->
                <div class="avatar-section">
                    <img src="<%= request.getContextPath() %>/${not empty user.profilePic ? user.profilePic : 'resources/default-avatar.png'}"
                         class="avatar" alt="Profile Photo">
                </div>

                <!-- Read-only fields -->
                <div class="input-group">
                    <label>First Name</label>
                    <p class="profile-value">${user.firstName}</p>
                </div>

                <div class="input-group">
                    <label>Last Name</label>
                    <p class="profile-value">${user.lastName}</p>
                </div>

                <div class="input-group">
                    <label>Email</label>
                    <p class="profile-value">${user.email}</p>
                </div>

                <div class="input-group">
                    <label>Phone</label>
                    <p class="profile-value">${not empty user.phone ? user.phone : '—'}</p>
                </div>

                <!-- Edit and Logout -->
                <div class="profile-actions">
                    <a class="save-btn" href="<%= request.getContextPath() %>/editProfile">Edit Profile</a>
                    <a class="logoutBtn" href="<%= request.getContextPath() %>/logout">Logout</a>
                </div>

            </div>
        </div>
    </div>

</body>
</html>