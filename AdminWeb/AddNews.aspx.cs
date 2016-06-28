﻿using System;
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

public partial class AdminWeb_AddNews : System.Web.UI.Page
{
    private SqlConnection koneksi;
    protected void Page_Load(object sender, EventArgs e)
    {
        DropdownList();
        BeritaID();
        displaynews();
        //koneksi.Open();

        if (!Page.IsPostBack)
        {
            sessionstate();
        }

        if (!IsPostBack)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
            Response.Cache.SetNoStore();
        }

        Response.Cache.SetNoStore();
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        lbldatetime.Text = DateTime.Now.ToString("MM-dd-yyyy h:mmtt");
    }

    public void sessionstate()
    {
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
            //}
            //koneksi.Close();
        }
        else
        {
            Session.RemoveAll();
            Response.Redirect("Login.aspx");
        }
    }
    protected void Logout_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("Login.aspx");
    }
    public void DropdownList()
    {
        string strConn = WebConfigurationManager.ConnectionStrings["berita"].ConnectionString;
        koneksi = new SqlConnection(strConn);
        koneksi.Open();
        SqlCommand ambil = new SqlCommand("select NamaKategori from Kategori", koneksi);

        SqlDataReader dr = ambil.ExecuteReader();
        while (dr.Read())
        {
            ArrayList kat = new ArrayList();
            kat.Add(dr.GetString(0));
            foreach (String s in kat)
                katberita.Items.Add(s);
            //katberita.SelectedIndex = 0;
        }
        koneksi.Close();
    }
    private void BeritaID()
    {
        AutoGeneratedID auto = new AutoGeneratedID();
        string idk = auto.AutoGenerateIDBer();
        txtidberita.Text = idk;
    }
    protected void txtidberita_TextChanged(object sender, EventArgs e)
    {
        BeritaID();
    }
    protected void simpanBer_Click(object sender, EventArgs e)
    {
        if (katberita.SelectedItem.Value != "")
        {
            if (FileUploadControl.HasFile)
            {
                try
                {
                    if (FileUploadControl.PostedFile.ContentType == "image/jpeg" || FileUploadControl.PostedFile.ContentType == "image/png")
                    {
                        if (FileUploadControl.PostedFile.ContentLength < 102400)
                        {
                            string filename = Path.GetFileName(FileUploadControl.FileName);
                            FileUploadControl.SaveAs(Server.MapPath("../photoberita/") + filename);

                            try
                            {
                                string strConn = WebConfigurationManager.ConnectionStrings["berita"].ConnectionString;
                                koneksi = new SqlConnection(strConn);
                                koneksi.Open();
                                string sql = @"select ID_Kategori from Kategori where NamaKategori = @NamaKategori";
                                SqlCommand cmd1 = new SqlCommand(sql, koneksi);
                                cmd1.Parameters.AddWithValue("@NamaKategori", katberita.SelectedItem.Text);
                                SqlDataReader dr = cmd1.ExecuteReader();
                                if (dr.Read())
                                {
                            string id = dr.GetString(0);
                            string idberita1 = txtidberita.Text;
                            string idkatberita1 = id;
                            string tanggal1 = lbldatetime.Text;
                            string judul1 = txtjudul.InnerText;
                            string isiberita1 = textareas.InnerText;
                            string sumber1 = txtsumber.InnerText;
                            string idadmin1 = txtidadmin.Text;

                            crud test = new crud();
                            int result = test.simpanberita(idberita1, idkatberita1, tanggal1, judul1, isiberita1, sumber1, idadmin1, filename);
                            Response.Write("<script>alert('Data Success Added');</script>");
                            reset();
                            Response.Redirect("AddNews.aspx");

                            if (result != 0)
                            {
                                Response.Redirect("AddNews.aspx");
                            }
                                }
                            }
                            catch (Exception cek)
                            {
                                StatusLabel.Text = cek.Message;
                            }
                            finally
                            {
                                koneksi.Close();
                            }

                        }
                        else
                            StatusLabel.Text = "Status: The file has to be less than 100 kb!";
                    }
                    else
                        StatusLabel.Text = "Status: Only JPEG AND PNG files are accepted!";
                }
                catch (Exception ex)
                {
                    StatusLabel.Text = "Status: The file could not be uploaded. The following error occured: " + ex.Message;
                }
            }
        }
    }

    public void reset()
    {
        txtjudul.InnerText = "";
        textareas.InnerText = "";
        txtsumber.InnerText = "";
    }
    protected void katberita_SelectedIndexChanged(object sender, EventArgs e)
    {
        //koneksi.Open();
        //string sql = @"select * from Kategori where NamaKategori = @NamaKategori";
        //SqlCommand cmd1 = new SqlCommand(sql, koneksi);
        //cmd1.Parameters.AddWithValue("@NamaKategori", katberita.Text);
        //SqlDataReader dr = cmd1.ExecuteReader();
        //if (dr.Read())
        //{
        //    string id = dr.GetString(0);
        //    idkat.Text = id;
        //}
        //else
        //{
        //    idkat.Text = "salah";
        //}
    }
    //protected void Reset_Click(object sender, EventArgs e)
    //{
    //    reset();
    //}

    public void displaynews()
    {
        //Building an HTML string.
        StringBuilder html = new StringBuilder();

        //Table start.
        html.Append("<table class='table table-bordered'>");

        html.Append("<tr>");
        html.Append("<th>ID Berita</th>");
        html.Append("<th>News Category</th>");
        html.Append("<th>Title</th>");
        html.Append("<th>Date</th>");
        html.Append("<th>News</th>");
        html.Append("<th>Source</th>");
        html.Append("<th>Publisher</th>");
        html.Append("<th>Photo</th>");
        html.Append("</tr>");


        //Building the Data rows.


        string strConn = WebConfigurationManager.ConnectionStrings["berita"].ConnectionString;
        koneksi = new SqlConnection(strConn);
        koneksi.Open();
        string sql = "select b.ID_Berita, c.NamaKategori, b.Judul, b.Tanggal, b.IsiBerita, b.Sumber, a.Nama, b.Foto from Berita b JOIN Kategori c on b.ID_Kategori = c.ID_Kategori JOIN Admin a on b.ID_Admin = a.ID_Admin order by ID_Berita desc";
        SqlCommand sqlcon = new SqlCommand(sql, koneksi);
        using (koneksi)
        {
            SqlDataReader dr = sqlcon.ExecuteReader();
            while (dr.Read())
            {
                html.Append("<tr>");
                html.Append("<td>" + dr.GetString(0) + "</td>");
                html.Append("<td>" + dr.GetString(1) + "</td>");
                html.Append("<td>" + dr.GetString(2) + "</td>");
                html.Append("<td>" + dr.GetString(3) + "</td>");
                html.Append("<td>" + dr.GetString(4) + "</td>");
                html.Append("<td>" + dr.GetString(5) + "</td>");
                html.Append("<td>" + dr.GetString(6) + "</td>");
                html.Append("<td><img src='../photoberita/" + dr.GetString(7) + "' width='100px' height='100px'></td>");
                html.Append("</tr>");
            }
        }


        //Table end.
        html.Append("</table>");

        //Append the HTML string to Placeholder.
        DataNews.Controls.Add(new Literal { Text = html.ToString() });
        koneksi.Close();
    }
}