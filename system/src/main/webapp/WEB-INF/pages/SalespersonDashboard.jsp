<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="<%=request.getContextPath() %>/css/salespersonDashboard.css" rel="stylesheet"/>
 
    <title>SalesPerson Dashboard</title>
  </head>
  <body>
    <div class="main-container">
        <div class="left-nav">
            <nav>
                <div class="logo">
                    <img src="" alt="logo">
                    <h3>TradeFlow</h3>
                </div>
                <div class="nav-links">
                    <div class="nav-link linkSelected"><a href="">Dashboard</a></div>
                    <div class="nav-link " ><a href="">Orders</a></div>
                    <div class="nav-link"><a href="">Retailers</a></div>
                    <div class="nav-link"><a href="">Payments</a></div>
                    <div class="nav-link"><a href="">Inventory</a></div>
                   
                </div>
            </nav>
            <div class="userProfile">c
                <div class="profile">
                        <img src="" alt="pic">
                    <div class="profileDetails">
                        <p class="userName">Rounak</p>
                        <p class="userRole">Salesperson</p>
                    </div>
                </div>
                <button class="logoutBtn">Logout</button>
            </div>
        </div>
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