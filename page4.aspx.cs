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

namespace page4
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

    }
}