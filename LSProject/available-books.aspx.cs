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
    public partial class available_books : System.Web.UI.Page
    {
        public static int i;
        protected void Page_Load(object sender, EventArgs e)
        {
            int enroll = Convert.ToInt32(Session["EnrollmentID"].ToString());
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString);
            conn.Open();
            SqlCommand cm = conn.CreateCommand();
            cm.CommandText = "SELECT * FROM Userdetails WHERE EnrollmentID=@enroll";
            cm.Parameters.AddWithValue("@enroll", enroll);
            SqlDataAdapter da = new SqlDataAdapter(cm);
            DataTable dt = new DataTable();
            da.Fill(dt);
            conn.Close();
            DataRow dr;
            i = 0;
            dr = dt.Rows[i];
            username.Text = Convert.ToString(dr[1]);
            Image1.ImageUrl = Convert.ToString(dr[8]);
        }

        protected void home_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("Login.aspx");
        }

        protected void searchbutton_Click(object sender, EventArgs e)
        {
            string book = search.Text;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString);
            conn.Open();
            SqlCommand cm1 = conn.CreateCommand();
            cm1.CommandText = "SELECT * FROM Books WHERE BookName LIKE '%'+@book+'%'";
            cm1.Parameters.AddWithValue("@book", book);
            SqlDataAdapter ds1 = new SqlDataAdapter(cm1);
            DataTable dt1 = new DataTable();
            ds1.Fill(dt1);
            GridView1.DataSource = dt1;
            GridView1.DataBind();
            conn.Close();
        }

        protected void available_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString);
            conn.Open();
            SqlCommand cm2 = conn.CreateCommand();
            cm2.CommandText = "SELECT * FROM Books WHERE CurrentStatus='Available'";
            SqlDataAdapter ds2 = new SqlDataAdapter(cm2);
            DataTable dt2 = new DataTable();
            ds2.Fill(dt2);
            GridView1.DataSource = dt2;
            GridView1.DataBind();
            conn.Close();
        }

        protected void personal_Click(object sender, EventArgs e)
        {
            Response.Redirect("personal-profile.aspx");
        }

        protected void about_Click(object sender, EventArgs e)
        {
            Response.Redirect("about-us.aspx");
        }
    }
}