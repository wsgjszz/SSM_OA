<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>账户列表</title>
</head>
<body>
    <h3>显示账户列表</h3>
    ${list}
    <%--<c:forEach items="${list}" var="account">
        ${account.name}
        ${account.money}
        <br/>
    </c:forEach>--%>
</body>
</html>
