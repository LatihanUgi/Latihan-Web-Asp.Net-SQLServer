using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

/// <summary>
/// Summary description for crud
/// </summary>
public class crud
{
    private SqlConnection conn;
    private SqlCommand cmd;

    public SqlConnection sambung()
    {
        string strConn = WebConfigurationManager.ConnectionStrings["berita"].ConnectionString;
        conn = new SqlConnection(strConn);
        return conn;
    }

    public crud()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public int simpanberita(string idberita, string idkatberita, string judul, string tanggal, string isiberita, string sumber, string idadmin, string foto)
    {
        crud con = new crud();
        SqlConnection sqlcon = con.sambung();
        int result = 0;
        using (sqlcon)
        {
            sqlcon.Open();
            string sql = "INSERT INTO Berita VALUES(@ID_Berita, @ID_Kategori, @Judul, @Tanggal, @IsiBerita, @Sumber, @ID_Admin, @Foto)";
            SqlCommand sqlcom = new SqlCommand(sql, sqlcon);
            using (sqlcom)
            {
                sqlcom.Parameters.Add(new SqlParameter("@ID_Berita", idberita));
                sqlcom.Parameters.Add(new SqlParameter("@ID_Kategori", idkatberita));
                sqlcom.Parameters.Add(new SqlParameter("@Judul", judul));
                sqlcom.Parameters.Add(new SqlParameter("@Tanggal", tanggal));
                sqlcom.Parameters.Add(new SqlParameter("@IsiBerita", isiberita));
                sqlcom.Parameters.Add(new SqlParameter("@Sumber", sumber));
                sqlcom.Parameters.Add(new SqlParameter("@ID_Admin", idadmin));
                sqlcom.Parameters.Add(new SqlParameter("@Foto", foto));
                sqlcom.ExecuteNonQuery();
            }
            //HttpResponse.ReferenceEquals("KatBerita.aspx");
        }
        return result;
    }
    public void simpan(string id, string nama)
    {
        crud con = new crud();
        SqlConnection sqlcon = con.sambung();
        using (sqlcon)
        {
            sqlcon.Open();
            string sql = "INSERT INTO Kategori VALUES(@ID_Kategori, @NamaKategori)";
            SqlCommand sqlcom = new SqlCommand(sql, sqlcon);
            using (sqlcom)
            {
                sqlcom.Parameters.Add(new SqlParameter("@ID_Kategori", id));
                sqlcom.Parameters.Add(new SqlParameter("@NamaKategori", nama));
                sqlcom.ExecuteNonQuery();
            }
            sqlcon.Close();
            //HttpResponse.ReferenceEquals("KatBerita.aspx");
        }
    }
    public void simpanadmin(string id, string nama, string user, string password)
    {
        crud con = new crud();
        SqlConnection sqlcon = con.sambung();
        using (sqlcon)
        {
            sqlcon.Open();
            string sql = "INSERT INTO Admin VALUES(@ID_Admin, @Nama, @Username, @Password)";
            SqlCommand sqlcom = new SqlCommand(sql, sqlcon);
            using (sqlcom)
            {
                sqlcom.Parameters.Add(new SqlParameter("@ID_Admin", id));
                sqlcom.Parameters.Add(new SqlParameter("@Nama", nama));
                sqlcom.Parameters.Add(new SqlParameter("@Username", user));
                sqlcom.Parameters.Add(new SqlParameter("@Password", password));
                sqlcom.ExecuteNonQuery();
            }
            sqlcon.Close();
            //HttpResponse.ReferenceEquals("KatBerita.aspx");
        }
    }

    public void ubah(string idkat, string namakat)
    {
        crud con = new crud();
        conn = con.sambung();
        using (conn)
        {
            conn.Open();
            string sql = "UPDATE Kategori SET NamaKategori = @NamaKategori WHERE ID_Kategori = @ID_Kategori";
            SqlCommand sqlcom = new SqlCommand(sql, conn);
            using (sqlcom)
            {
                sqlcom.Parameters.Add(new SqlParameter("@ID_Kategori", idkat));
                sqlcom.Parameters.Add(new SqlParameter("@NamaKategori", namakat));
                sqlcom.ExecuteNonQuery();
            }
            conn.Close();
        }
    }

    public void Delete(string IDcat)
    {
        crud con = new crud();
        conn = con.sambung();
        using (conn)
        {
            conn.Open();
            string sql = "DELETE FROM Kategori WHERE ID_Kategori = @ID_Kategori";
            SqlCommand sqlcom = new SqlCommand(sql, conn);
            using (sqlcom)
            {
                sqlcom.Parameters.Add(new SqlParameter("@ID_Kategori", IDcat));
                sqlcom.ExecuteNonQuery();
            }
            conn.Close();
        }
    }

    //crud untuk berita

    //public void cbIDkasus()
    //{
    //    crud con = new crud();
    //    SqlConnection sqlcon = con.sambung(); 
    //    SqlDataAdapter sqlda = new SqlDataAdapter("select * from Kategori", sqlcon);
    //    sqlcon.Open();
    //    SqlCommand sqlselect = new SqlCommand("Select ID_Kategori from Kategori", sqlcon);

    //    SqlDataReader dr = sqlselect.ExecuteReader();
    //    while (dr.Read())
    //    {
    //        ArrayList MyAL = new ArrayList();
    //        MyAL.Add(dr.GetString(0));
    //        foreach (string s in MyAL)
    //            cbidkasus.Items.Add(s);
    //        cbidkasus.SelectedIndex = 0;
    //    }
    //    sqlcon.Close();
    //}

    // crud untuk admin
    public void ubahAdmin(string idA, string namaA, string username, string pass)
    {
        crud con = new crud();
        conn = con.sambung();
        using (conn)
        {
            conn.Open();
            string sql = "UPDATE Admin SET Nama = @Nama, Username = @Username, Password = @Password WHERE ID_Admin = @ID_Admin";
            SqlCommand sqlcom = new SqlCommand(sql, conn);
            using (sqlcom)
            {
                sqlcom.Parameters.Add(new SqlParameter("@ID_Admin", idA));
                sqlcom.Parameters.Add(new SqlParameter("@Nama", namaA));
                sqlcom.Parameters.Add(new SqlParameter("@Username", username));
                sqlcom.Parameters.Add(new SqlParameter("@Password", pass));
                sqlcom.ExecuteNonQuery();
            }
            conn.Close();
        }
    }

    public void DeleteAdmin(string IDAdmin)
    {
        crud con = new crud();
        conn = con.sambung();
        using (conn)
        {
            conn.Open();
            string sql = "DELETE FROM Admin WHERE ID_Admin = @ID_Admin";
            SqlCommand sqlcom = new SqlCommand(sql, conn);
            using (sqlcom)
            {
                sqlcom.Parameters.Add(new SqlParameter("@ID_Admin", IDAdmin));
                sqlcom.ExecuteNonQuery();
            }
            conn.Close();
        }
    }
}