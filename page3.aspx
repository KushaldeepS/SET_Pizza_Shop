<!--/*  File    :   page3.aspx
    PROJECT :       PROG2001 - final practical part
    PROGRAMMER :    Kushaldeep Singh, Yuvraj Singh
    FIRST VERSION : 12/14/2022
    DESCRIPTION :   the aspx file is to load the page content for user experience for ordering pizza*/-->
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="page3.aspx.cs" Inherits="page3.Default" %>

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
<body onload="GetSummary()">
    
    <h3>
        <!-- header name for the website-->
        <strong>SET Pizza Shop</strong>
    </h3>
    <br /><br /><br />
    <form  runat="server" id="page3">
        <div>
             <!-- div container to ask user for their name and to process input-->
            <span><%=Session["firstName"].ToString() %>, Here is the summary of your order: </span>
            
            <br />
            <br /><br />
            
            <span>The total price for the pizza is  </span><span id="amount" name="amount"></span><br /><br /> 
            <span>Your selected topping for the pizza: </span><span id="content" name="content"></span><br /><br /><br />

            <asp:Button runat="server" type="button" id="cancel" name="cancel" OnClick="Cancel_Click" Text="Cancel Order"/>
            <asp:Button runat="server" id="submit" type="button" onclick="Submit_Click" Text="Confirm Order"/>
            <br /><br />
        </div>
    </form>
</body>
</html>
