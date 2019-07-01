<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" >

<head>
  <meta charset="UTF-8">
  <title>Login form</title>
      <link rel="stylesheet" href="styles/Login.css">

  
</head>

<body>

 <!-- The video --><div class="video-wrap">
			<video src="images/b2.mp4" playsinline autoplay muted loop></video>
		</div>
    	<div class="overlay"></div>
<div class="form">
    <form class="login100-form " action = "MemberLogin" method = "POST" >
  <div class="forceColor"></div>
     <div class="topbar">
    <div class="spanColor"></div>
    <input type="text" class="input" name="username" id="password" placeholder="Username"/>
  </div>
  <div class="topbar">
    <div class="spanColor"></div>
    <input type="password" class="input" id="password"  name="password" placeholder="Password"/>
  </div>
  <button class="submit" id="submit" type="submit">Login</button>
</form>
</div>


</body>

</html>
