using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class AdminWeb_EditDeleteAdmin : System.Web.UI.Page
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
        fillgvKat();
    }
    protected void Logout_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("Login.aspx");
    }
    private DataTable getDataKat(int idadm)
    {
        try
        {
            koneksi.Open();
            SqlCommand command = new SqlCommand();
            command.Connection = koneksi;
            if (idadm == 0)
            {
                command.CommandText = "select * from Admin";
            }
            else
            {
                command.CommandText = "select * from Admin where ID_Admin = @ID_Admin";
                command.Parameters.AddWithValue("@ID_Admin", idadm);
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
            updt.ubahAdmin(txtidadmin.Text, txtnama.Text, txtuser.Text, txtpwd.Text);
            Response.Write("<script>alert('Data Berhasil Diperbaharui');</script>");
            Response.Redirect("EditDeleteAdmin.aspx");
            fillgvKat();
        }
        catch (Exception ex)
        {
            txtError.Text = ex.Message;
        }
    }
    protected void gvDetail_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtidadmin.Text = (gvDetail.SelectedRow.FindControl("lblID") as Label).Text;
        txtnama.Text = (gvDetail.SelectedRow.FindControl("lblNamaAdmin") as Label).Text;
        txtuser.Text = (gvDetail.SelectedRow.FindControl("lblUser") as Label).Text;
        txtpwd.Text = (gvDetail.SelectedRow.FindControl("lblPassword") as Label).Text;
        
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