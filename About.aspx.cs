using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;
using System.Collections;
using System.IO;
using System.Text;


public partial class About : System.Web.UI.Page
{
    private SqlConnection koneksi;
    protected void Page_Load(object sender, EventArgs e)
    {
        displaycategory();
    }
    public void displaycategory()
    {
        string strConn = WebConfigurationManager.ConnectionStrings["berita"].ConnectionString;
        koneksi = new SqlConnection(strConn);
        //Building an HTML string.
        StringBuilder html = new StringBuilder();

        //Building the Data rows.

        html.Append("<ul>");

        koneksi.Open();
        string sql = "select * from Kategori order by ID_Kategori desc ";
        SqlCommand sqlcon = new SqlCommand(sql, koneksi);
        using (koneksi)
        {
            SqlDataReader dr = sqlcon.ExecuteReader();
            while (dr.Read())
            {
                html.Append("<li style='list-style:none;'><a href='NewsCatDetail.aspx?idcat=" + dr.GetString(0) + "'>" + dr.GetString(1) + "</a></li>");
            }
        }
        html.Append("</ul>");

        //Append the HTML string to Placeholder.
        DataCategory.Controls.Add(new Literal { Text = html.ToString() });
        koneksi.Close();
    }
    protected void search_TextChanged(object sender, EventArgs e)
    {
    }
}