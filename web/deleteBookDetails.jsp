<%-- 
    Document   : deleteBookDetails
    Created on : 9 Nov, 2021, 1:32:01 PM
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
                String n1 = request.getParameter("bacc");
                Connection conn = null;
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/books","root","root");
                Statement ps1 = conn.createStatement();
                ResultSet rs = ps1.executeQuery("SELECT * FROM bookdetails WHERE bacc="+n1);
                if(!rs.isBeforeFirst()){
                    out.println("No such ID exists");
                }
                else{
                PreparedStatement ps = conn.prepareStatement("DELETE FROM bookdetails WHERE bacc=?");
                ps.setString(1,n1);
                ps.executeUpdate();
                out.println("Record Deleted Successfully...!");
                ps.close();
                conn.close();
                }
                
        %>
        <form action="bookAdd.html">
            <input type="submit" value="Add Book Details">
        </form>
        <br><br>
        <form action="bookDelete.html">
            <input type="submit" value="Delete Book Details">
        </form>
        <form action="viewBookDetails.jsp" method="post">
            <input type="submit" value="View Book Details">
        </form>
    </body>
</html>

