<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Dashboard</title>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/OrderHistorySalesperson.css">
</head>

<body>

<div class="main-container">

    <!-- LEFT NAVIGATION -->
    <div class="left-nav">

        <div class="logo">
            Dashboard
        </div>

        <div class="nav-links">

            <div class="nav-link linkSelected">
                <a href="#">Orders</a>
            </div>

            <div class="nav-link">
                <a href="#">Products</a>
            </div>

            <div class="nav-link">
                <a href="#">Customers</a>
            </div>

            <div class="nav-link">
                <a href="#">Reports</a>
            </div>

        </div>

    </div>

    <!-- RIGHT SIDE -->
    <div class="right-container">

        <div class="top">
            <h1>Order History</h1>
        </div>

        <div class="card-container">

            <!-- ORDER 1 -->
            <div class="order-card">

                <div class="card-row">
                    <strong>Order ID</strong>
                    <span>#1001</span>
                </div>

                <div class="card-row">
                    <strong>Customer</strong>
                    <span>John Doe</span>
                </div>

                <div class="card-row">
                    <strong>Total</strong>
                    <span>$120</span>
                </div>

                <div class="status pending">
                    Pending
                </div>

                <button class="details-btn"
                    onclick="showDetails(
                    '1001',
                    'John Doe',
                    '$120',
                    'Pending',
                    'Order placed successfully. Waiting for admin approval.'
                )">

                    View Details

                </button>

            </div>

            <!-- ORDER 2 -->
            <div class="order-card">

                <div class="card-row">
                    <strong>Order ID</strong>
                    <span>#1002</span>
                </div>

                <div class="card-row">
                    <strong>Customer</strong>
                    <span>Alice Smith</span>
                </div>

                <div class="card-row">
                    <strong>Total</strong>
                    <span>$240</span>
                </div>

                <div class="status approved">
                    Approved
                </div>

                <button class="details-btn"
                    onclick="showDetails(
                    '1002',
                    'Alice Smith',
                    '$240',
                    'Approved',
                    'Order approved and delivered successfully.'
                )">

                    View Details

                </button>

            </div>

            <!-- ORDER 3 -->
            <div class="order-card">

                <div class="card-row">
                    <strong>Order ID</strong>
                    <span>#1003</span>
                </div>

                <div class="card-row">
                    <strong>Customer</strong>
                    <span>David Lee</span>
                </div>

                <div class="card-row">
                    <strong>Total</strong>
                    <span>$90</span>
                </div>

                <div class="status cancelled">
                    Cancelled
                </div>

                <button class="details-btn"
                    onclick="showDetails(
                    '1003',
                    'David Lee',
                    '$90',
                    'Cancelled',
                    'Order cancelled by customer request.'
                )">

                    View Details

                </button>

            </div>

        </div>

    </div>

</div>

<!-- MODAL -->
<div class="modal" id="modal">

    <div class="modal-content">

        <h2>Order Details</h2>

        <p>
            <strong>Order ID:</strong>
            <span id="modalOrderId"></span>
        </p>

        <p>
            <strong>Customer:</strong>
            <span id="modalCustomer"></span>
        </p>

        <p>
            <strong>Total:</strong>
            <span id="modalTotal"></span>
        </p>

        <p>
            <strong>Status:</strong>
            <span id="modalStatus"></span>
        </p>

        <p>
            <strong>History:</strong>
            <span id="modalHistory"></span>
        </p>

        <button class="close-btn" onclick="closeModal()">
            Close
        </button>

    </div>

</div>



</body>
</html>