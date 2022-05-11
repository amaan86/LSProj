<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LSProject.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <link rel="preconnect" href="https://fonts.gstatic.com" />
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" />
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <link rel="icon" href="icon.png" type="image/x-icon"/>
    <title>Login Page</title>
            <style>
            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            body{
                background-image: url("login-back.jpg");
                font-family: 'Open Sans', sans-serif;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .box {
			text-align : center;
			display : inline-block;
			background-color : rgba(255,255,255,0.8);
			border : none;
			border-radius : 3px;
			height : 54%;
			margin-top : 20px;
			margin-bottom : 20px;
			padding : 50px;
			padding-top : 20px;
			color : #6a6464;
            backdrop-filter: blur(10px);
            }
            form{
                        margin-top: 45px;
                        display: flex;
                        flex-direction: column;
                        align-items: center;
                        justify-content: space-evenly;
            }
            .input01 {
                        position : relative;
                        display : block;
                        width : 100%;
                        padding : 0;
                        margin-bottom : 20px;
                        z-index : 1;
            }
            .icon{
			display : flex;
			position : absolute;
			margin-left : 10px;
			margin-top : -37px;
			font-size : 27px;
			align-items : center;
            }
            .input001{
			display : block;
			background-color : transparent;
			padding : 0 40px 0 50px;
			border : 1px solid #000;
			border-radius : 3px; 
			width : 100%;
			font-size : 15px;
			height : 45px;
			outline : 0px;
            }
            .focus {
			display: block;
			position: absolute;
			border-radius: 3px;
			bottom: 0;
			left: 0;
			z-index : -1;
			width: 100%;
			height: 100%;
			box-shadow: 0 0 0 0;
			color: rgba(6,136,185, 0.85);
		}
		.input001:focus + .focus{
			animation : anim-shadow 0.5s ease-in-out forwards;
		}
		@keyframes anim-shadow {
			to {
				box-shadow: 0px 0px 60px 50px;
				opacity: 0;
			}
		}
		
		.input001:focus + .focus + .icon {
			color: rgba(6, 136, 185);
		}
                .submit{
                    background: #196bff;
                    color: white;
                    font-size: 18px;
                    border: none;
                    border-radius: 3px;
                    padding: 10px;
                    width: 150px;
                    cursor: pointer;
                    transition: all 0.5s;
                }
                .submit:hover{
                    background: #196ba8;
                    transform: scale(1.1);
                }
                header{
                    background: rgba(242,242,242,0.7);
                    backdrop-filter: blur(1rem);
                    color: #6a6464;
                    position: absolute;
                    display: flex;
                    top: 0px;
                    left: 0px;
                    width: 100%;
                    height: 75px;
                    align-items: center;
                    padding: 0px 20px;
                }
                .link{
                    margin-top: 10px;
                }
                .link a{
                    color: #6a6464;
                }
                .logo{
                    display: inline-block;
                    width: 60px;
                    height: 30px;
                    margin-right: 10px;
                }
                .pop{
                    position: absolute;
                    right: -265px;
                    top: 6px;
                    left: 280px;
                    height: 35px;
                    display: block;
                    font-size: 11px;
                }
                .pop.show{
                    display: block;
                }
                .popover .arrow{
                    width: 12px;
                    height: 12px;
                    margin: 11px -7px;
                    background: white;
                    border: 1px solid rgba(0,0,0,0.2);
                    transform: rotate(45deg);
                    top: 0;
                    border-right: none;
                    border-top: none;
                }
                .eye-icon{
                    position: absolute;
                    right: 15px;
                    top: 11px;
                    cursor: pointer;
                }
        </style>
</head>
<body>
    <header>
            <img src="logo.png" alt="logo" class="logo"/>
&nbsp;<h1>Library Management System
            </h1>
    </header>

    <div class="box">
            
            <h2>Login Page</h2>
            <form id="login" runat="server">
                <div class="input01">
                    <asp:TextBox ID="enrollment" runat="server" CssClass="input001" placeholder="Enrollment ID"></asp:TextBox>
                    <span class="focus"></span>
                    <span class="icon">
                        <span class="fa fa-user-o">
                    </span>
                    </span>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="enrollment" ErrorMessage="Enrollment Should not be Empty" CssClass="popover pop">
                            <div class="popover-body">Enrollment should not be empty.</div>
                            <div class="arrow"></div>
                        </asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="enrollment" CssClass="popover pop" ErrorMessage="RangeValidator" MaximumValue="99999999" MinimumValue="10000000" Type="Integer">
                        <div class="popover-body">Enrollment should be 8 digits long only.</div>
                            <div class="arrow"></div>
                    </asp:RangeValidator>
                    <asp:Label ID="enrollErr" runat="server" CssClass="popover pop" Text="Username does not exist" Visible="False">
                        <div class="popover-body">Username does not exist.</div>
                            <div class="arrow"></div>
                    </asp:Label>
                </div>
                <div class="input01">
                    <asp:TextBox ID="password" runat="server" CssClass="input001" placeholder="***********" type="password"></asp:TextBox>
                    <span class="focus"></span>
                    <span class="icon">
			<span class="fa fa-lock">
			</span>
                    </span>
                    <span class="eye-icon">
                        <span class="fa fa-eye" id="eyeicon"></span>
                    </span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="password" CssClass="popover pop" ErrorMessage="RequiredFieldValidator">
                    <div class="popover-body">Password should not be empty.</div>
                    <div class="arrow"></div>
                </asp:RequiredFieldValidator>
                    <asp:Label ID="passErr" runat="server" CssClass="popover pop" Text="Label" Visible="False">
                        <div class="popover-body">Incorrect Password.</div>
                    <div class="arrow"></div>
                    </asp:Label>
		</div>
                <div>
                    <asp:Button ID="submit" runat="server" Text="Login" CssClass="submit" OnClick="submit_Click" />
                </div>
                <div class="link">
                    <a href="Registration.aspx">Sign up</a>
                </div>
                
            </form>
        </div>
        <script>
            var password = document.getElementById("password");
            var eyeicon = document.getElementById("eyeicon");
            eyeicon.addEventListener("click", function () {
                var type = password.getAttribute('type') === "password" ? "text" : "password";
                password.setAttribute('type', type);
                this.classList.toggle("fa-eye-slash");
                password.focus();
            });
        </script>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryConnectionString %>" SelectCommand="SELECT * FROM [Userdetails]"></asp:SqlDataSource>                
</body>
</html>
