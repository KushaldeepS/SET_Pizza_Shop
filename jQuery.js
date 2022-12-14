/*  File            :   StarPage.aspx
    PROJECT :       PROG2001 - A-07 : JQUERY AND JSON BASED TEXT EDITOR
    PROGRAMMER :    Kushaldeep Singh, Yuvraj Singh
    FIRST VERSION : 12/08/2022
    DESCRIPTION :   the .js file is to make AJAX calls and load the file contents that are sent from the server to pass it to textbox area for editing
                    if the contents are changed prompt to save or neglect changes*/
// global variable - for use in jQuery (AJAX) calls
var request; 
var filename;
let name = sessionStorage["name"];
let firstName = sessionStorage["firstName"];
//jquery activate only when ready
//does the initial call to get the file list on document ready
$(document).ready(function () { 
    //GetFiles();                                                 //getting the files names into the select 

    //var selected = document.getElementsByName("topping").values;
    //if (selected == "") {

    //}
    
    $('#dropdown').on('change', function () {                   //when the user select a file from the list 
        document.getElementById("txtBox").innerText = "";
        if (this.value) {
            filename = this.value;                              //giving to th filename variable the name of the file selected by the user 
            openAndReadFileContents(this.value);                //extracting the content of the file by calling openAndReadFileContents() function.
        }
        else {
            resetForm();
        }
    });
});

/*
* FUNCTION    : GetFiles()
* DESCRIPTION :
*       This function opens a directory from the system. It uses an ajax call to access the code
 *       behind webmethod GetFiles to do the file IO and return the data.
* PARAMETERS  :
*      Nothing.
* RETURNS     :
*      Nothing.
*/
function GetFiles() {
                                           
    var openFileData = "";                  // variable to hold the file's location
    openfileData = "MyFiles";

    //build the outgoing JSON parameter being passed in the C# (code behind) entry point
    var jsonData = { fileToLoad: openfileData };
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
                var response;

                //we need to parse it to JSON 
                response = $.parseJSON(data.d);
                
                //removing any previous files from the list so each time the user call this function thge file names do not get repeted.
                $('#dropdown').empty().append($('<option selected disabled hidden> Select a file </option>', {
                    value: "empty", text: ""
                }));
                //appending each file in the select options
                $.each(response.fileNames, function (i, item) {
                    $('#dropdown').append($('<option>', {
                        value: item,text: item
                    }));
                });
            }
        },
        fail: function () {             //in case it fails:
            document.getElementById("statusMessage").innerHTML = "The call to the WebMethod failed!";
        }
    });

}

/*
* FUNCTION    : openAndReadFileContents()
* DESCRIPTION :
*       This function opens a file from the system. It uses an ajax call to access the code
 *       behind webmethod OpenFile to do the file IO and return the data.
* PARAMETERS  :
*      Nothing.
* RETURNS     :
*      Nothing.
*/
function openAndReadFileContents()
{

    openfileData = filename;                // filename of file to open
    var openFileData = "";                  // variable to hold the file's contents (if opened)

    //building the outgoing JSON parameter being passed in the C# (code behind) entry point
    var jsonData = { fileToLoad: openfileData};
    var jsonString = JSON.stringify(jsonData);

    //jQuery AJAX call to OpenFile webmethod (code behind) for sending and receiving JSON
    request = $.ajax({
        type: "POST",
        url: "Startpage.aspx/OpenFile",
        data: jsonString,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data){
            if (data != null && data.d != null)
            {
                var response;

                //we need to parse it to JSON 
                response = $.parseJSON(data.d);

                //giving the recived values to the html 
                document.getElementById("statusMessage").innerHTML = "File loading status : <b>" + response.status + "</b>";

                //response.description = content of the file
                document.getElementById("txtBox").value = response.description;       
            }
        },
        fail: function (){
            document.getElementById("statusMessage").innerHTML = "The call to the WebMethod failed!";
        }
    });
}    


/*
* FUNCTION    : saveFile()
* DESCRIPTION :
*       This function saves a file in the system. It uses an ajax call to access the code
 *       behind webmethod SaveFile to do the file IO and return the data.
* PARAMETERS  :
*      Nothing.
* RETURNS     :
*      Nothing.
*/
function saveFile() {
    // giving to the content variable the value present in the text box.
    var content = document.getElementById("txtBox").value;

    //building the outgoing JSON parameter being passed in the C# (code behind) entry point
    var json = JSON.stringify({ filename, content });

    //jQuery AJAX call to SaveFile webmethod (code behind) for sending and receiving JSON
    request = $.ajax({
        type: "POST",
        url: "startPage.aspx/SaveFile",
        data: json,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            if (data !== null && data.d !== null) {
                var response;

                //we need to parse it to JSON 
                response = $.parseJSON(data.d);

                //giving the response status to the statusMessage so the user can see if the operation was successful or not
                document.getElementById("statusMessage").innerHTML = response.status;
            }
        },
        fail: function () {
            document.getElementById("statusMessage").innerHTML = "Error!";
        }
    });
}


/*
* FUNCTION    : saveAs()
* DESCRIPTION :
*       This function saves/creates a file in the system. It uses an ajax call to access the code
 *       behind webmethod SaveFile to do the file IO and return the data.
* PARAMETERS  :
*      Nothing.
* RETURNS     :
*      Nothing.
*/
function saveAs() {

    //variables to build the JSON parameters:
    var content = document.getElementById("txtBox").value;

    //getting the file name from a textbox
    var filename = document.getElementById("saveFileTextbox").value;

    //building the outgoing JSON parameter being passed in the C# (code behind) entry point
    var json = JSON.stringify({ filename, content });

    //jQuery AJAX call to SaveFile webmethod (code behind) for sending and receiving JSON
    //using the same method as saveFile since the work to do is the same, with different parameters
    request = $.ajax({
        type: "POST",
        url: "startPage.aspx/SaveFile",
        data: json,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            if (data !== null && data.d !== null) {
                var response;

                //we need to parse it to JSON 
                response = $.parseJSON(data.d);

                //getting agian the file list, in case the user chooses to save it to a new file
                GetFiles();

                //showing to the user if the operation was success full
                document.getElementById("statusMessage").innerHTML = response.status;

            }
        },
        fail: function () {
            document.getElementById("statusMessage").innerHTML = "Error!";
        }
    });
}