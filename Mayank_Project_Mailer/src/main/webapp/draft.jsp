<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
        
<%@page import="java.util.*" %>
<%@page import="org.hibernate.*" %>
<%@page import="src.main.java.*" %>
<!DOCTYPE html>
<html>
<head>
  <title></title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="Login_Css.css">

  <style>
.img-fluid{


height: 850px; }


</style>







</head>

<%-- <%
if(session.getAttribute("email")==null)
{
	response.sendRedirect("login.jsp");
}

%> --%>


<%
	Session s= HibernateUtil.getSessionFactory().openSession();

	
	Register mail =(Register)	session.getAttribute("email");
	String mailing =	mail.getEmail();


	
	session.setAttribute("frm", mailing);

%>


<body class="bg-img">
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="welcome.jsp">PubliK</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="about.jsp">About</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="compose.jsp">Compose</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="draft.jsp">Draft</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="<%=request.getContextPath()%>/Logout" >Logout</a>
      </li>
      

    </ul>
  </div>
</nav>


	<%
	Query q= s.createQuery("FROM Draft WHERE frm = :email").setParameter("email",mailing);
	List<Draft> list=q.list();
	%>
	

	<div class="bg-dark text-white text-center">
		<table class="table table-striped">
			<thead>
				<tr>
					<th scope="col">To</th>
					<th scope="col">Message</th>
					<th scope="col">Bcc</th>
					<th scope="col">Cc</th>
										<th scope="col">button</th>
					
				</tr>
			</thead>
		
			<tbody>
				<%
			for(Draft m:list){
				
		%>
				<tr>
					<th scope="row"><%=m.getTo()%></th>
					<td ><%=m.getMessage() %></td>
					<td><%=m.getBcc() %></td>
					<td><%=m.getCc() %></td>
					<td>
					<form action="<%=request.getContextPath()%>/draftdelete" method="post">
					
					<button type="submit"   class="btn" name="draftbtn" value="<%=m.getId()%>"><i>Delete </i></button>
					</form>
					</td>
					<td>
					<form action="<%=request.getContextPath()%>/draftsending" method="post">
						<input type="hidden" name="to" value="<%=m.getTo()%>">
						<input type="hidden" name="message" value="<%=m.getMessage()%>">
						<input type="hidden" name="bcc" value="<%=m.getBcc()%>">
						<input type="hidden" name="cc" value="<%=m.getCc()%>">
						<input type="hidden" name="frm" value="<%=m.getFrom()%>">
						
						
						
					<button type="submit"   class="btn" name="draftbtnsend" value="<%=m.getId()%>"><i>Send </i></button>
					</form>
					</td>
					
				</tr>
				
				<%	
	}
%>
			</tbody>
		</table>


	</div>




</body>
</html>