<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SIGNUP1.aspx.cs" Inherits="SIGNUP1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">


<head runat="server">

  <meta charset="UTF-8">

  <title>Budgetize</title>

    <style>
@import url(http://fonts.googleapis.com/css?family=Exo:100,200,400);
@import url(http://fonts.googleapis.com/css?family=Source+Sans+Pro:700,400,300);

body{
	margin: 0;
	padding: 0;
	background: #fff;

	color: #fff;
	font-family: Arial;
	font-size: 12px;
}

.body{
	position: absolute;
	top: -20px;
	left: -20px;
	right: -40px;
	bottom: -40px;
	width: auto;
	height: auto;
	background-image: url(img/bg1.jpg);
	background-size: cover;
	-webkit-filter: blur(5px);
	z-index: 0;
}

.grad{
	position: absolute;
	top: -20px;
	left: -20px;
	right: -40px;
	bottom: -40px;
	width: auto;
	height: auto;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(0,0,0,0)), color-stop(100%,rgba(0,0,0,0.65))); /* Chrome,Safari4+ */
	z-index: 1;
	opacity: 0.7;
}

.header{
	position: absolute;
	top: 171px;
	left: 291px;
	z-index: 2;
}

.header div{
	float: left;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 35px;
	font-weight: 200;
}

.header div span{
	color: #5379fa !important;
}

.login{
	position: absolute;
	top: 188px;
	left: 668px;
	height: 150px;
	width: 350px;
	padding: 10px;
	z-index: 2;
}

.login input[type=text]{
	width: 250px;
	height: 30px;
	background: transparent;
	border: 1px solid rgba(255,255,255,0.6);
	border-radius: 2px;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
}

.login input[type=password]{
	width: 250px;
	height: 30px;
	background: transparent;
	border: 1px solid rgba(255,255,255,0.6);
	border-radius: 2px;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
	margin-top: 10px;
}

.login input[type=button]{
	width: 260px;
	height: 35px;
	background: #fff;
	border: 1px solid #fff;
	cursor: pointer;
	border-radius: 2px;
	color: #a18d6c;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 6px;
	margin-top: 10px;
}

.login input[type=button]:hover{
	opacity: 0.8;
}

.login input[type=button]:active{
	opacity: 0.6;
}

.login input[type=text]:focus{
	outline: none;
	border: 1px solid rgba(255,255,255,0.9);
}

.login input[type=password]:focus{
	outline: none;
	border: 1px solid rgba(255,255,255,0.9);
}

.login input[type=button]:focus{
	outline: none;
}

::-webkit-input-placeholder{
   color: rgba(255,255,255,0.6);
}

::-moz-input-placeholder{
   color: rgba(255,255,255,0.6);
}
</style>

    <script src="js/prefixfree.min.js"></script>

</head>

<body runat="server">

    <form id="form1" runat="server">

        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="AGE MUST BE IN NUMBER" style="z-index: 1; left: 955px; top: 256px; position: absolute" ValidationExpression="[0123456789]+$"></asp:RegularExpressionValidator>

  <div class="body"></div>
		<div class="grad"></div>
		<div class="header">
			<div>CUSTOMER<span>SIGNUP</span></div>
		</div>
		
		<div class="login">
				<asp:TextBox ID="TextBox1" runat="server" placeholder="FULLNAME"></asp:TextBox>
            
                
                <asp:TextBox ID="TextBox2" runat="server" placeholder="AGE"></asp:TextBox>
                <asp:TextBox ID="TextBox3" runat="server" placeholder="USERNAME"></asp:TextBox>
        <asp:TextBox ID="Email" runat="server" placeholder="Email"></asp:TextBox>
        <asp:TextBox ID="TextBox4" runat="server" placeholder="PASSWORD" TextMode="Password"></asp:TextBox>
        <asp:TextBox ID="TextBox5" runat="server" placeholder="CONFIRM PASSWORD" TextMode="Password"></asp:TextBox>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password does not match" ControlToCompare="TextBox4" ControlToValidate="TextBox5" style="z-index: 1; left: 282px; top: 244px; position: absolute"></asp:CompareValidator>
        
                <br>
				<input type="button" value="SignUp" runat="server" id="Button1" OnServerClick="Button1_OnClick">
         
        
		</div>
        

  <script src='http://codepen.io/assets/libs/fullpage/jquery.js'></script>

    </form>

</body>

</html>
