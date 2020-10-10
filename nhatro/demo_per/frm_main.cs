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
using static demo_per.employee;

namespace demo_per
{
    
    public partial class frm_main : Form
    {
       
        public frm_main()
        {
            InitializeComponent();
        }

        //string UID = Form1.ID_User;
    
        CRUD connect = new CRUD();

        public interface IBuilder
        {
            void name_user(string a);

            void user_name(string b);

            void Password(string c);
        }
        public class ConcreteBuilder : IBuilder
        {
           
            private Product _product = new Product();

            // A fresh builder instance should contain a blank product object, which
            // is used in further assembly.
            public ConcreteBuilder()
            {
                this.Reset();
            }

            public void Reset()
            {
                this._product = new Product();
            }
            
            public Product GetProduct()
            {
                Product result = this._product;

                this.Reset();

                return result;
            }

            public void name_user(string a)
            {
                this._product.Add(a);
            }

            public void user_name(string b)
            {
                this._product.Add(b);
            }

            public void Password(string c)
            {
                this._product.Add(c);
            }
        }

        public class Product
        {
            private List<object> _parts = new List<object>();

            public void Add(string part)
            {
                this._parts.Add(part);
            }

            public string ListParts()
            {
                string str = string.Empty;
                CRUD connect = new CRUD();
                if (connect.exedata("INSERT INTO tbl_user (name_user,user_name,pass) VALUES (N'" + this._parts[0] + "','" + this._parts[1] + "','" + this._parts[2] + "')") == true)
                {
                    MessageBox.Show("Đã thêm dữ liệu");
                }
                else
                {
                    MessageBox.Show("Không thể thêm dữ liệu");
                }
                for (int i = 0; i < this._parts.Count; i++)
                {
                    str += this._parts[i] + ", ";
                }

                str = str.Remove(str.Length - 2); // removing last ",c"

                return "Product parts: " + str + "\n";
            }
        }
        public class Director
        {
            private IBuilder _builder;

            public IBuilder Builder
            {
                set { _builder = value; }
            }
            public void buildFullFeaturedProduct(string a, string b, string c)
            {
                this._builder.name_user(a);
                this._builder.Password(b);
                this._builder.name_user(c);
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (connect.exedata("INSERT INTO tbl_user (name_user,user_name,pass) VALUES (N'" + textBox1.Text + "','" +textBox1.Text + "','" + textBox1.Text + "')") == true)
            {
                MessageBox.Show("Đã thêm dữ liệu");
            }
            else
            {
                MessageBox.Show("Không thể thêm dữ liệu");
            }
        }

            private void frm_main_Load(object sender, EventArgs e)
        {

        }
        
        private void button2_Click(object sender, EventArgs e)
        {
            
            var director = new Director();
            var builder = new ConcreteBuilder();
            director.Builder = builder;
            textBox2.Text=("Standard full featured product:");
            director.buildFullFeaturedProduct(textBox1.Text, textBox1.Text, textBox1.Text);

            textBox3.Text=(builder.GetProduct().ListParts());
        }
       
    }
}
    
