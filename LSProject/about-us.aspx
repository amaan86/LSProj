﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="about-us.aspx.cs" Inherits="LSProject.about_us" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About us</title>
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
                height: 100vh;
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
                height: 88vh;
                display: flex;
                flex-direction: column;
                justify-content: space-evenly;
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
            .aboutpara{
                margin: 15px;
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
                <li class="links"><asp:LinkButton ID="home" runat="server" OnClick="home_Click" >Home</asp:LinkButton></li>
                <li class="links"><asp:LinkButton ID="about" runat="server" CssClass="active">About</asp:LinkButton></li>
                <li class="links"><asp:LinkButton ID="books" runat="server" OnClick="books_Click" >Available Books</asp:LinkButton></li>
                <li class="links"><asp:LinkButton ID="personal" runat="server" OnClick="personal_Click" >Personal Profile</asp:LinkButton></li>
                <li class="links"><asp:LinkButton ID="logout" runat="server" OnClick="logout_Click" >Logout</asp:LinkButton></li>
            </ul>
        </nav>
        <div class="content">
            <div class="basicinfo">
                <h3>AboutUs!</h3>
                <hr class="break"/>
            </div>
            <div class="aboutpara">
                The mission of our Library System is to make high quality digital content in religious studies available to academic institutions 
			    in the developing world in an economically feasible manner. We seek to accomplish this mission by licensing with publishers and vendors 
			    on behalf of these small institutions and creating one shared and professional managed, global library for their benefit.
            </div>
            <div class="aboutpara">
                The prime benefits of the automated library management system are to reduce overheads and increase productivity. The librarians can
			    maintain all library functions easily. In short, this system supports keeping the records of all transactions of the books available 
			    in the library.
            </div>
            <div class="aboutpara">
                The system is developed and designed with an aim to facilitate efficient management to the schools to manage a modern library with 
			    accurate data management. Thus, our system helps educational institutes such as schools, colleges, and coaching centers to manage 
			    library functions automatically.
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
