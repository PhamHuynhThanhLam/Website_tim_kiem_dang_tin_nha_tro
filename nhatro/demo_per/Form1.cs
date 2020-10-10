using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace demo_per
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-AAMU6EJ;Initial Catalog=test;Integrated Security=True");

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private string getID ()
        {
            string id = "";

            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM tbl_user WHERE user_name ='"+txt_username.Text+ "' AND pass = '"+txt_Pass.Text+"'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if(dt != null)
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        id = dr["id_user"].ToString();
                    }
                }
            }
            catch (Exception)
            {
                MessageBox.Show("lỗi");
            }
            finally
            {
                con.Close();
            }

            return id;

        }

        public static string ID_User = "";

        private void btn_login_Click(object sender, EventArgs e)
        {
            frm_main fmain = new frm_main();
            ID_User = getID();
            if(ID_User != "")
            {
                fmain.Show();
                this.Hide();
            }
            else
            {
                MessageBox.Show("Tài khoảng hoặc mật khẩu không đúng");
            }
            
            fmain.Show();
        }

        private void btn_exit_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }

   

}
