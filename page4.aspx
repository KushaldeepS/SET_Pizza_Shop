<!--/*  File    :   page4.aspx
    PROJECT :       PROG2001 - final practical part
    PROGRAMMER :    Kushaldeep Singh, Yuvraj Singh
    FIRST VERSION : 12/14/2022
    DESCRIPTION :   the aspx file is to load the page content for user experience for ordering pizza*/-->
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="page4.aspx.cs" Inherits="page4.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- title for the page --> 
    <title style="font-size: 40px;">SET Pizza Shop</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type = "text/javascript" src = "jQuery.js"></script>

    <!-- Stylesheet -->
    <link rel="stylesheet" href="style.css" />
   
</head>
<body>
    
    <h3>
        <!-- header name for the website-->
        <strong>SET Pizza Shop</strong>
    </h3>
    <br /><br /><br />
    <form  runat="server">
        <div>
             <!-- div container to ask user for their name and to process input-->
            <span><%=Session["name"].ToString() %>, thank you for using SET Pizza Shop's services.</span><br /><br /><br />
            <span id="final" name="final">Your order has been <%=Session["order"].ToString() %></span>
            
            <br /><br />
        </div>
    </form>
</body>
</html>
