<!-- /*  File        :   page3.aspx
    PROJECT :       PROG2001 - final practical part
    PROGRAMMER :    Kushaldeep Singh, Yuvraj Singh
    FIRST VERSION : 12/14/2022
    DESCRIPTION :   the aspx file is to load the page content for user experience for ordering pizza*/ -->
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="page2.aspx.cs" Inherits="SET_Pizza_Shop.page2" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type = "text/javascript" src = "jQuery.js"></script>
    <title>Image As Checkbox</title>
    <!-- Font Awesome Icons -->
   <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
    />

    <!-- Stylesheet -->
    <link rel="stylesheet" href="style.css" />
  </head>
<body>
    <h3>
        <!-- header name for the website-->
        <strong>SET Pizza Shop</strong>
    </h3>
    <br />
   
    <!-- form element to submit the required information to next page -->
    <form runat="server" id="page2" name="page2">
        <span>Ciao <%=Session["firstName"].ToString() %>! At the SET Pizza Shop You can only order one large Pizza</span><br /><br />

        
        <span>The pizza comes with pizza sauce and cheese</span><br /><br />
        
        <!-- div container to ask user for the topping and to process input-->
        <span><%=Session["firstName"].ToString() %>, please Select toppings to add to the pizza -: </span>
        
        <br />

        <div class="wrapper">
            <!-- div container to store the input for topping selected from the options and to display chechbox options to user-->
            <div class="container">
                <label id="topping1">pepperoni</label>
                <input name="topping" type="checkbox" id="pepperoni" value="2" onclick="GetToppings()"/>
                <label for="pepperoni">
                    <img src="\images\pepperoni.jpg" />
                </label>

            </div>

            <div class="container">
                <label id="topping2">Mushrooms</label>
                <input name="topping" type="checkbox" id="Mushrooms" value="1" onclick="GetToppings()"/>
                <label for="test">
                    <img src="\images\mashrooms.jpg" />
                </label>
            </div>

            <div class="container">
                <label id="topping3">Green Olives</label>
                <input name="topping" type="checkbox" id="olives" value="1" onclick="GetToppings()"/>
                <label for="olives">
                    <img src="\images\olives.jpg" />
                </label>
            </div>
            <div class="container">
                <label id="topping4">Green Peppers</label>
                <input name="topping" type="checkbox" id="peppers" value="1" onclick="GetToppings()"/>
                <label for="peppers">
                    <img src="\images\peppers.jpg" />
                </label>
            </div>
            <div class="container">
                <label id="topping5">Double Cheese</label>
                <input name="topping" type="checkbox" id="cheese" value="3" onclick="GetToppings()" />
                <label for="cheese">
                    <img src="\images\cheese.jpg" />
                </label>

            </div>
            <div><!-- Button and the total price presented to user when they selects toppings-->
                <span>Total price: </span><span id="price" name="price"></span><br /><br />
                <asp:Button runat="server" id="submit" type="button" onclick="Submit_Click" Text="Make It!" />
            </div>
        </div>
        
    </form>
</body>
</html>