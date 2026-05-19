<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="<%= request.getContextPath() %>/css/topNav.css?v=2">
    </head>

    <body>

        <div class="top-nav">
            <!-- LEFT -->
            <div class="nav-left">
                <div class="logo">
                    TradeFlow
                </div>
                <div class="nav-links">
                    <div class="nav-link">
                        <a href="<%=request.getContextPath()%>/admin/dashboard">Dashboard</a>
                    </div>
                    <div class="nav-link">
                        <a href="<%=request.getContextPath()%>/admin/inventory">Inventory</a>
                    </div>
                    <div class="nav-link">
                        <a href="<%=request.getContextPath()%>/admin/orderApprovals">Order Approvals</a>
                    </div>
                    <div class="nav-link">
                        <a href="<%=request.getContextPath()%>/admin/pendingUsers">User Approvals</a>
                    </div>
                    <div class="nav-link linkSelected">
                        <a href="<%=request.getContextPath()%>/admin/retailers">Retailers</a>
                    </div>
                    <div class="nav-link">
                        <a href="#">Transactions</a>
                    </div>
                </div>
            </div>

            <!-- RIGHT -->
            <div class="nav-right">
                <div class="profile">
                    <img src="<%= request.getContextPath() %>/resources/logvector.jpeg" alt="Profile"
                        onerror="this.style.display='none'">
                    <div class="profileDetails">
                        <span class="userName">Admin</span>
                        <span class="userRole">Sales Manager</span>
                    </div>
                </div>
                <button class="logoutBtn" onclick="location.href='<%=request.getContextPath()%>/login'">Logout</button>
            </div>
        </div>

        <div class="main-container">

            <div class="right-container">


            </div>

        </div>

    </body>

    </html>