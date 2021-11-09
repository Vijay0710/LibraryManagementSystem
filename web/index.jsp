<%-- 
    Document   : index
    Created on : 7 Nov, 2021, 10:30:39 PM
    Author     : Vijay A
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"
        import="java.util.Random" %>
<%! int fontsize;%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BookDetailstoDB</title>
    </head>
    <body>
        <%
                Random rand = new Random();
                String n1 = request.getParameter("bacc");
                String n2 = request.getParameter("btitle");
                String n3 = request.getParameter("bauthor");
                String n4 = request.getParameter("bpublisher");
                String n5 = request.getParameter("bedition") ;     
                String n6 = request.getParameter("bprice");
                int int_random = rand.nextInt(1000);
                Connection conn = null;
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/books","root","root");
                PreparedStatement ps = conn.prepareStatement("INSERT INTO bookdetails values(?,?,?,?,?,?)");
                ps.setString(1,n1);
                ps.setString(2,n2);
                ps.setString(3,n3);
                ps.setString(4,n4);
                ps.setString(5,n5);
                ps.setString(6,n6);
                ps.executeUpdate();
                out.println("Record Inserted Successfully...!");
                ps.close();
                conn.close();
        %>
        <form aciton="bookAdd.html">
            <input type="submit" value="Add Book Details">
        </form>
        
        <form action="viewBookDetails.jsp" method="post">
            <input type="submit" value="View Book Details">
        </form>
    </body>
</html>
