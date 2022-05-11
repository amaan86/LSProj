<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add-books.aspx.cs" Inherits="LSProject.add_books" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Books</title>
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
                align-items: center;
                padding-top: 75px;
                height: 110vh;
                width: 100%;
                transition: all 0.5s;
            }
            .box {
                text-align : center;
                display : flex;
                justify-content: center;
                align-items: center;
                width: 45%;
                background-color : rgba(255,255,255,0.8);
                border : none;
                border-radius : 3px;
                height : 100%;
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
            margin-top: 20px;
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
            form{
                display: flex;
                flex-direction: column;
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
        <form id="form1" runat="server">
            <asp:TextBox ID="bookname" runat="server" CssClass="input001" placeholder="Book Name"></asp:TextBox>
            <asp:TextBox ID="authorname" runat="server" CssClass="input001" placeholder="Author Name"></asp:TextBox>
            <asp:TextBox ID="pubdate" runat="server" CssClass="input001" placeholder="Publish Date"></asp:TextBox>
            <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Black" BorderWidth="2px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" OnSelectionChanged="Calendar1_SelectionChanged" Width="370px">
                <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                <TodayDayStyle BackColor="#CCCCCC" />
            </asp:Calendar>
            <div class="status">
                <asp:Label ID="Label" runat="server" Text="Current Status:"></asp:Label>
                <asp:RadioButton ID="available" runat="server" GroupName="status" Text="Available" />
                <asp:RadioButton ID="notavail" runat="server" GroupName="status" Text="Not Available" />
            </div>
            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="input001" />
            <asp:Button ID="add_book" runat="server" CssClass="editButton" OnClick="add_book_Click" Text="Add" />
        </form>
    </div>    
</body>
</html>
