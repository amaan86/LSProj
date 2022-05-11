using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LSProject
{
    public partial class Admin_Dash : System.Web.UI.Page
    {
        public static int i;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            int enroll = Convert.ToInt32(Session["EnrollmentID"].ToString());
            conn.Open();
            SqlCommand cm = conn.CreateCommand();
            cm.CommandText = "SELECT * FROM Userdetails WHERE EnrollmentID=@enroll";
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
            cm2.CommandText = "SELECT * FROM Books";
            SqlDataAdapter da2 = new SqlDataAdapter(cm2);
            DataTable dt2 = new DataTable();
            da2.Fill(dt2);
            GridView1.DataSource = dt2;
            GridView1.DataBind();
        }
        protected void about_Click(object sender, EventArgs e)
        {
            Response.Redirect("about-us.aspx");
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
        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string item = e.Row.Cells[0].Text;
                foreach (Button button in e.Row.Cells[6].Controls.OfType<Button>())
                {
                    if (button.CommandName == "Delete")
                    {
                        button.Attributes["onclick"] = "if(!confirm('Do you want to delete " + item + "?')){ return false; };";
                    }
                }
            }
        }
        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = Convert.ToInt32(e.RowIndex);
            SqlCommand cm2 = conn.CreateCommand();
            cm2.CommandText = "SELECT * FROM Books";
            SqlDataAdapter da2 = new SqlDataAdapter(cm2);
            DataTable dt2 = new DataTable();
            da2.Fill(dt2);
            dt2.Rows[index].Delete();
            GridView1.DataSource = dt2;
            GridView1.DataBind();
        }

        protected void add_book_Click(object sender, EventArgs e)
        {
            Response.Redirect("add-books.aspx");
        }
    }
}