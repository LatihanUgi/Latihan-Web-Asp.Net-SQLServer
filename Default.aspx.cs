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

public partial class _Default : System.Web.UI.Page
{
    private SqlConnection koneksi;
    //private SqlConnection koneksi1;
    protected void Page_Load(object sender, EventArgs e)
    {
        //koneksi1 = new SqlConnection(strConn);
        displaynews();
        displaycategory();

    }
    public void displaynews()
    {
        string strConn = WebConfigurationManager.ConnectionStrings["berita"].ConnectionString;
        koneksi = new SqlConnection(strConn);
        //Building an HTML string.
        StringBuilder html = new StringBuilder();
        //Building the Data rows.
        koneksi.Open();
        string sql = "select top 4 b.ID_Berita, c.NamaKategori, b.Tanggal, b.Judul, b.IsiBerita, b.Sumber, a.Nama, b.Foto from Berita b JOIN Kategori c on b.ID_Kategori = c.ID_Kategori JOIN Admin a on b.ID_Admin = a.ID_Admin order by b.ID_Berita desc";
        SqlCommand sqlcon = new SqlCommand(sql, koneksi);
        using (koneksi)
        {
            SqlDataReader dr = sqlcon.ExecuteReader();
            while (dr.Read())
            {
                html.Append("<article>"); 
html.Append("<img src='photoberita/" + dr.GetString(7) + "' />"); 
html.Append("<div class='article-title'>" + dr.GetString(3) + "</div>");
html.Append("<div class='article-info'><i> Publisher : " + dr.GetString(6) + " / Date :" + dr.GetString(2) + "</i></div>");
html.Append("<div class='article-info'> News category : " + dr.GetString(1) + "</div>");
html.Append("<a class='readmore' href='NewsDetail.aspx?idber=" + dr.GetString(0) + "'>Selengkapnya</a>");
html.Append("</article>");
            }
        }

        //Append the HTML string to Placeholder.
        //Building an HTML string.

        //Building the Data rows.

        html.Append("<ul>");
        DataNews.Controls.Add(new Literal { Text = html.ToString() });
        koneksi.Close();
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
        Response.Redirect("Search.aspx?judul=" + search.Text);
    }
}