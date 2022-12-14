using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SET_Pizza_Shop
{
    public partial class page2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        [WebMethod]
        //#pragma warning disable CS0108 // Member hides inherited member; missing new keyword
        public static new string calculateSUM(string fileToLoad)
        //#pragma warning restore CS0108 // Member hides inherited member; missing new keyword
        {
            string returnData = "";
            
            try
            {
             

            }
            catch (Exception e)
            {
           
            }

            returnData = JsonConvert.SerializeObject(new { status = "", description = "" });
            return returnData;
        }

    }
}