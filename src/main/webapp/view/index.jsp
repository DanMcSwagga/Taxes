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
</head>
<body>
    <h2>
        да поможет мне есус!
    </h2>
    <br />


    <c:forEach var="income" items="${requestScope.incomes}">
        <ul>

            <li>id: <c:out value="${income.id}"/></li>

            <li>month: <c:out value="${income.month}"/></li>

            <li>amount: <c:out value="${income.amount}"/></li>

            <li>taxPayer: <c:out value="${income.taxPayer}"/></li>

            <li>incomeType: <c:out value="${income.incomeType.getTypeID()}"/></li>

            <li>taxRate: <c:out value="${income.incomeType.getTaxRate()}"/></li>

            <li>name: <c:out value="${income.incomeType.getName()}"/></li>

            <%--<form method="post" action="/delete">--%>
                <%--<input type="number" hidden name="id" value="${income.id}" />--%>
                <%--<input type="submit" name="delete" value="Delete"/>--%>
            <%--</form>--%>

        </ul>
        <hr />

    </c:forEach>

    <h3>
        Множество и сумма налоговых выплат за год:
    </h3>
    <ul>
        <li>count: <c:out value="${requestScope.count}"/></li>

        <li>sum: <c:out value="${requestScope.sum}"/></li>
    </ul>


    <%--<h2>Add new product</h2><br />--%>

    <%--<form method="post" action="/add">--%>

        <%--<label><input type="number" name="marking"></label>Marking<br>--%>
        <%--<label><input type="text" name="title"></label>Title<br>--%>
        <%--<label><input type="number" name="price"></label>Price<br>--%>

        <%--<input type="submit" value="Ok" name="Ok"><br>--%>
    <%--</form>--%>


</body>
</html>
