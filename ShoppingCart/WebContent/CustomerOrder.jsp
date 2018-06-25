<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ include file="Common.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List,com.fecund.shcart.entity.*,com.fecund.shcart.db.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="#E6E5F4">

<%
String userid=(String)session.getAttribute("Customer");
System.out.println(userid);
if(session.getAttribute("Customer")==null)
	{ response.sendRedirect("UserLogin.jsp");
} 
else{
           ProductDataImpl productdata = new ProductDataImpl();
			ArrayList<Order> list = productdata.getOrderData(userid);
			if(list.size()==0)
			{%>
			<p>There is no any order...!</p>
				
			<%}
			else{
			request.setAttribute("list", list);
			System.out.println(list.size());
	%>
	<P>
		<b>Products for sale:</b>
	</P>
	<form>
	<table width="100%" border="1">
		<th>Product Name</th>
		<th>Product Quantity</th>
		<th>Product Amount</th>
		<th>Shipping Address</th>
	     <th>Final cost</th>
		<th>Order Date</th>
		<th>Product Status</th>
	
		<c:forEach items="${list}" var="order">
			<tr>
			
				<td>${order.productname} <input type="hidden"
					name="amount" value="${order.productname}">
				</td>
				<td>${order.quantity} <input type="hidden"
					name="quantity" value="${order.quantity}">
				</td>
				<td>${order.unitprice} <input type="hidden"
					name="amount" value="${order.unitprice}">
				</td>
				<td>${order.address} <input type="hidden"
					name="address" value="${order.address}">
				</td>
				<td>${order.amount} <input type="hidden"
					name="amount" value="${order.amount}">
				</td>
				
				<td>${order.orderdate} <input type="hidden"
					name="orderdate" value="${order.orderdate}">
				</td>
				<td>
				${order.status} <input type="hidden"
					name="orderdate" value="${order.status}">
			</tr>
		</c:forEach>
		</tr>
	</table>
	</form>
	<a href="CustomerHome.jsp">Exit</a>
	<%} 
	}%>
</body>
</html>