<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Profile - TradeFlow</title>
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

                <h2>Edit Profile</h2>

                <c:if test="${not empty successMessage}">
                    <div class="alert success">${successMessage}</div>
                </c:if>
                <c:if test="${not empty errorMessage}">
                    <div class="alert error">${errorMessage}</div>
                </c:if>

                <form class="profile-form" method="post"
                      action="<%= request.getContextPath() %>/profile"
                      enctype="multipart/form-data">

                    <!-- Avatar: shows current photo, no live preview -->
                    <div class="avatar-section">
                        <img src="<%= request.getContextPath() %>/${not empty user.profilePic ? user.profilePic : 'resources/default-avatar.png'}"
                             class="avatar" alt="Profile Photo">
                        <label for="profilePicInput" class="upload-btn">Change Photo</label>
                        
                    </div>

                    <div class="input-group">
                        <label>First Name</label>
                        <input type="text" name="firstName" value="${user.firstName}" required>
                    </div>

                    <div class="input-group">
                        <label>Last Name</label>
                        <input type="text" name="lastName" value="${user.lastName}" required>
                    </div>

                    <div class="input-group">
                        <label>Email</label>
                        <input type="email" name="email" value="${user.email}" required>
                    </div>

                    <div class="input-group">
                        <label>Phone</label>
                        <input type="text" name="phone" value="${user.phone}">
                    </div>

                    <button type="submit" class="save-btn">Save Changes</button>
                    <a class="logoutBtn" href="<%= request.getContextPath() %>/logout">Logout</a>

                </form>

                <!-- Link back to view profile -->
                <div style="text-align:center; margin-top: 12px;">
                    <a href="<%= request.getContextPath() %>/profile">← Back to Profile</a>
                </div>

            </div>
        </div>
    </div>

</body>
</html>