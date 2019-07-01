<%@page import="com.oop.service.AnnouncementServiceImpl"%>
<%@page import="com.oop.service.IAnnouncementService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.oop.model.Announcement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.oop.service.AnnouncementServiceImpl"%>
<%@page import="com.oop.service.IAnnouncementService"%>
<%@ page import="com.oop.model.LoginHandler" %> 
<%
		if(session.getAttribute("loginDetails") == null )
		{
       		getServletContext().getRequestDispatcher("/LoginPage.jsp").forward(request, response);
			return;
		} 
      LoginHandler login = (LoginHandler) session.getAttribute("loginDetails"); %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="styles/style.css" />
    <link rel="stylesheet" type="text/css" href="styles/styleLE.css" />
    <link rel="stylesheet" type="text/css" href="styles/styleAE.css" />
    <link rel="stylesheet" type="text/css" href="styles/Mail.css" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  
    
    </head>
<body>
    <div class = "d-flex">
   <jsp:include page="Sidebar.jsp"></jsp:include>
           <!---Page-Content--------------------------------------------------------------------------------------------------------->
          
    <div id="page-wrapper" >  
       <div class="container-flex" >
        
               
           
           <div class="col-md-12 col-sm-12 col-xs-12" id = "contentHeader" >
         <h3><strong><i class="fa fa-bells" aria-hidden="true"></i>  Announcements </strong>
         <a href="AddAnnouncementPage.jsp"><button class="btn btn-sm btn-primary"><strong>Add Announcement</strong></button></a></h3>
         
               </div>
            <div class="col-md-12 col-sm-12 col-xs-12 bottomCont">
          
           
        <div class = "col-md-12 col-sm-12 col-xs-12 table-responsive cont">
        <table class="table table-striped " style="font-size: 1.1em">
  <thead style="background-color: rgba(1, 50, 67, 1) ;color : white;">
    <tr >
      <th scope="col" width="10%">Published</th>
      <th scope="col" width="77%">Announcement</th>
      <th scope="col" width="5%">Actions</th>
      <th scope="col" width="5%"></th>
    
    </tr>
  </thead>
  <tbody>
  <% IAnnouncementService announcementService = new AnnouncementServiceImpl();
	ArrayList<Announcement> arrayList =  announcementService.viewAllAnnouncement();
	if( !arrayList.isEmpty() ){
		for( Announcement ann : arrayList){
	
%>
    <tr>
      <td><strong><%=ann.getDate() %></strong></td>
    
      <td>
      	<label><span class='btn btn-xs btn-<%=(ann.getType() == 1 )? "danger" : "success" %>'>
      		<i class="fas fa-bell"></i>
      	</span> <%=ann.getTitle() %></label>
      	<p><%=ann.getAnnouncementText() %></p>
      </td>
        <td><a href="EditAnnouncementPage.jsp?AnnID=<%=ann.getAnnId() %>" >
          	<button type="submit" class="btn btn-info btn-xs"><strong><i class="fas fa-user-edit"></i> Edit</strong></button>
          	</a>
        </td>
          <td><a href="ListAnnouncement.jsp?DeleteID=<%=ann.getAnnId() %>" >
          	<button class="btn btn-danger btn-xs"><strong>
          		<i class="fas fa-trash-alt"></i> Delete
          		</strong>
          	</button></a>
        </td>
    </tr>
    <%} }else{ %>
    <tr>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <% } %>    
  </tbody>
</table>
        </div>
        
        </div>
        </div>
    </div>
        </div> 
    <script>
    
        
        
    function sidebarToggle() {
  document.getElementById("sidebar-wrapper").classList.toggle("active");
  document.getElementById("page-wrapper").classList.toggle("active");
}
        
    function employeeDropdown(){
        document.getElementById("employeeSubmenu").classList.toggle("active");
    }
        
    function searchbarToggle(){
        document.getElementById("searchbarCollapse").classList.toggle("active");
    }
    $(document).ready(function(){
        $("#deleteModal").modal('show');
    });
    </script>
   <%if( request.getParameter("DeleteID") != null ){ %>
	<div id="deleteModal" class="modal fade">
		<div class="modal-dialog modal-confirm">
			<div class="modal-content">
				<form action="DeleteAnnouncement" method="POST" > 
				<div class="modal-body">
					<p>Do you really want to delete these records? This process cannot be undone.</p>
				</div>
				<div class="modal-footer">
					<input type="hidden" name="AnnID" value="<%=request.getParameter("DeleteID") %>" >
					<button type="button" class="btn btn-info" data-dismiss="modal"><b>Cancel</b></button>
					<button type="submit" class="btn btn-danger"><b>Delete</b></button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%} %>
</body>
</html>
    