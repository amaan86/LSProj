<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="available-books.aspx.cs" Inherits="LSProject.available_books" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Available Books</title>
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
                justify-content: center;
                align-items: center;
                height: auto;
                width: 100%;
                padding-top: 75px;
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
                min-height: 100vh;
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
            img{
                width: 180px;
                border-radius: 10px;
            }
            .search{
                align-items: center;
                width: 100%;
            }
            .searchbox{
                font-size: 25px;
                padding: 5px;
                width: 82%;
                margin: 20px 0;
                border-radius: 10px;
                box-shadow: 0 0 10px 0 #c1c1c1;
                border: none;
                outline: none;
            }
            .searchbutton{
                font-size: 20px;
                padding: 9px 35px;
                cursor: pointer;
                border: none;
                border-radius: 10px;
                background: #03a9f4;
                color: white;
                font-weight: 600;
                margin: 0 0 0 10px;
                transition: all 0.3s;
            }
            .searchbutton:hover{
                background: #2196f3;
            }
            .available{
                font-size: 20px;
                padding: 9px 85px;
                cursor: pointer;
                border: none;
                border-radius: 10px;
                background: #03a9f4;
                color: white;
                font-weight: 600;
                margin: 0 0 10px 30%;
                transition: all 0.3s;
            }
            .available:hover{
                background: #2196f3;
            }
            th, td{
                padding: 5px 10px;
            }
            .tdimage{
                padding: 0;
            }
            h3{
               text-align: center;
               font-weight: 600;
               margin-top: 10px;
               color: #6a6464;
            }
            .content p{
                width: 950px;
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
                <li class="links"><asp:LinkButton ID="books" runat="server" CssClass="active">Available Books</asp:LinkButton></li>
                <li class="links"><asp:LinkButton ID="personal" runat="server" OnClick="personal_Click">Personal Profile</asp:LinkButton></li>
                <li class="links"><asp:LinkButton ID="logout" runat="server" OnClick="logout_Click">Logout</asp:LinkButton></li>
            </ul>
        </nav>
            <div class="content">
                <h3>Search Books</h3>
                <p>Student can easily search books of their interest as well as can check all the available books in real time. User can insert any keyword related to the book
                    and can easily search the book along with its current status for hard copy. Below that, User can go through all the available books by clicking 'Show All Available Books' by which user can categorize 
                    within the book's availability.
                </p>
                <div class="search">
                    <asp:TextBox ID="search" runat="server" CssClass="searchbox" placeholder="Enter any Keyword"></asp:TextBox>
                    <asp:Button ID="searchbutton" runat="server" CssClass="searchbutton" Text="Search" OnClick="searchbutton_Click" />
                    <asp:Button ID="available" runat="server" CssClass="available" Text="Show all Available Books" OnClick="available_Click" />
                </div>
                <div class="result">
                    
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                        <Columns>
                            <asp:BoundField DataField="BID" HeaderText="BID" />
                            <asp:BoundField DataField="BookName" HeaderText="Book Name" />
                            <asp:BoundField DataField="AuthorName" HeaderText="Author Name" />
                            <asp:BoundField DataField="Published" HeaderText="Publish Date" />
                            <asp:BoundField DataField="CurrentStatus" HeaderText="Current Status" />
                            <asp:ImageField DataImageUrlField="Book" HeaderText="Book">
                                <ItemStyle CssClass="tdimage" />
                            </asp:ImageField>
                        </Columns>
                        <FooterStyle BackColor="#101010" />
                        <HeaderStyle BackColor="#2196f3" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#101010" ForeColor="Black" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
                    </asp:GridView>
                    
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryConnectionString %>" SelectCommand="SELECT * FROM [Books]"></asp:SqlDataSource>
        
    </form>
</body>
</html>
