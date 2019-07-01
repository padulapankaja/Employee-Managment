  
    
document.getElementById("basicSalary").addEventListener("keyup", calTotal );
document.getElementById("dearnessAllow").addEventListener("keyup", calTotal );
document.getElementById("medicalAllow").addEventListener("keyup", calTotal );
document.getElementById("houserentAllow").addEventListener("keyup", calTotal );
document.getElementById("foodAllow").addEventListener("keyup", calTotal );
document.getElementById("telephoneAllow").addEventListener("keyup", calTotal );
document.getElementById("bonus").addEventListener("keyup", calTotal );
document.getElementById("other").addEventListener("keyup", calTotal );


		 
document.getElementById("professionalTax").addEventListener("keyup", calTotal );
document.getElementById("providentTax").addEventListener("keyup", calTotal );
document.getElementById("loan").addEventListener("keyup", calTotal );
document.getElementById("insurence").addEventListener("keyup", calTotal );


function calTotal() {
	var income = 0;
	var deduction = 0;
	var total = 0;
	
if(document.getElementById("basicSalary").value){
	income += parseFloat(document.getElementById("basicSalary").value);
}
 if(document.getElementById("dearnessAllow").value){
	income += parseFloat(document.getElementById("dearnessAllow").value);
 }
 if(document.getElementById("medicalAllow").value){
	income += parseFloat(document.getElementById("medicalAllow").value);
 }
 if(document.getElementById("houserentAllow").value){
	income += parseFloat(document.getElementById("houserentAllow").value);
 }
 if(document.getElementById("foodAllow").value){
	income += parseFloat(document.getElementById("foodAllow").value);
 }
 if(document.getElementById("telephoneAllow").value){
	income += parseFloat(document.getElementById("telephoneAllow").value);
 }
 if(document.getElementById("bonus").value){
	income += parseFloat(document.getElementById("bonus").value);
 }
 if(document.getElementById("other").value){
	income += parseFloat(document.getElementById("other").value);
 }
 if(document.getElementById("professionalTax").value){
	 deduction += parseFloat(document.getElementById("professionalTax").value);
 }
 if(document.getElementById("providentTax").value){
	 deduction += parseFloat(document.getElementById("providentTax").value);
 }
 if(document.getElementById("loan").value){
	 deduction += parseFloat(document.getElementById("loan").value);
 }
 if(document.getElementById("insurence").value){
	 deduction += parseFloat(document.getElementById("insurence").value);
 }
 
 total = income - deduction;
 document.getElementById("totalIncome").value = income;
 document.getElementById("totDedution").value = deduction;
 document.getElementById("totAmount").value = total;
}
