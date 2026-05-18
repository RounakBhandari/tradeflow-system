<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TradeFlow - Sales Manager</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/AdminFunction.css">
</head>
<body>
    <div class="main-container"> 
        <div class="left-nav">
            <div class="logo">
                 <p>TradeFlow</p>
            </div>
            <div class="nav-links">
                <div class="nav-link ">
                    <a href="AdminDashboard.html">Dashboard</a>
                </div>
                <div class="nav-link linkSelected">
                    <a href="#">Inventory</a>
                </div>
                <div class="nav-link">
                    <a href="AdminOrder.html">Order Approvals</a>
                </div>
                <div class="nav-link">
                    <a href="AdminUser.html">User Approvals</a>
                </div>
                <div class="nav-link">
                    <a href="AdminTransaction.html">Transaction History</a>
                </div>
            </div>
            <div class="userProfile">
                <div class="profile">
                    <img src="profile.jpg" alt="Profile Picture">
                    <div class="profileDetails">
                        <span class="userName">Binishaan Basnet</span>
                        <span class="userRole">Retailer</span>
                    </div>
                </div>
                <button class="logoutBtn">Logout</button>
            </div>
        </div>
        <div class="inventory-content">

        <!-- HERO -->
        <div class="inventory-hero">
            <h1>Inventory Management</h1>
            
        </div>

        <!-- CARDS -->
        <div class="inventory-cards">

            <div class="inventory-card">
                <h2>1,245</h2>
                <span>Total Products</span>
            </div>

            <div class="inventory-card">
                <h2>324</h2>
                <span>Low Stock Items</span>
            </div>

            <div class="inventory-card">
                <h2>18</h2>
                <span>Out of Stock</span>
            </div>

            <div class="inventory-card">
                <h2>Rs. 8.2M</h2>
                <span>Total Inventory Value</span>
            </div>

        </div>

        <!-- TABLE -->
        <div class="inventory-table-section">

    <div class="inventory-table-header">

        <h2 class="inventory-table-title">Inventory List</h2>

        <div class="inventory-actions">

            <input type="text" class="inventory-search" placeholder="Search products...">

            <button class="add-product-btn">+ Add Product</button>

        </div>

    </div>

    <table class="inventory-table">

                <thead>
                    <tr>
                        <th>Product ID</th>
                        <th>Product Name</th>
                        <th>Category</th>
                        <th>Stock</th>
                        <th>Status</th>
                        <th>Supplier</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>

                    <tr>
                        <td>#TRD1021</td>
                        <td>Wireless Mouse</td>
                        <td>Accessories</td>
                        <td>120</td>
                        <td><span class="stock-status stock-available">In Stock</span></td>
                        <td>TechSource Pvt Ltd</td>
                        <td><button class="inventory-btn">View</button></td>
                    </tr>


                </tbody>

            </table>

        </div>

    </div>

</div>

</body>
</html>
    </div>
</body>
</html>