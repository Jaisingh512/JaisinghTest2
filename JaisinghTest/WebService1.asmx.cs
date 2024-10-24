using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace JaisinghTest
{
    /// <summary>
    /// Summary description for WebService1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class WebService1 : System.Web.Services.WebService
    {

        [WebMethod]
        public List<custombercls> getcuslist()
        {
            Mockcustomber ob = new Mockcustomber();
            return ob.getlistofcustom();
        }


        [WebMethod]
        public bool getcustomberdata(custombercls obj)
        {

            Mockcustomber ob = new Mockcustomber();
           return ob.savecustomberdata(obj);



           
        }

        [WebMethod]
        public custombercls editcustomber(string id)
        {

            Mockcustomber ob = new Mockcustomber();
            return ob.getdataforedit(id);



        }
        [WebMethod]
        public bool updatecustom(custombercls obj)
        {

            Mockcustomber ob = new Mockcustomber();
            return ob.updatecustom(obj);



        }


        [WebMethod]
        public bool deletecustom(string id)
        {

            Mockcustomber ob = new Mockcustomber();
            return ob.deletecustomer(id);



        }
    }
}
