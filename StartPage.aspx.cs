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
        protected void Submit_Click(object sender, EventArgs e)
        {   
           
        }

        [WebMethod]
        //#pragma warning disable CS0108 // Member hides inherited member; missing new keyword
        public static new string OpenFile(string fileToLoad)
        //#pragma warning restore CS0108 // Member hides inherited member; missing new keyword
        {
            string returnData;  // final JSON return value
            string fileStatus;
            string fileContents;
            string filepath;

            try
            {
                filepath = HttpContext.Current.Server.MapPath("MyFiles");
                filepath = filepath + @"\" + fileToLoad;


                if (File.Exists(filepath))
                {
                    fileStatus = "Success";
                    fileContents = File.ReadAllText(filepath);
                }
                else
                {
                    fileStatus = "Failure";
                    fileContents = "File doesn't exist";
                }
            }
            catch (Exception e)
            {
                // I need to return something in the JSON value to indicate the exception/hold some
                // useful information for the user ...
                fileStatus = "Exception";
                fileContents = "Exception : " + e.ToString();
            }

            returnData = JsonConvert.SerializeObject(new { status = fileStatus, description = fileContents });
            return returnData;
        }


        [WebMethod]
        //#pragma warning disable CS0108 // Member hides inherited member; missing new keyword
        public static string GetFiles(string fileToLoad)
        //#pragma warning restore CS0108 // Member hides inherited member; missing new keyword
        {
            string returnData = "";  // final JSON return value
            string fileStatus = "";
            string fileContents = "";
            string filepath = "";
            string[] fileEntries = {""};
            try
            {
                filepath = HttpContext.Current.Server.MapPath(fileToLoad);
                

                if (filepath != null)
                {
                    fileEntries = Directory.GetFiles(filepath);
                    if (fileEntries != null)
                    {
                        for (int i = 0; i < fileEntries.Length; i++)
                        {
                            fileEntries[i] = Path.GetFileName(fileEntries[i]);
                        }
                        fileStatus = "Success";
                        
                    }
                    else
                    {
                        fileContents = "File error";
                    }
                }
                else
                {
                    fileStatus = "Failure";
                    fileContents = "File doesn't exist";
                }
            }
            catch (Exception e)
            {
                // I need to return something in the JSON value to indicate the exception/hold some
                // useful information for the user ...
                fileStatus = "Exception";
                fileContents = "Something bad happened : " + e.ToString();
            }

            returnData = JsonConvert.SerializeObject(new { status = fileStatus, fileNames = fileEntries });
            return returnData;
        }


        [WebMethod]
        //#pragma warning disable CS0108 // Member hides inherited member; missing new keyword
        public static string SaveFile(string filename, string content)
        //#pragma warning restore CS0108 // Member hides inherited member; missing new keyword
        {
            string returnData = "";  // final JSON return value
            string fileStatus = "";
            string filepath = "";

            try
            {
                filepath = HttpContext.Current.Server.MapPath("MyFiles");
                filepath = filepath + @"\" + filename;
                File.WriteAllText(filepath, content);
                fileStatus = "File Successfully Saved";
                
            }
            catch (Exception e)
            {
                // I need to return something in the JSON value to indicate the exception/hold some
                // useful information for the user ...
                fileStatus = "Exception";
                content = "Exception : " + e.ToString();
            }

            returnData = JsonConvert.SerializeObject(new { status = fileStatus, description = content });
            
            return returnData;
        }
    }
}