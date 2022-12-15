/*  File        :   page2.aspx
    PROJECT :       PROG2001 - final practical part
    PROGRAMMER :    Kushaldeep Singh, Yuvraj Singh
    FIRST VERSION : 12/14/2022
    DESCRIPTION :   the aspx file is to load the page content for user experience for ordering pizza*/
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SET_Pizza_Shop
{
    public partial class page2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // code when page loads
        }



        [WebMethod]
        //#pragma warning disable CS0108 // Member hides inherited member; missing new keyword
        public static string calculateSUM(string toppings)
        //#pragma warning restore CS0108 // Member hides inherited member; missing new keyword
        {
            string returnData = "";
            const int basePrice = 10;
            double totalCost = basePrice;
            string[] toppingSelected = toppings.Split(' ');

            //the following lines of code adds into the total codt that user oes based on number of toppings.
            try
            {
                foreach (string topping in toppingSelected)
                {
                    if (topping == "1")
                    {
                        totalCost += 1;
                    }
                    else if (topping == "2")
                    {
                        totalCost += 1.5;
                    }
                    else if (topping == "3")
                    {
                        totalCost += 2.25;
                    }
                } 

            }
            catch (Exception e)
            {
                returnData = e.Message;
            }
            
            returnData = JsonConvert.SerializeObject(new { price = "totalCost", value = totalCost.ToString()
        });
            return returnData;
        }

        //	Name	:	Submit_Click()
        //	Purpose :	validates the input provided by the user before submitting and creating
        //              pertinent session variables
        //	Inputs	:	object sender, EventArgs e
        //	Outputs	:	NONE
        //	Returns	:   void
        public void Submit_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("page3.aspx");   //submitting the form to page3.aspx
        }

    }
}