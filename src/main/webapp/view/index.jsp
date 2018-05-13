<%--
  Created by IntelliJ IDEA.
  User: Dan
  Date: 09.05.2018
  Time: 19:01
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Index</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
</head>
<body class="text-muted">
    <div class="floating-wrapper">
        <a href="#outputTax" class="text-light">
            <div class="floating in">
                <div class="text-center">O</div>
            </div>
        </a>
        <a href="#addForm" class="text-light">
            <div class="floating out">
                <div class="text-center">I</div>
            </div>
        </a>
    </div>

    <%--Output--%>

    <h3 class="text-center" id="outputTax">да поможет мне есус!</h3>
    <br />

    <div class="output-wrapper">
        <c:forEach var="income" items="${requestScope.incomes}">

        <div class="output-item">
            <ul>
                <li>id: <c:out value="${income.id}"/></li>
                <li>month: <c:out value="${income.month}"/></li>
                <li>amount: <c:out value="${income.amount}"/></li>
                <li>taxPayer: <c:out value="${income.taxPayer}"/></li>
                <li>incomeType: <c:out value="${income.incomeType.getTypeID()}"/></li>
                <li>taxRate: <c:out value="${income.incomeType.getTaxRate()}"/></li>
                <li>name: <c:out value="${income.incomeType.getName()}"/></li>
            </ul>
        </div>

        </c:forEach>

    </div>

    <h3 class="text-center">Множество и сумма налоговых выплат за год:</h3>
    <br />

    <div class="col-md-6 offset-md-3 card">
        <h3 class="text-info">count: <c:out value="${requestScope.count}"/></h3>
        <h3 class="text-info">sum: <c:out value="${requestScope.sum}"/></h3>
    </div>


    <%--Form--%>
    <div class="offset alert-info"></div>
    <br />

    <div class="col-md-6 offset-md-3">
        <form class="form" action="/add" method="post">

            <h3 class="text-center" id="addForm">Enter your annual tax payments</h3>

            <div class="form-group">
                <label for="month">Month</label>
                <input type="number" name="month" id="month" class="form-control">
            </div>
            <div class="form-group">
                <label for="amount">Amount</label>
                <input type="number" name="amount" id="amount" class="form-control">
            </div>
            <div class="form-group">
                <label for="tax_payer">Tax Payer</label>
                <input type="text" name="tax_payer" id="tax_payer" class="form-control">
            </div>
            <div class="form-group">
                <label for="ic_id">Type ID</label>
                <input type="number" name="ic_id" id="ic_id" class="form-control">
            </div>
            <div class="form-group">
                <label for="ic_tax_rate">Tax Rate</label>
                <input type="number" name="ic_tax_rate" id="ic_tax_rate" class="form-control">
            </div>
            <div class="form-group">
                <label for="ic_name">Work Name</label>
                <input type="text" name="ic_name" id="ic_name" class="form-control">
            </div>

            <div class="form-group">
                <input type="submit" value="add" name="add" class="btn btn-large btn-primary" style="text-transform: uppercase; padding: 10px 25px;">
            </div>

        </form>
    </div>



<style>
    body {
        z-index: 0;
    }
    .floating-wrapper {
        position: fixed;
        margin-top: calc(50vh - 100px);
        margin-left: 20px;
        z-index: 100;
    }
    .floating-wrapper > a:hover .floating {
        height: 45px;
        width: 45px;
        padding: 5px;
        margin: 5px 0;
    }
    .floating {
        height: 40px;
        width: 40px;
        padding: 10px;
        margin: 10px 0;
    }
    .in {
        background-color: seagreen;
    }
    .out {
        background-color: salmon;
    }
    .offset {
        margin: 50px 0;
        height: 10px;
    }
    .output-wrapper {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
    }
    .output-item {
        margin: 20px;
        box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
        transition: all 0.3s cubic-bezier(.25,.8,.25,1);
        width: calc(30% - 40px);
    }
    .output-item:hover {
        box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
    }
</style>


<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
</body>
</html>
