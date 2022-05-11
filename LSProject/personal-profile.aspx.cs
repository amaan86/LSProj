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
    public partial class personal_profile : System.Web.UI.Page
    {
        public static int i;
        public string pass;

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
            profile.ImageUrl = Convert.ToString(dr[8]);
            fname.Text = Convert.ToString(dr[1]);
            enrollment.Text = Convert.ToString(dr[0]);
            email.Text = Convert.ToString(dr[2]);
            phone.Text = Convert.ToString(dr[3]);
            school.Text = Convert.ToString(dr[5]);
            department.Text = Convert.ToString(dr[6]);
            pass = Convert.ToString(dr[4]);
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

        protected void about_Click(object sender, EventArgs e)
        {
            Response.Redirect("about-us.aspx");
        }

        protected void books_Click(object sender, EventArgs e)
        {
            Response.Redirect("available-books.aspx");
        }

        protected void name_Click(object sender, EventArgs e)
        {
            ename.Visible = true;
            ename_submit.Visible = true;
        }

        protected void e_mail_Click(object sender, EventArgs e)
        {
            eemail.Visible = true;
            eemail_submit.Visible = true;
        }

        protected void p_hone_Click(object sender, EventArgs e)
        {
            ephone.Visible = true;
            ephone_submit.Visible = true;
        }

        protected void ename_submit_Click(object sender, EventArgs e)
        {
            int enroll = Convert.ToInt32(Session["EnrollmentID"].ToString());
            SqlCommand cm2 = conn.CreateCommand();
            cm2.CommandText = "UPDATE Userdetails SET FullName='" + ename.Text + "' WHERE EnrollmentID="+enroll;
            cm2.ExecuteNonQuery();
        }

        protected void eemail_submit_Click(object sender, EventArgs e)
        {
            int enroll = Convert.ToInt32(Session["EnrollmentID"].ToString());
            SqlCommand cm3 = conn.CreateCommand();
            cm3.CommandText = "UPDATE Userdetails SET Email='" + eemail.Text + "' WHERE EnrollmentID=" + enroll;
            cm3.ExecuteNonQuery();
        }

        protected void ephone_submit_Click(object sender, EventArgs e)
        {
            int enroll = Convert.ToInt32(Session["EnrollmentID"].ToString());
            SqlCommand cm4 = conn.CreateCommand();
            cm4.CommandText = "UPDATE Userdetails SET Mobile='" + ephone.Text + "' WHERE EnrollmentID=" + enroll;
            cm4.ExecuteNonQuery();
        }

        protected void pass_reset_Click(object sender, EventArgs e)
        {
            oldpass.Visible = true;
            new_pass.Visible = true;
            renew.Visible = true;
            newpass_submit.Visible = true;
        }

        protected void newpass_submit_Click(object sender, EventArgs e)
        {
            int enroll = Convert.ToInt32(Session["EnrollmentID"].ToString());
            if (oldpass.Text != pass)
            {
                Response.Write("<script>alert('Invalid Password.');</script>");
            }
            else
            {
                SqlCommand cm5 = conn.CreateCommand();
                cm5.CommandText = "UPDATE Userdetails SET Password='" + new_pass.Text + "' WHERE EnrollmentID=" + enroll;
                cm5.ExecuteNonQuery();
                Response.Write("<script>alert('Password updated successfully.');</script>");
            }
        }
    }
}