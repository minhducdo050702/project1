using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pr1
{
    public partial class viewBooks : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter("Select [book_id] AS [Mã số Sách],[book_name] AS [Tên Sách] ,[author_name] AS [Tác giả] ,[publisher_name] AS [Nhà xuất bản],publish_date AS [Ngày xuất bản],language AS [Ngôn ngữ],edition AS [Tái bản],no_of_pages AS [Số trang],book_description AS [Mô tả] FROM [ELib].[dbo].[book_master_tb1]", con);
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            con.Close();

        }

    }
}