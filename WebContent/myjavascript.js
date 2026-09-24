function login()
	{
	if(document.getElementById("txt_password").value =="" &&document.getElementById("txt_username").value == "")
		{
			
			document.getElementById("txt_username").style.borderColor='red';
			document.getElementById("txt_password").style.borderColor='red';
			alert("Please Enter Username and  Password");
			document.getElementById("txt_username").focus();
			document.getElementById("invalid_login").style.display = 'none';
			return false;
		}
		else if((document.getElementById("txt_username").value == null) || (document.getElementById("txt_username").value == "" ))
		{	
			alert(" Please Enter Username ! ");
			document.getElementById("txt_username").style.borderColor='red';
			document.getElementById("txt_username").focus();
			document.getElementById("invalid_login").style.display = "none";
			return false;  
		}
		else if((document.getElementById("txt_password").value == null) || (document.getElementById("txt_password").value == "" ))
		{
			document.getElementById("invalid_login").style.display = "none";
			alert("Please Enter  Password");
			document.getElementById("txt_password").style.borderColor='red';
			document.getElementById("invalid_login").style.display = "none";
			document.getElementById("txt_password").focus();
			return false;
		}
		else if(document.getElementById("txt_password").value =="password" &&document.getElementById("txt_username").value == "admin")
			{
				if(document.getElementById("set_login").value=="librarian" || document.getElementById("set_login").value=="student")
					{
					alert("For Admin login please click on Admin ");
					document.getElementById("txt_username").style.borderColor='red';
					document.getElementById("txt_password").style.borderColor='red';
					document.getElementById("txt_password").value ="";
					document.getElementById("txt_username").value ="";
					return false;
					}
			}
	}

function frgt_pswrd()
	{
		name=prompt("Enter User Name :", "User Name ");
		alert("Hello "+name+"\nyour password change recently..");
	}
function btn_admin()
	{
		document.getElementById("txt_username").focus();
		img = document.getElementById("lib_login");
		img.src="./images/admin2.jpg";
		document.getElementById("btn_forgot").style.display = "none";
		document.getElementById("btn_login").style.background='#0C79AC';
		document.getElementById("set_login").value="admin";
		document.getElementById("invalid_login").style.color='white';
		document.getElementById("txt_username").focus();
		return false;
	}
function libr_login()
	{
		document.getElementById("lib_login").src="./images/lib_login.png";
		document.getElementById("btn_forgot").style.display="block";
		document.getElementById("btn_login").style.background='orange';
		document.getElementById("set_login").value="librarian";
		document.getElementById("txt_username").focus();
		document.getElementById("invalid_login").style.color='white';
		return false;
		
	}
function btn_student()
	{
	document.getElementById("lib_login").src="./images/Student.png";
	document.getElementById("set_login").value='student';
	document.getElementById("btn_login").style.background='#A6DC41';
	document.getElementById("txt_username").focus();
	document.getElementById("invalid_login").style.color='white';
	return false;
	}
function visible()
	{
	
	
	}
function target_date()
	{
	var d = new Date();
	d.setDate(15);
	alert(d);
	document.getElementsByName("date").value=d;
	}
//----------------------------------------register_user-------
function hide_captcha()
{
	
		document.getElementById("txt_captcha").disabled=false;
		document.getElementById("lbl_captcha").disabled=false;
		document.getElementById("txt_empid").focus();
		
}
function submit1()
{

	if(document.getElementById("txt_empid").value =="")
	{	
		if(document.getElementById("txt_captcha").style.display=='none'){
		document.getElementById("txt_empid").style.borderColor='red';
		//alert("Please Enter Employee ID");
		document.getElementById("txt_empid").focus();
		document.getElementById("invalid_login").style.display = 'none';
		
		return false;
		}
		
	}
	
}
function select_submit()
{
	 if((document.getElementById("txt_captcha").style.display==''))
		{
			
			if(document.getElementById("txt_captcha").value=='')
			{
				
			document.getElementById("txt_captcha").focus();
			alert("Please Enter  Admin Password");
			document.getElementById("txt_captcha").style.borderColor='red';
			return false;
			}
			else if(document.getElementById("txt_captcha").value!="")
			{
				if(document.getElementById("txt_captcha").value!= "password")
				{
				document.getElementById("txt_captcha").focus();
				alert("Password not match");
				document.getElementById("txt_captcha").style.borderColor='red';
				document.getElementById("txt_captcha").value="";
				return false;
				}
				else{alert("submit sucessfully");}
			}
			
		}
		
	
}

function backwindow()
{
	window.history.back();	

}
function select_change()
{
document.getElementById("txt_captcha").style.display = '';
document.getElementById("lbl_captcha").style.display = '';
document.getElementById("txt_captcha").focus();
return false;
}
//--------------------------add book-------------
function check_text(inputtxt)  
{  
	
 var letters = /^[0-9]+$/; 
 
 if(!(inputtxt.value.match(letters)))  
   {  
    return true;  
   }  
 else  
   {  
	 alert("Please Enter only Charater ");
	   inputtxt.value='';
	 inputtxt.focus(); 
   return false;  
   }
 
} 

function check_number(inputnum)  
{  
	if(inputnum!=''){
 var letters = /^[0-9]+$/; 
 
 if(inputnum.value.match(letters))  
   {  
    return true;  
   }  
 else  
   {  
  alert("Please Enter only number ");
    inputnum.value='';
  	inputnum.focus();
   return false;  
   }  
 } 
}

function chkall_detail()
{
	if(document.getElementById("branch_name").value=="-Select Branch-")
		{
		alert("\nSelect Branch Name "); return false;
		}
	else if(document.getElementById("category").value=="-Select Category-")
	{
	alert("\nSelect category "); return false;
	}
	else if(document.getElementById("book_title").value=="" || document.getElementById("auther").value==""|| document.getElementById("publisher").value==""
		||document.getElementById("price").value==""||document.getElementById("pages").value=="")
		{
		alert("\nPlease Fill All Details "); return false;
		}
	
}

function chk_date(idate)
{
	 
	 var myDate = new Date(idate.value);
	 var today = new Date();
	 if (myDate>today)
     { 
     //something else is wrong
       alert('You cannot enter  future Date!');
       idate.focus();
       idate.value="";
       return false;
     }
		}


function check_strt_end(a)
{
	if(a.value!='' && document.getElementById("strt_book_id").value!='')
		{
		 var letters = /^[0-9]+$/; 
		  x=parseInt(a);
		  y=parseInt(document.getElementById("strt_book_id").value);
		  z=[x,y];
		  
		 if(a.value.match(letters))  
		   {  
			 if(parseInt(a.value) > parseInt(document.getElementById("strt_book_id").value) || isNaN(parseInt(a.value)))
			 {
				 
				 return true;
			 }
			 else if(parseInt(a.value) < parseInt(document.getElementById("strt_book_id").value)) {
				 alert("Starting Book ID should be less than Ending ID");a.value='';a.focus(); return false;
				 }
		      
		   }  
		 else  
		   {  
		  alert("Please Enter only number ");
		   inputnum.value='';
		   return false;  
		   }
		
		}
	else{
		alert("Starting or Ending ID filed can't be blank");
		a.focus();
	}
}

//----------------------------calculate_fine------------
function fine_submit()
{

	if(document.getElementById("stu_id").value==""){alert("Please Enter ID number !");document.getElementById("stu_id").focus();return false; }
}
function chk_fine()
{

if(document.getElementById("t_fine").value!=document.getElementById("pay_fine").value)
{
alert("Enter Amount not matched !");

document.getElementById("pay_fine").focus();
return false;
}

}