<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.oop.model.*"%>
<%@page import="com.oop.service.*"%>
<%@ page import="com.oop.util.CommonConstants"%>
<%@ page import="com.oop.util.CommonUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>

<%
		if(session.getAttribute("loginDetails") == null )
		{
       		getServletContext().getRequestDispatcher("/LoginPage.jsp").forward(request, response);
			return;
		} 
      LoginHandler login = (LoginHandler) session.getAttribute("loginDetails"); 
      CommonUtil commonUtil = new CommonUtil();
 %>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="styles/style.css" />
<link rel="stylesheet" type="text/css" href="styles/styleLE.css" />
<link rel="stylesheet" type="text/css" href="styles/styleAE.css" />
<link rel="stylesheet" type="text/css" href="styles/Mail.css" />
<link rel="stylesheet" type="text/css" href="styles/Home.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
	integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
	crossorigin="anonymous">


</head>

<body>
	<div class="d-flex">
		<jsp:include page="Sidebar.jsp"></jsp:include>
		<!---Page-Content--------------------------------------------------------------------------------------------------------->

		<div id="page-wrapper">
			<div class="container-flex">

				<!--Main-Title-of-the-Page-------------------------------------------------->
				<div class="col-md-12 col-sm-12 col-xs-12" id="contentHeader">
					<h3>
						<!--Main-Header icon and Text goes here----------------------------->
						<i class="fas fa-cloud"></i> <%=commonUtil.greetingMessage() %> <span
							style="font-size: 0.65em;"> <%=login.getEmpName().substring(0 , login.getEmpName().indexOf(" ")) %></span>
					</h3>
				</div>
				<!--Left Part of the page Content----------------------------------->
<!--------------------------------------------------------------------------------------------------------------------------------------------->
				<%if( login.getAccessLevel() == 1 ){%>
				<div class="col-md-8 col-sm-12 col-xs-12" id="l">
					<div class="col-md-12 col-sm-12 col-xs-12 "
						style="padding: 0px 0px 5px 0px;">
						<% 	int cardNo = 1;
							LinkedHashMap<String,Integer> hashMap = commonUtil.getCounts(login.getEmpId());
							for(Map.Entry<String,Integer> card :  hashMap.entrySet() )
							{	
						%>
						<div class="col-xs-3 cardholder">
							<div class="col-xs-12 cards" id="card<%=cardNo++%>">
								<h1 class="cardNo"><%=String.format("%02d",  card.getValue() ) %></h1>
								<h5><%=card.getKey()%></h5>
							</div>
						</div>
						<%} %>
					</div>
					<%}else{ %>
<!--------------------------- ------------------------------------------------------------------------------------------------------------ -->
			<div class="col-md-8 col-sm-12 col-xs-12" id="l">
					<div class="col-md-12 col-sm-12 col-xs-12 "
						style="padding: 0px 0px 5px 0px;" >
							<% 
							  DateFormat day = new SimpleDateFormat("EEEE");
							  DateFormat date = new SimpleDateFormat("dd");
							  ArrayList<Calendar> week = commonUtil.getDaysOfWeek();
							  Date today = new Date();
								for( Calendar days : week){ %>
						<div class="col-xs-2 cardholder">
							<div class="col-xs-12 datecards text-center <%=(today.equals(days.getTime()))? "today" : "" %>">
								<h1 class="cardNo"><%=date.format(days.getTime() ) %></h1>
								<h5 style="margin-top:4px;"><%=day.format(days.getTime() ) %></h5>
							</div>
						</div>
						<%} %>
					</div>
					<%} %>
<!--------------------------- ------------------------------------------------------------------------------------------------------------ -->
					<div class="col-md-12 col-sm-12 col-xs-12 " id="left">
						<h5 class="FormHeader" style="margin-bottom: 0px !important">
							<strong> Latest Announcement</strong>
						</h5>
					<% IAnnouncementService announcementService = new AnnouncementServiceImpl();
						ArrayList<Announcement> arrayList1 =  announcementService.viewAllAnnouncement();
						if( !arrayList1.isEmpty() ){
							for( Announcement ann : arrayList1){
						
					%>
						<div class="col-xs-12 announcement">
							<label >
								<span class='btn btn-xs btn-<%=(ann.getType() == 1 )? "danger" : "success" %>'>
									<i class="fas fa-bell"></i>
								</span> 
							<%=ann.getTitle() %>
							</label>
								<span class="mailDateAndTime"><%=ann.getDate() %></span>
							<p align="justify" ><%=ann.getAnnouncementText() %><p> 
						</div>
					<% } }else{ %>
					<div class="col-xs-12 announcement">
							<label >There are currently no announcement available </label>
					</div>
					<% } %>
					</div>
