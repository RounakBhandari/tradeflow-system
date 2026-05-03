<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/leftNav.css">
</head>
<body>
<div class="main-container">
    
    <div class="left-nav">
        <div class="logo">
            <img src="">
            <span>TradeFlow</span>
        </div>

        <div class="nav-links">
            <div class="nav-link"><a href="<%=request.getContextPath()%>/admin/dashboard">Dashboard</a></div>
            <div class="nav-link linkSelected"><a href="<%=request.getContextPath()%>/admin/inventory">Inventory</a></div>
            <div class="nav-link"><a href="<%=request.getContextPath()%>/admin/orderApprovals">Order Approvals</a></div>
            <div class="nav-link"><a href="<%=request.getContextPath()%>/admin/retailers">Retailers</a></div>
        </div>

        <div class="userProfile">
            <div class="profile">
                <img src="">
                <div class="profileDetails">
                    <span class="userName">Admin</span>
                    <span class="userRole">Sales Manager</span>
                </div>
            </div>
            <button class="logoutBtn">Logout</button>
        </div>
    </div>

    <div class="right-container">
        
       
    </div>

</div>

</body>
</html>