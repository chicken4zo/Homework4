<%@ page import="java.sql.Connection" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Tomcat Connection Pool TEST</title>
</head>
<body>
<%
    Connection conn = null;

    //JNDI (현재 프로젝트에서 특정한 이름으로 파일을 검색)
    Context context = new InitialContext(); // 검색 기능
    DataSource ds = (DataSource) context.lookup("java:comp/env/jdbc/mysql"); // java:comp/env/ + 이름
    //DataSource를 판매하는 상점 (=튜브를 판매)

    //POOL 안에서 Connection 하나 빌림
    conn = ds.getConnection();
    out.print("db연결여부: " + conn.isClosed() + "<br>");

    //반드시 사용 후에는 반환해야함 (method 안에서 빌리고 반환까지 해야함)
    conn.close(); // POOL에서의 close는 반환 (자원해제 아니고 POOL에다가 반환하는거)

    out.print("db연결여부: " + conn.isClosed() + "<br>");
%>
</body>
</html>
