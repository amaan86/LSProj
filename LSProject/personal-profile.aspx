<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="personal-profile.aspx.cs" Inherits="LSProject.personal_profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Personal Profile</title>
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
                background-image: url('dash-back.jpg');
                font-family: 'Open Sans', sans-serif;
                display: flex;
                flex-direction: column;
                padding-top: 75px;
                height: 90vh;
                width: 100%;
                transition: all 0.5s;
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
                    transition: all 0.5s;
            }
            .logo{
                    display: inline-block;
                    width: 60px;
                    height: 30px;
                    margin-right: 10px;
            }
            .hamburger{
                position: absolute;
                right: 2%;
                top: 25%;
                cursor: pointer;
            }
            .line{
                width: 37px;
                height: 4px;
                background-color: black;
                border: none;
                margin: 7px 0; 
                border-radius: 7px;
                transition: all 0.5s;
            }
            .nav{
                position: fixed;
                left: 0;
                top: 0;
                height: 100%;
                width: 0;
                background-color: rgb(0,0,0);
                z-index: 2;
                transition: 0.5s;
                overflow-x: hidden;
                display: flex;
                flex-direction: column;
                justify-content: flex-start;
            }
             .user-info{
                margin-left: 0;
                margin-top: 60px;
                display: flex;
                flex-direction: column;
                align-items: center;
                font-weight: 800;
                height: 1px;
                transition: all 0.3s;
            }
            .user-name{
                color: #cccccc;
            }
            .userlogo{
                width: 70px;
                height: 70px;
                border-radius: 50%;
                margin-bottom: 7px;
                transition: all 0.3s;
            }
             .imp-links{
                margin: 165px 0 85px 25px;
                height: 50vh;
                font-size: 25px;
                display: flex;
                flex-direction: column;
                justify-content: flex-start;
            }
            .links{
                list-style: none;
                margin: 10px 0;
            }
            .links a{
                color: rgb(97, 97, 97);
                font-weight: 800;
                transition: all 0.3s;
                text-decoration: none;
            }
            .links a:hover{
                color: rgb(63, 63, 63);
            }
            .links asp:LinkButton{
                color: rgb(97, 97, 97);
                font-weight: 800;
                transition: all 0.3s;
                text-decoration: none;
            }
            .links asp:LinkButton:hover{
                color: rgb(63, 63, 63);
            }
            .links .active{
                color: #b8b8b8;
                text-decoration: underline;
            }
            .links .active:hover{
                color: #b8b8b8;
            }
            .content{
                width: 100%;
            }
            .basicinfo h3{
                margin-left: 15px;
                font-weight: 600;
                margin-top: 10px;
                color: #6a6464;
            }
            .break{
                margin: 10px 15px;
            }
            .Labels{
                margin: 10px 15px;
            }
            .basic-label{
                margin: 10px 15px;
            }
            .basic-img{
                border-radius: 50%;
                width: 200px;
                height: 200px;
                margin: 40px;
            }
            .input001{
			display : block;
			background-color : #ffffffc9;
			padding : 0 40px 0 10px;
			border : 1px solid #000;
			border-radius : 3px;
			width : 370px;
            display: inline-block;
			font-size : 15px;
			height : 45px;
			outline : 0px;
            }
            .input0001{
            margin: 10px 0;
            }
            .editButton{
                font-size: 20px;
                padding: 5px 25px;
                cursor: pointer;
                border: none;
                border-radius: 10px;
                background: #03a9f4;
                color: white;
                font-weight: 600;
                margin: 10px 0 0 10px;
                transition: all 0.3s;
            }
            .submitButton{
                font-size: 20px;
                padding: 9px 25px;
                cursor: pointer;
                border: none;
                border-radius: 5px;
                background: #03a9f4;
                color: white;
                font-weight: 600;
                margin: 10px 0 10px 10px;
                transition: all 0.3s;
            }
            .comblabel:nth-child(8){
                display: flex;
                justify-content: center;
                margin: 30px 0;
            }
            .comblabel:last-child{
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
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
            .pops{
                top: 15px;
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
            .relate{
                position: relative;
            }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <header id="head">
        <img src="logo.png" alt="logo" class="logo"/>
        <h1>Library Management System</h1>
        <div class="hamburger" id="ham">
            <div class="line" id="1"></div>
            <div class="line" id="2"></div>
            <div class="line" id="3"></div>
        </div>
    </header >
        <nav class="nav" id="nav">
            <div class="user-info">
                <asp:Image ID="Image1" runat="server" AlternateText="usericon" CssClass="userlogo" ImageUrl="usericon.png" />
                <asp:Label ID="username" runat="server" CssClass="user-name" Text="Amaan ali Clipwala"></asp:Label>
            </div>
            <ul class="imp-links">
                <li class="links"><asp:LinkButton ID="home" runat="server" OnClick="home_Click">Home</asp:LinkButton></li>
                <li class="links"><asp:LinkButton ID="about" runat="server" OnClick="about_Click">About</asp:LinkButton></li>
                <li class="links"><asp:LinkButton ID="books" runat="server" OnClick="books_Click">Available Books</asp:LinkButton></li>
                <li class="links"><asp:LinkButton ID="personal" runat="server" CssClass="active">Personal Profile</asp:LinkButton></li>
                <li class="links"><asp:LinkButton ID="logout" runat="server" OnClick="logout_Click">Logout</asp:LinkButton></li>
            </ul>
        </nav>
        <div class="content">
            <div class="basicinfo">
                <h3>Personal Profile</h3>
                <hr class="break"/>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-8 comblabel">
                           <asp:Image ID="profile" runat="server" CssClass="basic-img" />
                        </div>
                        <div class="col-lg-6 comblabel">
                            <label class="Labels">Name:</label>
                            <asp:Label ID="fname" runat="server" Text="Name" CssClass="basic-label"></asp:Label>
                            <asp:Button ID="name" runat="server" CssClass="editButton" Text="Edit" OnClick="name_Click" />
                            <asp:TextBox ID="ename" runat="server" CssClass="input001" placeholder="Edit Name" Visible="False"></asp:TextBox>
                            <asp:Button ID="ename_submit" runat="server" CssClass="submitButton" OnClick="ename_submit_Click" Text="Submit" Visible="False" />
                        </div>
                        <div class="col-lg-6 comblabel">
                            <label class="Labels">Enrollment:</label>
                            <asp:Label ID="enrollment" runat="server" Text="enroll" CssClass="basic-label"></asp:Label>
                        </div>
                        <div class="col-lg-12 comblabel">
                            <label class="Labels">Email:</label>
                            <asp:Label ID="email" runat="server" Text="email" CssClass="basic-label"></asp:Label>
                            <asp:Button ID="e_mail" runat="server" CssClass="editButton" Text="Edit" OnClick="e_mail_Click" />
                            <div class="relate">
                                <asp:TextBox ID="eemail" runat="server" CssClass="input001" placeholder="Edit Email" Visible="False"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="eemail" CssClass="popover pop" ErrorMessage="RegularExpressionValidator" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                    <div class="popover-body">Enter a valid E-mail address.</div>
                                    <div class="arrow"></div>
                                </asp:RegularExpressionValidator>
                            </div>
                            <asp:Button ID="eemail_submit" runat="server" CssClass="submitButton" Text="Submit" Visible="False" OnClick="eemail_submit_Click" />
                        </div>
                        <div class="col-lg-4 comblabel">
                            <label class="Labels">Phone:</label>
                            <asp:Label ID="phone" runat="server" Text="phone" CssClass="basic-label"></asp:Label>
                            <asp:Button ID="p_hone" runat="server" CssClass="editButton" Text="Edit" OnClick="p_hone_Click" />
                            <div class="relate">
                                <asp:TextBox ID="ephone" runat="server" CssClass="input001" placeholder="Edit Phone" Visible="False"></asp:TextBox>
                                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="ephone" CssClass="popover pop" ErrorMessage="RangeValidator" MaximumValue="9999999999" MinimumValue="1111111111">
                                    <div class="popover-body">Please enter a phone number.</div>
                                    <div class="arrow"></div>
                                </asp:RangeValidator>
                            </div>
                            <asp:Button ID="ephone_submit" runat="server" CssClass="submitButton" Text="Submit" Visible="False" OnClick="ephone_submit_Click" />
                        </div>
                        <div class="col-lg-4 comblabel">
                            <label class="Labels">School:</label>
                            <asp:Label ID="school" runat="server" Text="school" CssClass="basic-label"></asp:Label>
                        </div>
                        <div class="col-lg-4 comblabel">
                            <label class="Labels">Department:</label>
                            <asp:Label ID="department" runat="server" Text="department" CssClass="basic-label"></asp:Label>
                        </div>
                        <div class="col-lg-12 comblabel">
                            <asp:Button ID="pass_reset" runat="server" CssClass="editButton" Text="Reset Password" OnClick="pass_reset_Click" />
                        </div>
                        <div class="col-lg-12 comblabel">
                            <asp:TextBox ID="oldpass" runat="server" CssClass="input001 input0001" placeholder="Enter Old Password" Visible="False"></asp:TextBox>
                            <div class="relate">
                                <asp:TextBox ID="new_pass" runat="server" CssClass="input001 input0001" placeholder="Enter new Password" Visible="False"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="new_pass" CssClass="popover pop pops" ErrorMessage="RegularExpressionValidator" ValidationExpression="((?=.*\d)(?=.*[a-z]).{8,16})">
                                    <div class="popover-body">Enter a valid password.</div>
                                    <div class="arrow"></div>
                                </asp:RegularExpressionValidator>
                            </div>
                            <div class="relate">
                                <asp:TextBox ID="renew" runat="server" CssClass="input001 input0001" placeholder="Re-Enter new Password" Visible="False"></asp:TextBox>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="new_pass" ControlToValidate="renew" CssClass="popover pop pops" ErrorMessage="CompareValidator">
                                    <div class="popover-body">Re-Password should be same as Password.</div>
                                    <div class="arrow"></div>
                                </asp:CompareValidator>
                            </div>
                            <asp:Button ID="newpass_submit" runat="server" CssClass="submitButton" Text="Submit" Visible="False" OnClick="newpass_submit_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <script>
        const nav = document.getElementById("nav");
        const ham = document.getElementById("ham");
        var count=0;
        ham.addEventListener("click", function(){
            count++;
            var isEven = function(someNumber) {
                return (someNumber % 2 === 0) ? true : false;
            };
            if(isEven(count) == false){
                document.getElementById("nav").style.width = "300px";
                document.body.style.marginRight = "300px";
                document.getElementById("head").style.paddingLeft = "320px";
                document.getElementById("1").style.transform = "rotate(45deg)";
                document.getElementById("1").style.marginTop = "17px";

                document.getElementById("2").style.margin = "-10px 0";
                document.getElementById("2").style.display = "none";

                document.getElementById("3").style.transform = "rotate(135deg)";
                document.getElementById("3").style.margin = "-11px 0";
            }
            if(isEven(count) == true){
                nav.style.width = "0";
                document.body.style.marginRight = "0";
                document.getElementById("head").style.paddingLeft = "20px";

                document.getElementById("1").style.transform = "rotate(0deg)";
                document.getElementById("1").style.margin = "7px 0";

                document.getElementById("2").style.margin = "7px 0";
                document.getElementById("2").style.display = "block";

                document.getElementById("3").style.transform = "rotate(0deg)";
                document.getElementById("3").style.margin = "7px 0";
            }
        });
    </script>
    </form>
</body>
</html>
