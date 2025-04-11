<%@ page import="com.example.DataBaseJDBC" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
  HttpSession httpSession = request.getSession(false);

  if (httpSession != null) {
    httpSession.invalidate();
  }

  response.sendRedirect("index.jsp");
%>