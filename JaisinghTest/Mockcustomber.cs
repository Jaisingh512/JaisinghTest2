using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace JaisinghTest
{
    public class Mockcustomber
    {
        
        public bool savecustomberdata(custombercls obj)
        {


            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mytest"].ToString());
            bool issaved = false;

           
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "insert into Customerinfo values('" + obj.name.Trim() + "','"
                + obj.phone + "','" + obj.email + "')";
            cmd.Connection = conn;
          int intx=   cmd.ExecuteNonQuery();

            conn.Close();

            if (intx > 0)
            {
                issaved = true;
            }else
            {
                issaved = false;
            }
            

            return issaved;

        }


        public bool updatecustom(custombercls obj)
        {

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mytest"].ToString());
            bool isupdated = false;

          
            conn.Open();
            SqlCommand cmd = new SqlCommand();
    
            cmd.CommandText = "update Customerinfo set name='"+ obj.name.Trim() +"', phone ='"+ obj.phone.Trim()
                +"', email='"+ obj.email.Trim() +"' where id='"+  obj.id.Trim() +"' ";
            cmd.Connection = conn;
            int intx = cmd.ExecuteNonQuery();

            conn.Close();

            if (intx > 0)
            {
                isupdated = true;
            }
            else
            {
                isupdated = false;
            }


            return isupdated;

        }


        public bool deletecustomer(string id)
        {

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mytest"].ToString());
            bool isdeleted = false;

           
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "delete from Customerinfo where id='"+ id.Trim() +"'";
         
            cmd.Connection = conn;
            int intx = cmd.ExecuteNonQuery();

            conn.Close();

            if (intx > 0)
            {
                isdeleted = true;
            }
            else
            {
                isdeleted = false;
            }


            return isdeleted;




        }



        public List<custombercls> getlistofcustom()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mytest"].ToString());


          
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select * from Customerinfo";
            cmd.Connection = conn;
            SqlDataAdapter das = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            das.Fill(ds, "Customerinfo");
            DataTable dt = new DataTable();
            dt = ds.Tables["Customerinfo"];


            List<custombercls> arrlist = new List<custombercls>();

            foreach (DataRow dr in dt.Rows)
            {
                custombercls objj = new custombercls();
                objj.name = dr["name"].ToString();
                objj.phone = dr["phone"].ToString();
                objj.email = dr["email"].ToString();
                objj.id = dr["id"].ToString();



                arrlist.Add(objj);




            }



            return arrlist;


        }
        public custombercls getdataforedit(string id)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mytest"].ToString());


          
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select * from Customerinfo where id='"+ id.Trim() +"'";
            cmd.Connection = conn;
            SqlDataAdapter das = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            das.Fill(ds, "Customerinfo");
            DataTable dt = new DataTable();
            dt = ds.Tables["Customerinfo"];



            custombercls objj = new custombercls();
            if(dt.Rows.Count > 0)
            {

              objj.name=     dt.Rows[0]["name"].ToString();
                objj.email = dt.Rows[0]["email"].ToString();
                objj.phone = dt.Rows[0]["phone"].ToString();
                objj.id = dt.Rows[0]["id"].ToString();

            }
         



            return objj;



        }
    }
}