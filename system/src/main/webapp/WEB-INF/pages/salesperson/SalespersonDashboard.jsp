<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="<%=request.getContextPath() %>/css/topNav.css?v=2" rel="stylesheet"/>
    <link href="<%=request.getContextPath() %>/css/salespersonDashboard.css" rel="stylesheet"/>
 
    <title>SalesPerson Dashboard</title>
  </head>
  <body>
              <div class="top-nav">
                <!-- LEFT -->
                <div class="nav-left">
                    <div class="logo">
                        TradeFlow
                    </div>
                    <div class="nav-links">
                        <div class="nav-link linkSelected">
                            <a href="<%=request.getContextPath()%>/salesperson/dashboard">Dashboard</a>
                        </div>
                        <div class="nav-link">
                            <a href="<%=request.getContextPath()%>/salesperson/inventory">Inventory</a>
                        </div>
                        <div class="nav-link">
                            <a href="<%=request.getContextPath()%>/salesperson/visitRecord">Visit Records</a>
                        </div>
                        <div class="nav-link">
                            <a href="<%=request.getContextPath()%>/salesperson/order">Order</a>
                        </div>
                        <div class="nav-link">
                            <a href="<%=request.getContextPath()%>/salesperson/orderHistory">Order History</a>
                        </div>
                    </div>
                </div>
            
                <!-- RIGHT -->
                <div class="nav-right">
                    <div class="profile">
                        <img src="<%= request.getContextPath() %>/resources/logvector.jpeg" alt="Profile" onerror="this.style.display='none'">
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
            <div class="top">
                <div class="totalCollection">
                    <p>Total Collection</p>
                </div>
                <div class="dateTime">
                    <div class="dateTimeContents">
                        <p class="time">12:46 pm</p>
                        <p class="date">2026/01/01</p>
                        <p class="day">Thursday</p>
                    </div>
                </div>
            </div>
            <div class="mid">
                <div class="retailersList">
                    <table>
                        <caption>Retailers List</caption>
                        <thead>
                        <tr>
                            <th>NAME</th>
                            <th>LOCATION</th>
                            <th>CONTACT</th>
                            <th>STATUS</th>
                        </tr>
                        </thead>
                        <tr>
                            <td>Binishaan</td>
                            <td>Sanothimi</td>
                            <td>000000</td>
                            <td><button>Visit</button></td>
                        </tr>
                        <tr>
                            <td>Rounak</td>
                            <td>Mulpani</td>
                            <td>000000</td>
                            <td><button class="visited">Visited</button></td>
                        </tr>
                        <tr>
                            <td>Rivesh</td>
                            <td>Tokha</td>
                            <td>000000</td>
                            <td><button>Visit</button></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="bottom">
                <div class="todaysVisit">
                    <p>Route/Today's Visit</p>
                </div>
                <div class="pendingTaskContainer">
                    <p>Pending Tasks</p>
                    <div class="pendingTasks">
                        <div class="pendingTask"></div>
                        <div class="pendingTask"></div>
                        <div class="pendingTask"></div>
                        <div class="pendingTask"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
  </body>
</html>