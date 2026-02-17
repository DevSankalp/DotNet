using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BasicCRUD
{
    public partial class EmployeeDB : Form
    {
        public EmployeeDB()
        {
            InitializeComponent();
        }

        SqlConnection Conn;
        SqlCommand Cmd;
        string Query;

        private void EmployeeDB_Load(object sender, EventArgs e)
        {
            try
            {
                Conn = new SqlConnection(
                    "Server=MALATHI\\MALATHI;Database=SalaryInformation;Integrated Security=true;"
                );
                Conn.Open();
                MessageBox.Show("Connection Established Successfully", "DB Connection");
            }
            catch (Exception ex)
            {
                MessageBox.Show("ERROR: " + ex.Message.ToString(), "DB Connection");
            }
            Query = "Select Department_ID From Department";
            Cmd = new SqlCommand(Query, Conn);
            SqlDataReader MyReader = Cmd.ExecuteReader();
            while (MyReader.Read())
            {
                CBODNo.Items.Add(MyReader["Department_ID"].ToString());
            }
            MyReader.Close();
        }

        private void BtnNew_Click(object sender, EventArgs e)
        {
            string Gender;
            if (CHKMale.Checked == true)
            {
                Gender = "M";
            }
            else
            {
                Gender = "F";
            }
            Query =
                @"Insert Into Employee(Employee_Name, Gender, Department_ID, Position, Date_Of_Birth) Values(' + TxtName.Text + ', ' + Gender + ',  + CBODNo.Text + , ' + TxtPosition.Text + ', ' + DTPickDOB.Value + ')";
            Cmd = new SqlCommand(Query, Conn);
            Cmd.ExecuteNonQuery();
            TxtName.Text = "";
            CHKMale.Checked = true;
            CBODNo.Text = "";
            TxtPosition.Text = "";
            TxtName.Focus();
        }

        private void BtnEdit_Click(object sender, EventArgs e)
        {
            Query =
                @"Update Employee Set Employee_Name = ' + TxtName.Text + ' Where Employee_ID = ' + TxtID.Text + '";
            Cmd = new SqlCommand(Query, Conn);
            Cmd.ExecuteReader();
        }

        private void BtnRemove_Click(object sender, EventArgs e)
        {
            Query = "Delete From Employee Where Employee_ID = ' + TxtID.Text + '";
            Cmd = new SqlCommand(Query, Conn);
            Cmd.ExecuteReader();
        }
    }
}
