/*  File        :   jQuery.js
    PROJECT :       PROG2001 - Final Practical part
    PROGRAMMER :    Kushaldeep Singh, Yuvraj Singh
    FIRST VERSION : 12/14/2022
    DESCRIPTION :   The jquery file to make ajax call and parse value to html elements*/

// global variable - for use in jQuery (AJAX) calls
var request; 
var filename;
let name = sessionStorage["name"];
let firstName = sessionStorage["firstName"];
var totalPrice;

//jquery activate only when ready
//does the initial call to get the file list on document ready
$(document).ready(function () { 

});

/*
* FUNCTION    : GetToppings()
* DESCRIPTION :
*       This function opens a directory from the system. It uses an ajax call to access the code
*       behind webmethod GetFiles to do the file IO and return the data.
* PARAMETERS  :
*      Nothing.
* RETURNS     :
*      Nothing.
*/
function GetToppings() {
    var finalToppings = "";
    var selectedToppings = "";
    var first = false;
    $('input[type=checkbox]:checked').each(function (index) {
        //part where the magic happens
        selectedToppings += " " + $(this).val();
        //finalToppings += this.id;
        if (first == false) {
            finalToppings += $(this).attr('id');
            first = true;
        }
        else {
            finalToppings += ", " + $(this).attr('id');
            
        }
    });
    sessionStorage["finalTopping"] = finalToppings;
    //build the outgoing JSON parameter being passed in the C# (code behind) entry point
    var jsonData = { toppings: selectedToppings };
    var jsonString = JSON.stringify(jsonData);
    //jQuery AJAX call to GetFiles webmethod (code behind) for sending and receiving JSON
    request = $.ajax({
        type: "POST",
        url: "page2.aspx/calculateSUM",
        data: jsonString,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            if (data != null && data.d != null) {
                

                //we need to parse it to JSON 
                response = $.parseJSON(data.d);
                totalPrice = response.value;
                document.getElementById("price").innerText = response.value;
                sessionStorage["totalPrice"] = totalPrice;
            }
        },
        fail: function () {             //in case it fails:
            document.getElementById("price").innerHTML = "failed!";
        }
    });

}



/*
* FUNCTION    : GetSummary()
* DESCRIPTION :
*       get the summary of the order of the user
* PARAMETERS  :
*      Nothing.
* RETURNS     :
*      Nothing.
*/
function GetSummary() {
    
    var temp = sessionStorage["finalTopping"];

    const values = temp.split("undefined");
    document.getElementById("content").innerText = values;
    document.getElementById("amount").innerText = sessionStorage["totalPrice"];
    
}




