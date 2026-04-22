<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/retailerDashboard.css">
<title>Retailer Dashboard</title>
</head>
<body>

<div class="main-container">

    <div class="left-nav">
        <div class="logo">
            <img src="">
            <span>TradeFlow</span>
        </div>

        <div class="nav-links">
            <div class="nav-link linkSelected"><a href="#">Dashboard</a></div>
            <div class="nav-link"><a href="#">Orders History</a></div>
            <div class="nav-link"><a href="#">Payments</a></div>
        </div>

        <div class="userProfile">
            <div class="profile">
                <img src="">
                <div class="profileDetails">
                    <span class="userName">Binishaan</span>
                    <span class="userRole">Retailer</span>
                </div>
            </div>
            <button class="logoutBtn">Logout</button>
        </div>
    </div>

    <div class="right-container">

        <div class="top-box">
            <p>Retailer Account Overview</p>
        </div>

        <div class="section">
            <div class="section-title">Recent Orders</div>

            <table class="table">
                <thead>
                    <tr>
                        <th>ORDER ID</th>
                        <th>SUPPLIER</th>
                        <th>ITEMS</th>
                        <th>AMOUNT</th>
                        <th>STATUS</th>
                        <th>EXPECTED</th>
                    </tr>
                </thead>

                <tr>
                    <td>ORD-89212</td>
                    <td>TechNova Solutions</td>
                    <td>48 units</td>
                    <td>Rs. 12,450.00</td>
                    <td><span class="status transit">IN TRANSIT</span></td>
                    <td>Tomorrow</td>
                </tr>

                <tr>
                    <td>ORD-89105</td>
                    <td>Global Fabrications</td>
                    <td>12 units</td>
                    <td>Rs. 3,120.50</td>
                    <td><span class="status processing">PROCESSING</span></td>
                    <td>Oct 26, 2023</td>
                </tr>
            </table>

            <div class="view">View all ></div>
        </div>

        <button class="request-btn">Request Salesperson</button>

    </div>

</div>

</body>
</html>