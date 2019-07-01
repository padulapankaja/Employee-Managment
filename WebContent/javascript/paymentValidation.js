function paymentValidation(){  
	

var basicSalary = document.addPayment.basicSalary.value;
var dearnessAllow = document.addPayment.dearnessAllow.value;
var medicalAllow = document.addPayment.medicalAllow.value;
var houserentAllow = document.addPayment.houserentAllow.value;
var foodAllow = document.addPayment.foodAllow.value;
var telephoneAllow = document.addPayment.telephoneAllow.value;
var bonus = document.addPayment.bonus.value;
var other = document.addPayment.other.value;
var professionalTax = document.addPayment.professionalTax.value;
var providentTax = document.addPayment.providentTax.value;
var loan = document.addPayment.loan.value;
var insurence = document.addPayment.insurence.value;





	



 var Error = 0;  
	
 
//----------------------------------------------------------------------- 
 if (basicSalary==null || basicSalary==""){  
		document.getElementById("basicSalaryError").innerText = " *Requiered";
	    Error++;
	}else{
		
		if( !basicSalary.match(/^[0-9]+$/) ){
			 document.getElementById("basicSalaryError").innerText = " Number Required";
			 Error++;	 
		 }else{
		document.getElementById("basicSalaryError").innerText = "";
		 }
	}
 
//----------------------------------------------------------------------- 
 if (dearnessAllow==null || dearnessAllow==""){  
	 document.getElementById("dearnessAllowError").innerText = " *Requiered";
	 Error++;
 }else{
		document.getElementById("dearnessAllowError").innerText = "";
	}
 
//----------------------------------------------------------------------- 
 if ( medicalAllow ==null || medicalAllow ==""){  
	 document.getElementById("medicalAllowError").innerText = " *Requiered";
	 Error++;
 }else{
	 document.getElementById("medicalAllowError").innerText = "";
 }
 
//----------------------------------------------------------------------- 
 if ( houserentAllow ==null || houserentAllow ==""){  
	 document.getElementById("houserentAllowError").innerText = " *Requiered";
	 Error++;
 }else{
	 document.getElementById("houserentAllowError").innerText = "";
 }
//----------------------------------------------------------------------- 
 if ( foodAllow ==null || foodAllow ==""){  
	 document.getElementById("foodAllowError").innerText = " *Requiered";
	 Error++;
 }else{
	 document.getElementById("foodAllowError").innerText = "";
 }
/*---------------------------------------------------------------------*/
 if ( telephoneAllow ==null || telephoneAllow ==""){  
	 document.getElementById("telephoneAllowError").innerText = " *Requiered";
	 Error++;
 }else{
	 document.getElementById("telephoneAllowError").innerText = "";
 }
//-------------------------------------------------------------------
 if ( bonus ==null || bonus ==""){  
	 document.getElementById("bonusError").innerText = " *Requiered";
	 Error++;
 }else{
	 document.getElementById("bonusError").innerText = "";
 }
//-------------------------------------------------------------------
if ( other ==null || other ==""){  
	document.getElementById("otherError").innerText = " *Requiered";
	Error++;
}else{
	document.getElementById("otherError").innerText = "";
}
//-------------------------------------------------------------------
if ( professionalTax ==null || professionalTax ==""){  
	document.getElementById("professionalTaxError").innerText = " *Requiered";
	Error++;
}else{
	document.getElementById("professionalTaxError").innerText = "";
}
//-------------------------------------------------------------------
if ( providentTax ==null || providentTax ==""){  
	document.getElementById("providentTaxError").innerText = " *Requiered";
	Error++;
}else{
	document.getElementById("providentTaxError").innerText = "";
}
//-------------------------------------------------------------------
if ( insurence ==null || insurence ==""){  
	document.getElementById("insurenceError").innerText = " *Requiered";
	Error++;
}else{
	document.getElementById("insurenceError").innerText = "";
}
//-------------------------------------------------------------------
if ( loan ==null || loan ==""){  
	document.getElementById("loanError").innerText = " *Requiered";
	Error++;
}else{
	document.getElementById("loanError").innerText = "";
}
//-------------------------------------------------------------------


 
 if(Error > 0 )
	 return false;
 else 
	 return true;


  
}