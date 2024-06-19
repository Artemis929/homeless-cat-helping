<%--
  Created by IntelliJ IDEA.
  User: 86187
  Date: 2024/06/08
  Time: 21:00
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
    <title>Simple JSP with c:forEach</title>
</head>
<body>
<h1>Simple JSP with c:forEach</h1>

<!-- 使用 c:set 设置静态数据 -->
<c:set var="staticList" value="${['Item 1', 'Item 2', 'Item 3']}" />

<ul>
    <c:forEach var="item" items="${staticList}">
        <li>${item}</li>
    </c:forEach>
</ul>
<div class="col-md-6">
    <h3>最新投喂记录</h3>
    <table class="table" id="feedingRecords">
        <thead>
        <tr>
            <th>日期</th>
            <th>投喂人ID</th>
            <th>猫屋ID</th>
            <th>投喂量（克）</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach  var="feed" items="${requestScope.feeds}">
            <tr>
                <td>${feed.date}</td>
                <td>${feed.volunteerID}</td>
                <td>${feed.homeID}</td>
                <td>${feed.amount}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>