<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.oop.model.*" %>
<%@page import="com.oop.service.*"%> 
<%@ page import="com.oop.util.CommonConstants" %>  
<%@ page import="com.oop.util.CommonUtil" %> 
<%@page import="java.util.ArrayList"%>
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
	<jsp:include page="Sidebar.jsp"/>
     <!---Page-Content--------------------------------------------------------------------------------------------------------->

<!-- Central Modal Small -->
  <div id="page-wrapper" >  
       <div class="container-flex" >
        
                <!--Main-Title-of-the-Page-------------------------------------------------->
                <div class="col-md-12 col-sm-12 col-xs-12" id="contentHeader">
                    <h3><strong>
                        <!--Main-Header icon and Text goes here----------------------------->
                        <i class="fas fa-address-card"></i>
                     Mail Box </strong></h3>
               </div>
                <!--------------------------------------------------------------------------->
                <!--Form Sides start from here----------------------------------------------->

                
                <div class="col-md-12 col-sm-12 col-xs-12 FormSides">
                   			<div class="col-md-12" >
                       <div class="btn-group" role="group" aria-label="Basic example" style="margin-bottom: 10px;">
                        <a href="MailInboxPage.jsp" class="btn btn-sm btn-primary" ><b>Inbox</b></a>
                            <a href="MailSentboxPage.jsp" class="btn btn-sm btn-info" ><b>Sentbox</b></a>
                            <a href="MailComposePage.jsp" class="btn btn-sm btn-info" ><b>Compose</b></a>
                        </div>
                        	</div>
                      <!--Left Part of the page Content----------------------------------->
                    <div class="col-md-5 col-sm-12 col-xs-12" id="l" >
                        <div class="col-md-12 col-sm-12 col-xs-12 " id="left">
                           
                            <h5 class="FormHeader" styles="margin : 0px"><strong>Inbox</strong></h5>
                            <%   
                            	int SelectedID = 0;
                            	CommonUtil common = new CommonUtil();
                            	IMailService mailService = new MailServiceImpl();
                            	IEmployeeService employeeService = new EmployeeServiceImpl();
                            	ArrayList<Mail> arrayList  = mailService.viewMails(login.getEmpId(), CommonConstants.ID_VIEW_ALL_RECEIVE_MAILS );
                            	
                            	if( request.getAttribute("MessageID") != null ){
                                	SelectedID = Integer.parseInt( request.getAttribute("MessageID").toString() );
                            	}
                            	
                            	if( !arrayList.isEmpty() ){
                            	for (Mail mail : arrayList){
                            		Employee employee = employeeService.getEmployeeDetails(mail.getSenderId());
                            		
                            		
                            		
                            %>
                            <form action="ViewMail" method="POST" id="<%=mail.getMailId() %>" >
                            	<input type="hidden" name="mailId" value="<%=mail.getMailId() %>" >
                            	<input type="hidden" name="readStatus" value="<%=mail.getRead() %>" >                            	
                            	<input type="hidden" name="MessageType" value="Inbox" >
                             <a href="javascript:{}" onclick="document.getElementById('<%=mail.getMailId() %>').submit();">
	                           
	                            <div class="col-xs-12 messageBox"  id="<%=common.messageType(mail.getMailId(), SelectedID, mail.getRead()) %>"   >
	                            <div class="col-xs-1"  >
                            	
	                            <img src = "images/<%=( employee.getImagePath()== null) ? "user.jpg" : employee.getImagePath() %>" width="35px" style="border-radius: 20px;"> 
	                                 </div>
	                        <div class="col-xs-11" >
	                               <h6  class = "senderName" ><%=employee.getFirstName() + " " + employee.getLastName()  %>
	                                   <span class="mailDateAndTime"><%=mail.getSentTime() %> &nbsp &nbsp <%=mail.getSentDate() %></span></h6> 
	                               <p class ="mailContent" ><%=mail.getTitle() %>
	                                   </p>
	                            </div> 
                            </div>
                            </a>
                            </form>
							
							  <%} %>
                        </div>
                    </div>
                    <!--End of the left Part-------------------------------------------->
                        
                     <!--Right Part of the page Content----------------------------------->
                    <div class="col-md-7 col-sm-12 col-xs-12" id="l">
                        <div class="col-md-12 col-sm-12 col-xs-12  " id="right">

                       <% 
                            Mail mail;
                            Employee employee;
                         	if( request.getAttribute("MessageID") != null ){
                            	
                         		int mailId = Integer.parseInt( request.getAttribute("MessageID").toString() );
                            	mail = mailService.viewMail(mailId);
                            	employee = employeeService.getEmployeeDetails(mail.getSenderId() ); 	%>
                            
                           <div class="col-xs-12" >
                                <div class ="col-xs-1" >
                                <img src="images/<%=( employee.getImagePath()== null) ? "user.jpg" : employee.getImagePath() %>" width="40px" style="margin-top:10px; border-radius: 50px;">
                                </div>
                                <div class= "col-sm-offset-0 col-sm-10 col-xs-offset-2 col-xs-8" >
                                <h5><%=employee.getFirstName() + " " + employee.getLastName()  %><br>
                                 <span class="messageTime"><%=mail.getSentTime() %> &nbsp  <%=mail.getSentDate() %></span></h5>
                                </div>
                                <div class="col-xs-12" >
                                <h5><%=mail.getTitle() %></h5>
                                <p><%=mail.getMessage() %></p><br>
                                <a href="MailInboxPage.jsp?DeleteID=<%=mail.getMailId()%>">
                                <button type="submit" class="btn btn-sm btn-danger" ><b>Delete</b></button> 
                                </a>
                               </div>
                      
                        </div> 
                        </div>
                        </div>
                        <% }else{  %>
                         <div class="col-xs-12" >
                    	  <img src="images/mailImage.png" width="100%">
                    	  </div>
                    	  </div>
                        </div>
                         	
                       <%  } }else{   %>
                    	  <div class="col-xs-12" >
                    	  <img src="images/nomails.png" width="100%">
                    	  </div>
                    	   </div>
                    </div>
                       
                    	   
                    	<% }  %>
                       

                </div>
            
          
                     <!--Form-Submit-of-the-Page-------------------------------------------------->
                
        </div>
    </div>
     <!--End of the Page Content-------------------------------------------->
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
     <% if(request.getParameter("DeleteID") != null ){ %>
	<div id="deleteModal" class="modal fade">
		<div class="modal-dialog modal-confirm">
			<div class="modal-content">
				<div class="modal-body">
					<p>Do you really want to delete these records? This process cannot be undone.</p>
				</div>
				<div class="modal-footer">
				<form action="DeleteMail" method="POST" > 
					<input type="hidden" name="mailID" value="<%=request.getParameter("DeleteID") %>" >
					<input type="hidden" name="messageType" value="inbox" >
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