<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="LSProject.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register Here</title>
     <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <link rel="icon" href="icon.png" type="image/x-icon"/>
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
                height: 140vh;
                padding-bottom: 25px;
            }
            .box {
			text-align : center;
			display : inline-block;
			background-color : rgba(255,255,255,0.8);
			border : none;
			border-radius : 3px;
			height : 100%;
			margin-top : 120px;
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
				box-shadow: 0px 0px 20px 10px;
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
                    right: -250px;
                    top: 6px;
                    left: 398px;
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
        <h1>Library Management System</h1>
    </header>
    <div class="box">
            
            <h2>Register Here!</h2>
            <form method="POST" id="register" runat="server">
                <div class="input01">
                    <asp:TextBox ID="fullname" runat="server" CssClass="input001" placeholder="Full Name"></asp:TextBox>
                    <span class="focus"></span>
                    <span class="icon">
			<span class="fa fa-user-circle">
			</span>
                    </span>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="fullname" CssClass="popover pop" ErrorMessage="RequiredFieldValidator">
                            <div class="popover-body">Full Name Should not be empty.</div>
                            <div class="arrow"></div> 
                        </asp:RequiredFieldValidator>
                    </div>
                <div class="input01">
                    <asp:TextBox ID="enroll" runat="server" CssClass="input001" placeholder="Enrollment ID"></asp:TextBox>
                    <span class="focus"></span>
                    <span class="icon">
                        <span class="fa fa-hashtag">
                        </span>
                    </span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="enroll" CssClass="popover pop" ErrorMessage="RequiredFieldValidator">
                        <div class="popover-body">Enrollment ID should not be empty.</div>
                        <div class="arrow"></div> 
                    </asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="enroll" CssClass="popover pop" ErrorMessage="RangeValidator" MaximumValue="99999999" MinimumValue="10000000" Type="Integer">
                        <div class="popover-body">Enrollment ID should be 8 digits only.</div>
                        <div class="arrow"></div>
                    </asp:RangeValidator>
                    <asp:Label ID="Label1" runat="server" CssClass="popover pop" Style="display:none;">
                        <div class="popover-body">User already exists.</div>
                        <div class="arrow"></div>
                    </asp:Label>
                </div>
                <div class="input01">
                    <asp:TextBox ID="email" runat="server" CssClass="input001" placeholder="Email"></asp:TextBox>
                    <span class="focus"></span>
                    <span class="icon">
			<span class="fa fa-envelope">
			</span>
                    </span>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="email" CssClass="popover pop" ErrorMessage="RequiredFieldValidator">
                            <div class="popover-body">Email should not be empty.</div>
                            <div class="arrow"></div>
                        </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" CssClass="popover pop" ErrorMessage="RegularExpressionValidator" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                <div class="popover-body">Enter a proper Email address.</div>
                                <div class="arrow"></div>
                            </asp:RegularExpressionValidator>
		        </div>
                <div class="input01">
                    <asp:TextBox ID="mobile" runat="server" CssClass="input001" placeholder="Mobile"></asp:TextBox>
                    <span class="focus"></span>
                    <span class="icon">
			        <span class="fa fa-phone-square">
			        </span>

                    </span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="mobile" CssClass="popover pop" ErrorMessage="RequiredFieldValidator">
                        <div class="popover-body">Mobile should not be empty.</div>
                        <div class="arrow"></div>
                    </asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="mobile" CssClass="popover pop" ErrorMessage="RangeValidator" MaximumValue="9999999999" MinimumValue="1000000000">
                        <div class="popover-body">Enter a valid mobile number.</div>
                         <div class="arrow"></div>
                    </asp:RangeValidator>
		        </div>
                <div class="input01">
                    <asp:TextBox ID="password" runat="server" CssClass="input001" placeholder="************" type="password"></asp:TextBox>
                    <span class="focus"></span>
                    <span class="icon">
			<span class="fa fa-lock">
			</span>
                    </span>
                    <span class="eye-icon">
                        <span class="fa fa-eye" id="eyeicon"></span>
                    </span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="password" CssClass="popover pop" ErrorMessage="RequiredFieldValidator">
                        <div class="popover-body">Password should not be empty.</div>
                        <div class="arrow"></div>
                    </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="password" CssClass="popover pop" ErrorMessage="RegularExpressionValidator" ValidationExpression="((?=.*\d)(?=.*[a-z]).{8,16})">
                        <div class="popover-body">Password should contain 1 number and 1 character and should be 8-16 characters long.</div>
                        <div class="arrow"></div>
                    </asp:RegularExpressionValidator>
		        </div>
                <div class="input01">
                    <asp:DropDownList ID="school" runat="server" CssClass="input001">
                        <asp:ListItem>Select school</asp:ListItem>
                        <asp:ListItem>SBL</asp:ListItem>
                        <asp:ListItem>SET</asp:ListItem>
                        <asp:ListItem>SEDA</asp:ListItem>
                        <asp:ListItem>SS</asp:ListItem>
                    </asp:DropDownList>
                    <span class="focus"></span>
                    <span class="icon">
			<span class="fa fa-building">
			</span>
                    </span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="school" CssClass="popover pop" ErrorMessage="RequiredFieldValidator" InitialValue="Select school">
                        <div class="popover-body">Please select your school.</div>
                        <div class="arrow"></div>
                    </asp:RequiredFieldValidator>
		</div>
                <div class="input01">
                    <asp:DropDownList ID="department" runat="server" CssClass="input001">
                        <asp:ListItem>Select Department</asp:ListItem>
                        <asp:ListItem>BCA</asp:ListItem>
                        <asp:ListItem>BBA</asp:ListItem>
                        <asp:ListItem>CSE</asp:ListItem>
                        <asp:ListItem>B Tech</asp:ListItem>
                        <asp:ListItem>BA LLB</asp:ListItem>
                    </asp:DropDownList>
                    <span class="focus"></span>
                    <span class="icon">
			        <span class="fa fa-graduation-cap">
			        </span>
                    </span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="department" CssClass="popover pop" ErrorMessage="RequiredFieldValidator" InitialValue="Select Department">
                        <div class="popover-body">Please select your department.</div>
                        <div class="arrow"></div>
                    </asp:RequiredFieldValidator>
		         </div>
                <div class="input01">
                    <asp:FileUpload ID="image" runat="server" CssClass="input001" />
                    <span class="focus"></span>
                    <span class="icon">
			        <span class="fa fa-picture-o">
			        </span>
                    </span>
		        </div>
                <div>
                     <asp:Button ID="reg" runat="server" CssClass="submit" Text="Register" OnClick="reg_Click" />
                </div>
                <div class="link">
                    <p>Already have an account? <a href="Login.aspx">Login</a></p>
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
