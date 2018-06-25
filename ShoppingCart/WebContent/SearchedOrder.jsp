<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page
	import="java.util.List,com.fecund.shcart.entity.*,com.fecund.shcart.db.*"%>
	<%@ include file="CommonAdmin.jsp"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="#E6E5F4">

<%
if(session.getAttribute("Admin")==null)
	{ 
	response.sendRedirect("UserLogin.jsp");
} 
else{
	

		ArrayList<Order> list = (ArrayList<Order>) request.getAttribute("list");
		request.setAttribute("list", list);
	%>
	<p> <b>Searched Result:</b></p>
	<form action="orderstatus" method="post">
	<table width="100%" border="1">
		<th>Order Id:</th>
		<th>User Id</th>
		<th>Product Id:</th>
		<th>User Name</th>
		<th>Product Name</th>
		<th>Shipping Address</th>
		<th>Product Quantity</th>
		<th>Product Amount:</th>
		<th>Order Date:</th>
		<th>Product Status:</th>
	
		<c:forEach items="${list}" var="order">
			<tr>

				<td>${order.orderid} <input type="hidden" name="orderid"
					value="${order.orderid}"></td>
				<td>${order.userid} <input type="hidden" name="userid"
					value="${order.userid}">
				</td>
				<td>${order.productid} <input type="hidden" name="productid"
					value="${order.productid}">
				</td>
				
				<td>${order.username} <input type="hidden"
					name="username" value="${order.username}">
				</td>
				<td>${order.productname} <input type="hidden" name="productname"
					value="${order.productname}">
				</td>
				<td>${order.address} <input type="hidden"
					name="address" value="${order.address}">
				</td>
				<td>${order.quantity} <input type="hidden"
					name="quantity" value="${order.quantity}">
				</td>
				<td>${order.amount} <input type="hidden"
					name="amount" value="${order.amount}">
				</td>
				<td>${order.orderdate} <input type="hidden"
					name="orderdate" value="${order.orderdate}">
				</td>
				<td>
			    <select name="status" value="%{status}" >
			<option value="${order.status}">${order.status}</option>
			<option value="New">New</option>
			<option value="Processing">Processing</option>
			<option value="Shipped">Shipped</option>
			<option value="Completed">Completed</option>
			    </select>
			</td>
			</tr>
		</c:forEach>
		</tr>
	</table>
		<input type="submit" Value="Submit" name="submit">
		</form>
	<%} %>
	<a href="AdminHome.jsp">Exit</a>
</body>
</html>