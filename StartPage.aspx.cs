/*  File            :   StarPage.aspx
    PROJECT :       PROG2001 - A-07 : JQUERY AND JSON BASED TEXT EDITOR
    PROGRAMMER :    Kushaldeep Singh, Yuvraj Singh
    FIRST VERSION : 12/08/2022
    DESCRIPTION :   the aspx file is to load the file contents that are sent from the server. and pass it to textbox area for editing
                    if the contents are changed prompt to save or neglect changes*/
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StartPage
{
   
    public partial class Default : System.Web.UI.Page
    {
        
        //	Name	:	Page_Load()
        //	Purpose :	Loads the page after reading code from the function
        //	Inputs	:	object sender, EventArgs e
        //	Outputs	:	NONE
        //	Returns	:   void
        protected void Page_Load(object sender, EventArgs e)
        {
            //page load code 
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            
        }

        //	Name	:	Submit_Click()
        //	Purpose :	validates the input provided by the user before submitting and creating
        //              pertinent session variables
        //	Inputs	:	object sender, EventArgs e
        //	Outputs	:	NONE
        //	Returns	:   void
        public void Submit_Click(object sender, EventArgs e)
        {
            //creating session variables for name, min, and max
            Session["name"] = userName.Value;     //creating a session variable for name
            string[] strings = userName.Value.Split(' ');
            Session["firstName"] = strings[0];
            Response.Redirect("page2.aspx");   //submitting the form to default2.aspx
        }

    }
}