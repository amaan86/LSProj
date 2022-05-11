using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace LSProject
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submit_Click(object sender, EventArgs e)
        {
            try
            {
                int enroll = Convert.ToInt32(enrollment.Text);
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString);
                conn.Open();

                SqlCommand cm = conn.CreateCommand();
                cm.CommandText = "SELECT * FROM Userdetails WHERE EnrollmentID=@enroll AND Password=@pass";
                cm.Parameters.AddWithValue("@enroll", enroll);
                cm.Parameters.AddWithValue("@pass", password.Text);
                SqlDataAdapter da = new SqlDataAdapter(cm);
                DataTable dt = new DataTable();
                da.Fill(dt);
                int i = cm.ExecuteNonQuery();
                if (i == 0)
                {
                    enrollErr.Visible = true;
                }
                else
                {
                    if (dt.Rows.Count > 0)
                    {
                        Session["EnrollmentID"] = enroll;
                        if(enroll == 10000000)
                        {
                            Response.Redirect("Admin-Dash.aspx");
                        }
                        else
                        {
                            Response.Redirect("Dashboard.aspx");
                        }
                        Session.RemoveAll();
                    }
                    else
                    {
                        passErr.Visible = true;
                    }
                }
                conn.Close();
            }
            catch(Exception ex)
            {
                Response.Write("Error:"+ ex.ToString());
            }
        }
    }
}