<!-- ------------------------------------------------------------------------------------------------------------ -->
				</div>
				<!--End of the left Part-------------------------------------------->
				<!--Right Part of the page Content----------------------------------->
				<div class="col-md-4 col-sm-12 col-xs-12" id="l">
					<div class="col-md-12 col-sm-12 col-xs-12  " id="right">

						<h5 class="FormHeader" styles="margin : 0px">
							<strong> <i class="fas fa-envelope"></i> Inbox
							</strong>
						</h5>
						<%   
                            	int count = 0;
                            	IMailService mailService = new MailServiceImpl();
                            	IEmployeeService employeeService = new EmployeeServiceImpl();
                            	ArrayList<Mail> arrayList  = mailService.viewMails(login.getEmpId(), CommonConstants.ID_VIEW_ALL_RECEIVE_MAILS );
                            	if( !arrayList1.isEmpty() ){
                            	for (Mail mail : arrayList){
                            		Employee employee = employeeService.getEmployeeDetails(mail.getSenderId());		
                            %>
						<form action="ViewMail" method="POST" id="<%=mail.getMailId() %>">
							<input type="hidden" name="mailId" value="<%=mail.getMailId() %>">
							<input type="hidden" name="readStatus"
								value="<%=mail.getRead() %>"> <input type="hidden"
								name="MessageType" value="Inbox"> <a
								href="javascript:{}"
								onclick="document.getElementById('<%=mail.getMailId() %>').submit();">

								<div class="col-xs-12 messageBox" id='<%=( mail.getRead() == 0 ) ? "Active" : "Deactive" %>'>
									<div class="col-xs-1">

										<img
											src="images/<%=( employee.getImagePath()== null) ? "user.jpg" : employee.getImagePath() %>"
											width="35px" style="border-radius: 20px;">
									</div>
									<div class="col-xs-11">
										<h6 class="senderName" style="padding-left: 10px;"><%=employee.getFirstName() + " " + employee.getLastName()  %>
											<span class="mailDateAndTime"><%=mail.getSentTime() %>
												&nbsp &nbsp <%=mail.getSentDate() %></span>
										</h6>
										<p class="mailContent" style="padding-left: 10px;"><%=mail.getTitle() %>
										</p>
									</div>
								</div>
							</a>
						</form>

						<%
							  count++;
                          	if(count == 4)
                          		break;
                            	} } if(arrayList.size() == 0 ){ %>
                            	 <div class="col-xs-12" >

                    	 			 <img src="images/nomails.png" width="100%">
                    	 		 </div>
                            	<% }%>
					</div>
<!-- ------------------------------------------------------------------------------------------------------------------------------------- -->
					<div class="col-md-12 col-sm-12 col-xs-12  " id="right" style="margin-top :15px !important;">

						<h5 class="FormHeader" styles="margin : 0px">
							<strong> <i class="fas fa-birthday-cake"></i> Birthday Buddies
							</strong>
						</h5>
						<%  DateFormat dateFormat = new SimpleDateFormat("EEEE MMMM dd"); 
							ArrayList<Employee> array = commonUtil.getBirthdaysInThisMonth();
                            	if( !array.isEmpty() ){
                            	for (Employee employee : array){	
                            String Birthday = dateFormat.format( new SimpleDateFormat("yyyy-MM-dd").parse(employee.getDateOfBirth()) );
                            %>
								<div class="col-xs-12 messageBox" >
									<div class="col-xs-1">

										<img
											src="images/<%=( employee.getImagePath()== null) ? "user.jpg" : employee.getImagePath() %>"
											width="35px" style="border-radius: 20px;">
									</div>
									<div class="col-xs-11">
										<h6 class="senderName" style="padding-left: 10px;"><%=employee.getFirstName() + " " + employee.getLastName()  %>
											<span class="mailDateAndTime"></span>
										</h6>
										<p class="mailContent" style="padding-left: 10px;"><b><%=Birthday %></b> 
										</p>
									</div>
								</div>

						<% } } if(array.size() == 0 ){ %>
                            	 <div class="col-xs-12" >
                    	 			 <img src="images/nomails.png" width="100%">
                    	 		 </div>
                            	<% }%>
					</div>
				</div>

			</div>
		</div>
		<!--End of the Page Content-------------------------------------------->
	</div>

</body>

</html>