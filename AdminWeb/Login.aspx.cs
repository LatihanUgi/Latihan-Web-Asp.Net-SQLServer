using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

public partial class AdminWeb_Login : System.Web.UI.Page
{
    private SqlConnection koneksi;
    protected void Page_Load(object sender, EventArgs e)
    {
        string strConn = WebConfigurationManager.ConnectionStrings["berita"].ConnectionString;
        koneksi = new SqlConnection(strConn);

        if (Session["Id"] == "1" && Session["Username"] != "")
        {
            Response.Redirect("Dashbord.aspx");
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        koneksi.Open();
        SqlCommand cmd = new SqlCommand("select * from ADMIN where Username =@username and Password=@password", koneksi);
        cmd.Parameters.AddWithValue("@username", txtUserName.Text);
        cmd.Parameters.AddWithValue("@password", txtPWD.Text);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            string sql = @"select ID_Admin,Nama from Admin where Username = @username1";
            SqlCommand cmd1 = new SqlCommand(sql, koneksi);
                cmd1.Parameters.AddWithValue("@username1", txtUserName.Text);
                SqlDataReader dr = cmd1.ExecuteReader();
                if (dr.Read())
                {
                    string id = dr.GetString(0);
                    string nama = dr.GetString(1);
                    //string user = dr.GetString(2);
                    Session["ID_Admin"] = id;
                    Session["Username"] = nama;
                    //Session["Nama"] = user;

                }
            //Session["Username"] = txtUserName.Text;
            Session["Id"] = "1";
            Response.Redirect("Dashbord.aspx");
        }
        else
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Invalid Username and Password!')</script>");
        }
    }
}