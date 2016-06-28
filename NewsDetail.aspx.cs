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


public partial class NewsDetail : System.Web.UI.Page
{
    private SqlConnection koneksi;
    protected void Page_Load(object sender, EventArgs e)
    {
        displaycategory(); 
        string strConn = WebConfigurationManager.ConnectionStrings["berita"].ConnectionString;

        koneksi = new SqlConnection(strConn);
        //Building an HTML string.

        string idberita = Request.QueryString["idber"];
        StringBuilder html = new StringBuilder();
        //Building the Data rows.
        if (idberita != null)
        {
            koneksi.Open();
            using (koneksi)
            {
                string sql = "select b.ID_Berita, c.NamaKategori, b.Tanggal, b.Judul, b.IsiBerita, b.Sumber, a.Nama, b.Foto from Berita b JOIN Kategori c on b.ID_Kategori = c.ID_Kategori JOIN Admin a on b.ID_Admin = a.ID_Admin where ID_Berita = @id";
                SqlCommand sqlcom = new SqlCommand(sql, koneksi);
                using (sqlcom)
                {
                    sqlcom.Parameters.AddWithValue("@id", idberita);
                    SqlDataReader dr = sqlcom.ExecuteReader();
                    if (dr.Read())
                    {
                        html.Append("<div>");
                        html.Append("<h1 styl='margin-left:20px;'>" + dr.GetString(3) + "</h1><br>");
                        html.Append("<img src='photoberita/" + dr.GetString(7) + "' width='100%' height='350px' />");
                        html.Append("<p><i>Publisher : " + dr.GetString(6) + " / News category : " + dr.GetString(1) + " / Date :" + dr.GetString(2) + "</i></p><br>");
                        html.Append("<p>" + dr.GetString(4) + "</p><br>");
                        html.Append("<p>Source : <a href='" + dr.GetString(5) + "' target='_blank'>" + dr.GetString(5) + "</a></p>");
                        html.Append("</div>");
                    }
                    else 
                    {
                        html.Append("<h1 style='margin-left:40%; margin-top:30%;'>Data Not Found!</h1>");
                    }
                }
            }
        }
        else
        {
            Response.Redirect("News.aspx");
        }

            //Append the HTML string to Placeholder.
        DataDetais.Controls.Add(new Literal { Text = html.ToString() });
        //Building an HTML string.

        //Building the Data rows.

        html.Append("<ul>");
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
        Response.Redirect("Search.aspx?judul="+search.Text);
    }
}