using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text;
using System.IO;

public partial class AdminWeb_EditDeleteNews : System.Web.UI.Page
{
    private SqlConnection koneksi;
    private SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            displaynews();
            if (Session["Id"] == "1" && Session["Username"] != "")
            {
                User.Text += Session["Username"];
                txtidadmin.Text += Session["ID_Admin"];
                //koneksi.Open();
                //string sql = @"select Nama from Admin where ID_Admin = @id_admin";
                //SqlCommand cmd1 = new SqlCommand(sql, koneksi);
                //cmd1.Parameters.AddWithValue("@id_admin", txtidadmin.Text);
                //SqlDataReader dr = cmd1.ExecuteReader();
                //if (dr.Read())
                //{
                //    string id = dr.GetString(0);
                namaAdmin.Text += Session["Username"];
            }
            else
            {
                Session.RemoveAll();
                Response.Redirect("Login.aspx");
            }
            lbldatetime.Text = DateTime.Now.ToString("MM-dd-yyyy h:mmtt");
        }
        string iddelber = Request.QueryString["delete"];
        string idupber = Request.QueryString["edit"];
        StringBuilder html = new StringBuilder();
        //Building the Data rows.
        if (iddelber != null)
        {
            string strConn = WebConfigurationManager.ConnectionStrings["berita"].ConnectionString;
            koneksi = new SqlConnection(strConn);
            koneksi.Open();
            using (koneksi)
            {
                string sql = "DELETE FROM Berita WHERE ID_Berita = @ID";
                SqlCommand sqlcom = new SqlCommand(sql, koneksi);
                using (sqlcom)
                {
                    sqlcom.Parameters.Add(new SqlParameter("@ID", iddelber));
                    sqlcom.ExecuteNonQuery();
                    koneksi.Close();
                    Response.Redirect("EditDeleteNews.aspx");
                }
            }
        }
        if (idupber != null)
        {
            string strConn = WebConfigurationManager.ConnectionStrings["berita"].ConnectionString;
            koneksi = new SqlConnection(strConn);
            koneksi.Open();
            using (koneksi)
            {
                string sql = "select * FROM Berita WHERE ID_Berita = @id";
                SqlCommand sqlcom = new SqlCommand(sql, koneksi);
                sqlcom.Parameters.AddWithValue("@id", idupber);
                SqlDataReader dr = sqlcom.ExecuteReader();
                if(dr.Read())
                {
                    txtidberita.Text = dr.GetString(0);
                    txtjudul.Text = dr.GetString(3);
                    //katberita.Text = dr.GetString(1);
                    textareas.Text = dr.GetString(4);
                    txtsumber.Text = dr.GetString(5);
                    ////FileUploadControl.FileName = dr.GetString(7);
                }
            }
        }
        //else
        //{
        //    //Response.Redirect("EditDeleteNews.aspx");
        //}
    }
    protected void txtidberita_TextChanged(object sender, EventArgs e)
    {
        //BeritaID();
    }
    protected void simpanBer_Click(object sender, EventArgs e)
    {
        string idberita = txtidberita.Text;
        string judul = txtjudul.Text;
        string tanggal = lbldatetime.Text;
        string isi = textareas.Text;
        string sumber = txtsumber.Text;
        string idadmin = txtidadmin.Text;

        string strConn = WebConfigurationManager.ConnectionStrings["berita"].ConnectionString;
        koneksi = new SqlConnection(strConn);
        koneksi.Open();

        using (koneksi)
        {
            string sql = @"select ID_Kategori from Kategori where NamaKategori = @NamaKategori";
            SqlCommand cmd1 = new SqlCommand(sql, koneksi);
            cmd1.Parameters.AddWithValue("@NamaKategori", katberita.SelectedItem.Text);
            SqlDataReader dr = cmd1.ExecuteReader();
            if (dr.Read())
            {
                string id = dr.GetString(0);
                string idkatberita = id;
                koneksi.Close();

                string strConn1 = WebConfigurationManager.ConnectionStrings["berita"].ConnectionString;
                koneksi = new SqlConnection(strConn1);
                koneksi.Open();
                if (FileUploadControl.HasFile)
                {
                    string filename = Path.GetFileName(FileUploadControl.FileName);
                    FileUploadControl.SaveAs(Server.MapPath("../photoberita/") + filename);

                    string sql1 = "UPDATE Berita SET ID_Kategori = @kategori, Tanggal = @tanggal, Judul = @judul, IsiBerita = @isi, Sumber = @sumber, ID_Admin = @idadmin, Foto = @foto WHERE ID_Berita = @idberita";
                    SqlCommand sqlcom = new SqlCommand(sql1, koneksi);
                    using (sqlcom)
                    {
                        sqlcom.Parameters.Add(new SqlParameter("@idberita", idberita));
                        sqlcom.Parameters.Add(new SqlParameter("@kategori", idkatberita));
                        sqlcom.Parameters.Add(new SqlParameter("@tanggal", tanggal));
                        sqlcom.Parameters.Add(new SqlParameter("@judul", judul));
                        sqlcom.Parameters.Add(new SqlParameter("@isi", isi));
                        sqlcom.Parameters.Add(new SqlParameter("@sumber", sumber));
                        sqlcom.Parameters.Add(new SqlParameter("@idadmin", idadmin));
                        sqlcom.Parameters.Add(new SqlParameter("@foto", filename));
                        sqlcom.ExecuteNonQuery();
                        Response.Redirect("EditDeleteNews.aspx");
                    }
                    koneksi.Close();
                }
                else
                {
                    string sql1 = "UPDATE Berita SET ID_Kategori = @kategori, Tanggal = @tanggal, Judul = @judul, IsiBerita = @isi, Sumber = @sumber, ID_Admin = @idadmin WHERE ID_Berita = @idberita";
                    SqlCommand sqlcom = new SqlCommand(sql1, koneksi);
                    using (sqlcom)
                    {
                        sqlcom.Parameters.Add(new SqlParameter("@idberita", idberita));
                        sqlcom.Parameters.Add(new SqlParameter("@kategori", idkatberita));
                        sqlcom.Parameters.Add(new SqlParameter("@tanggal", tanggal));
                        sqlcom.Parameters.Add(new SqlParameter("@judul", judul));
                        sqlcom.Parameters.Add(new SqlParameter("@isi", isi));
                        sqlcom.Parameters.Add(new SqlParameter("@sumber", sumber));
                        sqlcom.Parameters.Add(new SqlParameter("@idadmin", idadmin));
                        sqlcom.ExecuteNonQuery();
                        Response.Redirect("EditDeleteNews.aspx");
                    }
                    koneksi.Close();
                }
            }
        }
    }
    protected void Reset_Click(object sender, EventArgs e)
    {
        Response.Redirect("EditDeleteNews.aspx");
    }
    public void displaynews()
    {

        //Building an HTML string.
        StringBuilder html = new StringBuilder();

        //Table start.
        html.Append("<table class='table table-bordered'>");

        html.Append("<tr>");
        html.Append("<th>ID News</th>");
        html.Append("<th>News Title</th>");
        html.Append("<th>Photo</th>");
        html.Append("<th>Category News</th>");
        html.Append("<th>Action</th>");
        html.Append("<th>Action</th>");
        html.Append("</tr>");


        //Building the Data rows.

        string strConn = WebConfigurationManager.ConnectionStrings["berita"].ConnectionString;
        koneksi = new SqlConnection(strConn);
        koneksi.Open();
        string sql = "select b.ID_Berita, b.Judul, c.NamaKategori, b.Foto from Berita b join Kategori c on b.ID_Kategori = c.ID_Kategori order by ID_Berita desc";
        SqlCommand sqlcon = new SqlCommand(sql, koneksi);
        using (koneksi)
        {
            SqlDataReader dr = sqlcon.ExecuteReader();
            while (dr.Read())
            {
                html.Append("<tr>");
                html.Append("<td>" + dr.GetString(0) + "</td>");
                html.Append("<td>" + dr.GetString(1) + "</td>");
                html.Append("<td><img src='../photoberita/" + dr.GetString(3) + "' width='40px' height='30px'></td>");
                html.Append("<td>" + dr.GetString(2) + "</td>");
                html.Append("<td><a href='EditDeleteNews.aspx?edit=" + dr.GetString(0) + "'><span class='glyphicon glyphicon-pencil' aria-hidden='true'></span></a></td>");
                html.Append("<td><a href='EditDeleteNews.aspx?delete=" + dr.GetString(0) + "'><span class='glyphicon glyphicon-trash' aria-hidden='true'></span></a></td>");
                html.Append("</tr>");
            }
        }


        //Table end.
        html.Append("</table>");

        //Append the HTML string to Placeholder.
        DataNews.Controls.Add(new Literal { Text = html.ToString() });
        koneksi.Close();
    }
    protected void Delete(object sender, EventArgs e)
    {
        LinkButton lnkRemove = (LinkButton)sender;

        crud hapus = new crud();
        hapus.DeleteAdmin(lnkRemove.CommandArgument);

        Response.Write("<script>alert('Data Berhasil Dihapus');</script>");
        Response.Redirect("EditDeleteAdmin.aspx");
    }
}