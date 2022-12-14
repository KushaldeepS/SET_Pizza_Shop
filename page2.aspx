<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="page2.aspx.cs" Inherits="SET_Pizza_Shop.page2" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
    <div class="wrapper">
      <div class="container">
        <input type="checkbox" id="pepperoni" />
        <label for="pepperoni">
          <img src="\images\pepperoni.jpg" />
        </label>
      </div>

         <div class="container">
        <input type="checkbox" id="test" />
        <label for="test">
          <img src="\images\mashrooms.jpg" />
        </label>
      </div>

      <div class="container">
        <input type="checkbox" id="olives" />
        <label for="olives">
          <img src="\images\olives.jpg" />
        </label>
      </div>
         <div class="container">
        <input type="checkbox" id="peppers" />
        <label for="peppers">
          <img src="\images\peppers.jpg" />
        </label>
      </div>
         <div class="container">
        <input type="checkbox" id="cheese" />
        <label for="cheese">
          <img src="\images\cheese.jpg" />
        </label>
      </div>
    </div>
  </body>
</html>