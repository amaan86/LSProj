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
    public partial class Dashboard : System.Web.UI.MasterPage
    {
        public static int i;
        protected void Page_Load(object sender, EventArgs e)
        {
            int enroll = Convert.ToInt32(Session["EnrollmentID"].ToString());
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString);
            conn.Open();
            SqlCommand cm = conn.CreateCommand();
            cm.CommandText  = "SELECT * FROM Userdetails WHERE EnrollmentID=@enroll";
            cm.Parameters.AddWithValue("@enroll", enroll);
            SqlDataAdapter da = new SqlDataAdapter(cm);
            DataTable dt = new DataTable();
            da.Fill(dt);
            DataRow dr;
            i = 0;
            dr = dt.Rows[i];
            username.Text = Convert.ToString(dr[1]);
            Image1.ImageUrl = Convert.ToString(dr[8]);
            SqlCommand cm2 = conn.CreateCommand();
            cm2.CommandText = "SELECT * FROM E" + enroll;
            SqlDataAdapter da2 = new SqlDataAdapter(cm2);
            DataTable dt2 = new DataTable();
            da2.Fill(dt2);
            GridView1.DataSource = dt2;
            GridView1.DataBind();
            SqlCommand cm3 = conn.CreateCommand();
            cm3.CommandText = "SELECT SUM(LateFees) Total FROM E" + enroll;
            SqlDataAdapter da3 = new SqlDataAdapter(cm3);
            DataTable dt3 = new DataTable();
            da3.Fill(dt3);
            DataRow dr3;
            int f = 0;
            dr3 = dt3.Rows[f];
            fees.Text = Convert.ToString(dr3[0]);
            SqlCommand cm4 = conn.CreateCommand();
            cm4.CommandText = "SELECT COUNT(*) FROM E"+enroll+" WHERE ReturnDate >= GETDATE()";
            SqlDataAdapter da4 = new SqlDataAdapter(cm4);
            DataTable dt4 = new DataTable();
            da4.Fill(dt4);
            DataRow dr4;
            int g = 0;
            dr4 = dt4.Rows[g];
            current.Text = Convert.ToString(dr4[0]);
            SqlCommand cm5 = conn.CreateCommand();
            cm5.CommandText = "SELECT COUNT(*) Total FROM E" + enroll;
            SqlDataAdapter da5 = new SqlDataAdapter(cm5);
            DataTable dt5 = new DataTable();
            da5.Fill(dt5);
            DataRow dr5;
            int H = 0;
            dr5 = dt5.Rows[H];
            total.Text = Convert.ToString(dr5[0]);
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("Login.aspx");
        }

        protected void books_Click(object sender, EventArgs e)
        {
            Response.Redirect("available-books.aspx");
        }

        protected void about_Click(object sender, EventArgs e)
        {
            Response.Redirect("about-us.aspx");
        }

        protected void personal_Click(object sender, EventArgs e)
        {
            Response.Redirect("personal-profile.aspx");
        }
    }
}