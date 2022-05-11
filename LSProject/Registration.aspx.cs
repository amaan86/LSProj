using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace LSProject
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void reg_Click(object sender, EventArgs e)
        {
            try
            {
                if (image.HasFile)
                {
                    string str = image.FileName;
                    image.PostedFile.SaveAs(Server.MapPath("~/images/" + str));
                    string location = "~/images/" + str.ToString();

                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString);
                    conn.Open();
                    String sql = "INSERT INTO Userdetails VALUES (" + enroll.Text + ",'" + fullname.Text + "','" + email.Text + "','" + mobile.Text + "','" + password.Text + "','" + school.Text + "','" + department.Text + "','" + image.FileName + "','" + location + "');";
                    SqlCommand cm = new SqlCommand(sql, conn);
                    SqlCommand cm2 = conn.CreateCommand();
                    cm2.CommandText = "CREATE TABLE E" + enroll.Text + "(" +
                        "BID INT NOT NULL," +
                        "BookName VARCHAR(MAX) NOT NULL," +
                        "IssueDate DATE NOT NULL," +
                        "ReturnDate DATE NOT NULL," +
                        "LateFees INT NOT NULL," +
                        "Book VARCHAR(MAX) NOT NULL);";
                    cm.ExecuteNonQuery();
                    cm2.ExecuteNonQuery();
                    conn.Close();
                    
                    
                    Response.Redirect("Login.aspx");
                    
                }
            }
            catch (Exception ex)
            {
                Response.Write("Error:" + ex.ToString());
            }
        }
    }
}