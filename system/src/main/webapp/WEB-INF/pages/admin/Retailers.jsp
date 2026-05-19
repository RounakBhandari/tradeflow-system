<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>TradeFlow - Retailers</title>
        <link rel="stylesheet" href="<%= request.getContextPath() %>/css/topNav.css?v=2">
                <link rel="stylesheet" href="<%= request.getContextPath() %>/css/adminRetailers.css?v=2">
    </head>

    <body>
 <div class="main-container">
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
                        <a href="<%=request.getContextPath()%>/admin/transactions">Transactions</a>
                    </div>
                </div>
            </div>

            <!-- RIGHT -->
            <div class="nav-right">
                <div class="profile">
                    <img src="<%= request.getContextPath() %>/resources/logvector.jpeg" alt="Profile"
                        onerror="this.style.display='none'">
                    <div class="profileDetails">
                        <span class="userName profile"><a href="<%=request.getContextPath()%>/profile">Admin</a></span>
                        <span class="userRole">Sales Manager</span>
                    </div>
                </div>
                <button class="logoutBtn" onclick="location.href='<%=request.getContextPath()%>/login'">Logout</button>
            </div>
        </div>

 <div class="content-container">

    <!-- HEADER -->
    <div class="hero">
        <h1>Retailers</h1>
        <p>Manage and view all registered retailers</p>
    </div>

    <!-- TABLE SECTION -->
    <div class="section">

        <div class="section-header">
            <h2 class="section-title">All Retailers</h2>
        </div>

        <table class="table">

            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Status</th>
                    <th>Joined Date</th>
                    <th>Action</th>
                </tr>
            </thead>

            <tbody>

                <tr>
                    <td>#R101</td>
                    <td>Rounak Bhandari</td>
                    <td>rounak@email.com</td>
                    <td>9800000000</td>
                    <td><span class="status transit">Active</span></td>
                    <td>2026-01-10</td>
                    <td>
                        <button class="view">View</button>
                    </td>
                </tr>

                <tr>
                    <td>#R102</td>
                    <td>Sujan Shrestha</td>
                    <td>sujan@email.com</td>
                    <td>9811111111</td>
                    <td><span class="status transit">Active</span></td>
                    <td>2026-02-15</td>
                    <td>
                        <button class="view">View</button>
                    </td>
                </tr>

            </tbody>

        </table>

    </div>

</div>
 </div>      

 

    </body>

    </html>