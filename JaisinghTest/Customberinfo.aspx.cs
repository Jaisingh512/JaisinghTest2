using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace JaisinghTest
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {



        }
     


        //public void showdata()
        //{
        //    SqlConnection conn = new SqlConnection();


        //    conn.ConnectionString = "Data Source=DESKTOP-FQP0VF0\\SQLEXPRESS; initial catalog = Demo; Integrated Security = True; Connect Timeout = 30; Encrypt = False; TrustServerCertificate = False; ApplicationIntent = ReadWrite; MultiSubnetFailover = False";
        //    conn.Open();
        //    SqlCommand cmd = new SqlCommand();
        //    cmd.CommandText = "select * from Customerinfo";
        //    cmd.Connection = conn;
        //    SqlDataAdapter das = new SqlDataAdapter(cmd);
        //    DataSet ds = new DataSet();
        //    das.Fill(ds, "Customerinfo");
        //    DataTable dt = new DataTable();
        //    dt = ds.Tables["Customerinfo"];
        //    //DataTable dtt = new DataTable();
        //    //dtt.Columns.Add("name", typeof(string));
        //    //dtt.Columns.Add("address", typeof(string));
        //    //dtt.Columns.Add("email", typeof(string));
        //    //dtt.Columns.Add("mobile", typeof(string));
        //    //dtt.Columns.Add("delete");


        //    foreach (DataRow dr in dt.Rows)

        //    {
        //        TableRow tr = new TableRow();
        //        TableCell tt = new TableCell();
        //        tt.Text = dr["name"].ToString();
        //        tr.Cells.Add(tt);

        //        TableCell tt1 = new TableCell();
        //        tt1.Text = dr["phone"].ToString();
        //        tr.Cells.Add(tt1);
        //        TableCell tt2 = new TableCell();
        //        tt2.Text = dr["email"].ToString();
        //        tr.Cells.Add(tt2);

         

        //        TableCell tt4 = new TableCell();
        //        Button bt = new Button();
        //        bt.Text = "Edit";
        //        bt.OnClientClick = "val(this); return false";
        //        bt.PostBackUrl = "";
        //        bt.ID = dr["id"].ToString();



              
        //        Button bt2 = new Button();
        //        bt2.Text = "Delete";
        //        bt2.OnClientClick = "val(this); return false";
        //        bt2.PostBackUrl = "";
        //        bt2.ID = dr["id"].ToString();


        //        tt4.Controls.Add(bt2);
               




        //        tt4.Controls.Add(bt);
        //        tr.Cells.Add(tt4);





        //        Table1.Rows.Add(tr);


        //        //DataRow drr = dtt.NewRow();
        //        //drr["name"] = dr["name"].ToString();
        //        //drr["address"] = dr["address"].ToString();
        //        //drr["email"] = dr["email"].ToString();
        //        //drr["mobile"] = dr["mobile"].ToString();
        //        //drr["delete"] = "<span></span>";
        //        //dtt.Rows.Add(drr);







        //    }











        //    //gridview1.DataSource = dtt;
        //    //gridview1.DataBind();










        //}
    }
}