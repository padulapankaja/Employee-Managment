function validateform(){  
var fname =document.addEmployee.fname.value;  
var lname =document.addEmployee.lname.value; 
var dob =document.addEmployee.dob.value; 
var spname =document.addEmployee.spname.value; 
var nationality =document.addEmployee.nationality.value; 
var nic = document.addEmployee.nic.value; 
var address = document.addEmployee.address.value;

var city = document.addEmployee.city.value; 
var zipcode = document.addEmployee.zipcode.value; 
var mobile = document.addEmployee.mobile.value; 
var phone = document.addEmployee.phone.value; 
var email = document.addEmployee.email.value; 
var enumber = document.addEmployee.enumber.value; 

var bankname = document.addEmployee.bankname.value; 
var branchno = document.addEmployee.branchno.value; 
var accountno = document.addEmployee.accountno.value; 
var designation = document.addEmployee.designation.value; 




 var Error = 0;  
	
//----------------------------------------------------------------------- 
 if (fname==null || fname==""){  
		document.getElementById("fnameError").innerText = " *Requiered";
	    Error++;
	}else{
		document.getElementById("fnameError").innerText = "";
	}
 
//----------------------------------------------------------------------- 
 if (lname==null || lname==""){  
	 document.getElementById("lnameError").innerText = " *Requiered";
	 Error++;
 }else{
		document.getElementById("lnameError").innerText = "";
	}
 
//----------------------------------------------------------------------- 
 if ( dob ==null || dob ==""){  
	 document.getElementById("dobError").innerText = " *Requiered";
	 Error++;
 }else{
	 document.getElementById("dobError").innerText = "";
 }
 
//----------------------------------------------------------------------- 
 if ( spname ==null || spname ==""){  
	 document.getElementById("spnameError").innerText = " *Requiered";
	 Error++;
 }else{
	 document.getElementById("spnameError").innerText = "";
 }
//----------------------------------------------------------------------- 
 if ( nationality ==null || nationality ==""){  
	 document.getElementById("nationalityError").innerText = " *Requiered";
	 Error++;
 }else{
	 document.getElementById("nationalityError").innerText = "";
 }
/*---------------------------------------------------------------------*/
 if ( nic ==null || nic ==""){  
	 document.getElementById("nicError").innerText = " *Requiered";
	 Error++;
 }else{
	 document.getElementById("nicError").innerText = "";
 }
//-------------------------------------------------------------------
 if ( address ==null || address ==""){  
	 document.getElementById("addressError").innerText = " *Requiered";
	 Error++;
 }else{
	 document.getElementById("addressError").innerText = "";
 }
//-------------------------------------------------------------------
if ( city ==null || city ==""){  
	document.getElementById("cityError").innerText = " *Requiered";
	Error++;
}else{
	document.getElementById("cityError").innerText = "";
}
//-------------------------------------------------------------------
if ( zipcode ==null || zipcode ==""){  
	document.getElementById("zipcodeError").innerText = " *Requiered";
	Error++;
}else{
	document.getElementById("zipcodeError").innerText = "";
}
//-------------------------------------------------------------------
if ( mobile ==null || mobile ==""){  
	document.getElementById("mobileError").innerText = " *Requiered";
	Error++;
}else{
	document.getElementById("mobileError").innerText = "";
}
//-------------------------------------------------------------------
if ( phone ==null || phone ==""){  
	document.getElementById("phoneError").innerText = " *Requiered";
	Error++;
}else{
	document.getElementById("phoneError").innerText = "";
}
//-------------------------------------------------------------------
if ( email ==null || email ==""){  
	document.getElementById("emailError").innerText = " *Requiered";
	Error++;
}else{
	document.getElementById("emailError").innerText = "";
}
//-------------------------------------------------------------------
if ( enumber ==null || enumber ==""){  
	document.getElementById("enumberError").innerText = " *Requiered";
	Error++;
}else{
	document.getElementById("enumberError").innerText = "";
}

//-------------------------------------------------------------------
if ( designation ==null || designation ==""){  
	document.getElementById("designationError").innerText = " *Requiered";
	Error++;
}else{
	document.getElementById("designationError").innerText = "";
}
//-------------------------------------------------------------------
if ( bankname ==null || bankname ==""){  
	document.getElementById("banknameError").innerText = " *Requiered";
	Error++;
}else{
	document.getElementById("banknameError").innerText = "";
}
//-------------------------------------------------------------------
if ( branchno ==null || branchno ==""){  
	document.getElementById("branchnoError").innerText = " *Requiered";
	Error++;
}else{
	document.getElementById("branchnoError").innerText = "";
}
//-------------------------------------------------------------------
if ( accountno ==null || accountno ==""){  
	document.getElementById("accountnoError").innerText = " *Requiered";
	Error++;
}else{
	document.getElementById("accountnoError").innerText = "";
}
//------------------------------------------------------------------



 
 if(Error > 0 )
	 return false;
 else 
	 return true;


  
}