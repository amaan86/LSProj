using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LSProject
{
    public partial class add_books : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            pubdate.Text = Calendar1.SelectedDate.ToLongDateString();
        }

        protected void add_book_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string str = FileUpload1.FileName;
                FileUpload1.PostedFile.SaveAs(Server.MapPath("~/images/" + str));
                string location = "~/images/" + str.ToString();
                string bookName = bookname.Text;
                string author = authorname.Text;
                string published = pubdate.Text;
                string status = "";
                if (available.Checked)
                {
                    status = available.Text;
                }
                else if(notavail.Checked)
                {
                    status = notavail.Text;
                }
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString);
                conn.Open();
                SqlCommand cm = conn.CreateCommand();
                cm.CommandText = "INSERT INTO Books(BookName, AuthorName, Published, CurrentStatus, Book) " +
                    "VALUES" +
                    "('"+bookName+"','"+author+"','"+published+"','"+status+"','"+location+"');";
                int i = cm.ExecuteNonQuery();
                if(i != 0)
                {
                    Response.Write("<script>alert('Book Added Successfully');" +
                        "window.location.replace('Admin-Dash.aspx');</script>");
                }
                else
                {
                    Response.Write("<script>alert('Error adding books');</script>");
                }
            }
        }
    }
}
