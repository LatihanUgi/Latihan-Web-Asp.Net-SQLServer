using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;
using System.Text;

public partial class AdminWeb_EditDeleteNewsCategory : System.Web.UI.Page
{
    private SqlConnection koneksi;
    private SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        string strConn = WebConfigurationManager.ConnectionStrings["berita"].ConnectionString;
        koneksi = new SqlConnection(strConn);
        if (!Page.IsPostBack)
        {
            fillgvKat();
            if (Session["Id"] == "1" && Session["Username"] != "")
            {
                User.Text += Session["Username"];
            }
            else
            {
                Session.RemoveAll();
                Response.Redirect("Login.aspx");
            }
        }

        //if (!IsPostBack)
        //{
        //    Response.Cache.SetCacheability(HttpCacheability.NoCache);
        //    Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
        //    Response.Cache.SetNoStore();
        //}

        Response.Cache.SetNoStore();
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
    }

    private DataTable getDataKat(int idkat)
    {
        try
        {
            koneksi.Open();
            SqlCommand command = new SqlCommand();
            command.Connection = koneksi;
            if (idkat == 0)
            {
                command.CommandText = "select * from Kategori";
            }
            else
            {
                command.CommandText = "select * from Kategori where ID_Kategori = @ID_Kategori";
                command.Parameters.AddWithValue("@ID_Kategori", idkat);
            }
            SqlDataReader reader = null;
            reader = command.ExecuteReader();

            DataTable dt = new DataTable();
            dt.Load(reader);
            koneksi.Close();
            return dt;
        }
        catch (Exception ex)
        {
            throw (ex);
        }
    }
    private void fillgvKat()
    {
        try
        {
            //pertama-tama kita ambil data dari database dulu ya, terus ditampilkan ke grid view
            DataTable dt = this.getDataKat(0);

            //menampilkan ke gridview
            gvDetail.DataSource = dt;
            gvDetail.DataBind();
        }
        catch (Exception ex)
        {
            txtError.Text = ex.Message;
        }
    }
    protected void simpanKat_Click(object sender, EventArgs e)
    {
        try
        {
            crud updt = new crud();
            updt.ubah(txtid.Text, txtKat.Text);
            Response.Write("<script>alert('Data Berhasil Diperbaharui');</script>");
            Response.Redirect("EditDeleteNewsCategory.aspx");
            fillgvKat();
        }
        catch (Exception ex)
        {
            txtError.Text = ex.Message;
        }
    }
    protected void gvDetail_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtid.Text = (gvDetail.SelectedRow.FindControl("lblID") as Label).Text;
        txtKat.Text = (gvDetail.SelectedRow.FindControl("lblNamaKat") as Label).Text;
    }
    protected void Delete(object sender, EventArgs e)
    {
        LinkButton lnkRemove = (LinkButton)sender;

        crud hapus = new crud();
        hapus.Delete(lnkRemove.CommandArgument);

        Response.Write("<script>alert('Data Berhasil Dihapus');</script>");
        Response.Redirect("EditDeleteNewsCategory.aspx");
    }
    protected void Reset_Click(object sender, EventArgs e)
    {
        txtid.Text = "";
        txtKat.Text = "";
        Response.Redirect("EditDeleteNewsCategory.aspx");
    }
}