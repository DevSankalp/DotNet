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

namespace DataGridView
{
    public partial class EmployeeDataGrid : Form
    {
        SqlConnection Conn;
        SqlCommand Cmd;
        SqlDataAdapter Adapter;
        string Query;

        public EmployeeDataGrid()
        {
            InitializeComponent();
        }

        private void EmployeeDataGrid_Load(object sender, EventArgs e)
        {
            try
            {
                Conn = new SqlConnection(
                    "Server=MALATHI\\MALATHI;Database=SalaryInformation;Integrated Security=true;"
                );
                Conn.Open();
                MessageBox.Show("Database Connection Established", "DB Connection");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "DB Connection Error");
            }
        }

        private void BtnDetails_Click(object sender, EventArgs e)
        {
            Query = "Select * From Employee";
            Adapter = new SqlDataAdapter(Query, Conn);
            DataSet DSet = new DataSet();
            Adapter.Fill(DSet, "Employee");
            DataGrid DGrid = new DataGrid();
            DGrid.DataSource = DSet;
            DGrid.DataMember = "Employee";
            DGrid.Location = new Point(125, 133);
            DGrid.Height = 300;
            DGrid.Width = 600;
            this.Controls.Add(DGrid);
        }

        private void BtnQuit_Click(object sender, EventArgs e)
        {
            if (
                MessageBox.Show(
                    "Do You Really Want to Quit?",
                    "Exit Application",
                    MessageBoxButtons.YesNo
                ) == DialogResult.Yes
            )
            {
                Conn.Close();
                Conn = null;
                Application.Exit();
            }
        }
    }
}
