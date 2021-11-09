<%-- 
    Document   : viewBookDetails
    Created on : 9 Nov, 2021, 12:46:35 PM
    Author     : Vijay A
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"
        import="java.util.Random" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
           Connection conn = null;
          Class.forName("com.mysql.jdbc.Driver");
          conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/books","root","root");
           Statement st = conn.createStatement();
           ResultSet rs = st.executeQuery("SELECT * FROM bookdetails");
        %>
        <table border="1" align="center">
            <tr>
                <th>Acc</th>
                <th>Title</th>
                <th>Author</th>
                <th>Publisher</th>
                <th>Edition</th>
                <th>Price</th>
            </tr>
            <%
                while(rs.next()) {
            %>
                <tr>
                    <td><%= rs.getString("bacc")%></td>
                    <td><%= rs.getString("btitle")%></td>
                    <td><%= rs.getString("bauthor")%></td>
                    <td><%= rs.getString("bpublisher")%></td>
                    <td><%= rs.getString("bedition")%></td>
                    <td><%= rs.getString("bprice")%></td>
                </tr>
             <%
                 }
                 rs.close();
                conn.close();
             %>   
        </table>
    </body>
</html>
