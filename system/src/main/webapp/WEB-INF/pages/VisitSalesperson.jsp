<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Visit Management</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/VisitSalesperson.css">
</head>

<body>

<div class="main-container">

    <!-- LEFT NAV -->
    <div class="left-nav">
        <div class="logo">TradeFlow</div>

        <div class="nav-links">
            <div class="nav-link"><a href="#">Dashboard</a></div>
            <div class="nav-link"><a href="#">Retailer</a></div>
            <div class="nav-link linkSelected"><a href="#">Visit</a></div>
            <div class="nav-link"><a href="#">Inventory</a></div>
            <div class="nav-link"><a href="order.html">Order</a></div>
            <div class="nav-link"><a href="#">Order History</a></div>
        </div>
    </div>

    <!-- RIGHT -->
    <div class="right-container">

        <!-- TOP -->
        <div class="top">
            <h2>Visit Management</h2>
            <p id="todayDate"></p>
        </div>

        <!-- ADD BUTTON -->
        <button class="add-btn" onclick="addRow()">➕ Add Visit</button>

        <!-- TABLE -->
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>S.No</th>
                        <th>Retailer</th>
                        <th>Order</th>
                        <th>Payment</th>
                        <th>Confirm</th>
                    </tr>
                </thead>

                <tbody id="visitTableBody"></tbody>
            </table>

            <p id="emptyMsg">No visits added yet</p>
        </div>

    </div>
</div>

<script>
let rowCount = 0;

// AUTO DATE
const today = new Date();
document.getElementById("todayDate").innerText =
    "Today: " + today.toISOString().split("T")[0];

// ADD ROW
function addRow(){
    document.getElementById("emptyMsg").style.display = "none";

    rowCount++;

    const table = document.getElementById("visitTableBody");

    const row = document.createElement("tr");

    row.innerHTML = `
        <td>${rowCount}</td>

        <td>
            <select>
                <option>Select</option>
                <option>ABC Store</option>
                <option>XYZ Traders</option>
                <option>Sharma Mart</option>
            </select>
        </td>

        <td>
            <button class="order-btn">Place Order</button>
        </td>

        <td>
            <div class="payment-box">
                <input type="number" placeholder="Amount" min="0">
                <select>
                    <option>Mode</option>
                    <option>Cash</option>
                    <option>Cheque</option>
                </select>
            </div>
        </td>

        <td>
            <button class="confirm-btn approve" onclick="confirmRow(this)">✔</button>
            <button class="confirm-btn reject" onclick="deleteRow(this)">✖</button>
        </td>
    `;

    table.appendChild(row);
}

// DELETE ROW
function deleteRow(btn){
    btn.closest("tr").remove();
    updateSno();

    if(document.querySelectorAll("#visitTableBody tr").length === 0){
        document.getElementById("emptyMsg").style.display = "block";
    }
}

// UPDATE S.NO
function updateSno(){
    const rows = document.querySelectorAll("#visitTableBody tr");
    rowCount = rows.length;

    rows.forEach((row,index)=>{
        row.cells[0].innerText = index + 1;
    });
}

// CONFIRM ROW
function confirmRow(btn){
    const row = btn.closest("tr");

    row.querySelectorAll("input, select, button").forEach(el=>{
        el.disabled = true;
    });

    row.style.background = "#e6fffa";
}
</script>

</body>
</html>