/*  File        :   page3.aspx
    PROJECT :       PROG2001 - final practical part
    PROGRAMMER :    Kushaldeep Singh, Yuvraj Singh
    FIRST VERSION : 12/14/2022
    DESCRIPTION :   the aspx file is to load the page content for user experience for ordering pizza*/
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

namespace page3
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
           
        }


        //	Name	:	Submit_Click()
        //	Purpose :	validates the input provided by the user before submitting and creating
        //              pertinent session variables
        //	Inputs	:	object sender, EventArgs e
        //	Outputs	:	NONE
        //	Returns	:   void
        public void Submit_Click(object sender, EventArgs e)
        {
            Session["order"] = "Confirmed";
            Response.Redirect("page4.aspx");   //submitting the form to page 4.aspx
        }

        //	Name	:	Cancel_Click()
        //	Purpose :	validates the input provided by the user before submitting and creating
        //              pertinent session variables
        //	Inputs	:	object sender, EventArgs e
        //	Outputs	:	NONE
        //	Returns	:   void
        public void Cancel_Click(object sender, EventArgs e)
        {
            Session["order"] = "Cancelled";
            Response.Redirect("page4.aspx");   //submitting the form to page 4.aspx
        }
    }
}