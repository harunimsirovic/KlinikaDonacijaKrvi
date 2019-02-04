using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if(IsPostBack)
        {

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["logRegConnectionString"].ConnectionString);
            conn.Open();
            string checkuser = "select count(*) from [users] where username='" + Username.Text + "'";
            SqlCommand com = new SqlCommand(checkuser, conn);
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
            if (temp == 1)
            {

                Poruka.Text = ("User vec postoji");

            }

            conn.Close();

        }
    }

    protected void BtnLogin_Click(object sender, EventArgs e)
    {

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["logRegConnectionString"].ConnectionString);
        conn.Open();
        string checkuser = "select count(*) from users where username='" + Username.Text + "'";
        SqlCommand com = new SqlCommand(checkuser, conn);
        int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
        if (temp == 1)
        {

            string checkpassword = "select pass from users where username='" + Username.Text + "'";
            SqlCommand command = new SqlCommand(checkpassword, conn);
            string password = command.ExecuteScalar().ToString();


            password = string.Join("", password.Split(default(string[]), StringSplitOptions.RemoveEmptyEntries));

            if (password == Password.Text)
            {
                Session["New"] = Username.Text;
                Poruka.Text=("Password je tačan!");
                Response.Redirect("Donacija.aspx");
            }
            else
            {
                Poruka.Text = ("Password je netačan");
            }
        }
        else
        {
            Poruka.Text = ("Username ne postoji u bazi");
        }
        conn.Close();



    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        if (IsPostBack)
        {

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["logRegConnectionString"].ConnectionString);
            conn.Open();

            string checkuser = "select count(*) from [users] where username='" + Username.Text + "'";
            SqlCommand comn = new SqlCommand(checkuser, conn);
            int temp = Convert.ToInt32(comn.ExecuteScalar().ToString());
            if (temp == 1)
            {

                Poruka.Text = ("User vec postoji");

            }

            else
            {
                string insert = "insert into users(username, pass) values(@Username, @Password) ";
                SqlCommand com = new SqlCommand(insert, conn);
                com.Parameters.AddWithValue("@Username", Username.Text);
                com.Parameters.AddWithValue("@Password", Password.Text);

                com.ExecuteNonQuery();

                Poruka.Text = "Uspješno ste se registrovali, sada se možete logirati";

                conn.Close();
            }

           

        }




    }
}
