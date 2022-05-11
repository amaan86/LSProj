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
    public partial class about_us : System.Web.UI.Page
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

        protected void books_Click(object sender, EventArgs e)
        {
            Response.Redirect("available-books.aspx");
        }

        protected void personal_Click(object sender, EventArgs e)
        {
            Response.Redirect("personal-profile.aspx");
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("Login.aspx");
        }
    }
}