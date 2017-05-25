<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%!
int eid;
String ename;
int esal;
static Connection connection;
static PreparedStatement preparedStatement;
 static {
 try{
	Class.forName("com.mysql.jdbc.Driver");
	connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbcprac","rootuser","password");
  
	preparedStatement =connection.prepareStatement("insert into employee values(?,?,?)");
	
 }
 catch(Exception exception){
	exception.printStackTrace(); 
 }
 }
%>
<% 
try{
 eid = Integer.parseInt(request.getParameter("eid"));
ename=request.getParameter("ename");
esal = Integer.parseInt(request.getParameter("esal"));

preparedStatement.setInt(1, eid);
preparedStatement.setString(2, ename);
preparedStatement.setInt(3, esal);
int a=preparedStatement.executeUpdate();
 if(a==1){
	 out.println("Success");	 
 }else{
	 out.println("Failure");	
%>
 <jsp:include page="register.html"></jsp:include>
 <%
 }
}
catch(Exception exception){
	 out.println("Failure");	
%>
	 <jsp:include page="register.html"></jsp:include>
<%
}
%>