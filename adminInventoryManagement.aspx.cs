using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pr1
{
    public partial class admininventorymanagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static int global_actual_stock, global_current_stock, global_issued_books;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillAuthorPublisherValues();
            }
            resetTable();
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            getBookByID();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (checkIfBookExists())
            {
                Response.Write("<script>alert('Mã số Sách đã tồn tại');</script>");
            }
            else
            {
                addNewBook();
                resetTable();
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            updateBookByID();
            resetTable();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            deleteBookByID();
            resetTable();
        }
        void deleteBookByID()
        {
            if (checkIfBookExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE from book_master_tb1 WHERE book_id='" + TextBox1.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Xóa Sách thành công');</script>");
                    clearForm();
                    resetTable();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Mã số Sách không tồn tại');</script>");
            }
        }

        void updateBookByID()
        {
            if (checkIfBookExists())
            {
                try
                {

                    int actual_stock = Convert.ToInt32(TextBox4.Text.Trim());
                    int current_stock = Convert.ToInt32(TextBox5.Text.Trim());

                    if (global_actual_stock == actual_stock)
                    {

                    }
                    else
                    {
                        if (actual_stock < global_issued_books)
                        {
                            Response.Write("<script>alert('Actual Stock value cannot be less than the Issued books');</script>");
                            return;


                        }
                        else
                        {
                            current_stock = actual_stock - global_issued_books;
                            TextBox5.Text = "" + current_stock;
                        }
                    }



                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("UPDATE book_master_tbl set book_name=@book_name, author_name=@author_name, publisher_name=@publisher_name, publish_date=@publish_date, language=@language, edition=@edition, book_cost=@book_cost, no_of_pages=@no_of_pages, book_description=@book_description, actual_stock=@actual_stock, current_stock=@current_stock where book_id='" + TextBox1.Text.Trim() + "'", con);
                    cmd.Parameters.AddWithValue("@book_name", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@author_name", DropDownList3.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@publisher_name", DropDownList2.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@publish_date", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@language", DropDownList1.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@edition", TextBox9.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_cost", TextBox10.Text.Trim());
                    cmd.Parameters.AddWithValue("@no_of_pages", TextBox11.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_description", TextBox6.Text.Trim());
                    cmd.Parameters.AddWithValue("@actual_stock", actual_stock.ToString());
                    cmd.Parameters.AddWithValue("@current_stock", current_stock.ToString());
                    cmd.ExecuteNonQuery();
                    con.Close();
                    resetTable();
                    Response.Write("<script>alert('Cập nhật Sách thành công');</script>");
                    clearForm();


                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Mã số Sách không tồn tại');</script>");
            }
        }


        void getBookByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from book_master_tb1 WHERE book_id='" + TextBox1.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {

                        TextBox2.Text = dr.GetValue(1).ToString().Trim();
                        TextBox3.Text = dr.GetValue(4).ToString().Trim();
                        TextBox9.Text = dr.GetValue(6).ToString().Trim();
                        TextBox10.Text = dr.GetValue(7).ToString().Trim();
                        TextBox11.Text = dr.GetValue(8).ToString().Trim();
                        TextBox4.Text = dr.GetValue(10).ToString().Trim();
                        TextBox5.Text = dr.GetValue(11).ToString().Trim();
                        TextBox6.Text = dr.GetValue(9).ToString();
                        int temp1 = Convert.ToInt32(TextBox4.Text);
                        int temp2 = Convert.ToInt32(TextBox5.Text);
                        TextBox7.Text = (temp1 - temp2).ToString();

                        DropDownList1.SelectedValue = dr.GetValue(5).ToString().Trim();
                        DropDownList2.SelectedValue = dr.GetValue(3).ToString().Trim();
                        DropDownList3.SelectedValue = dr.GetValue(2).ToString().Trim();


                    }
                    global_actual_stock = Convert.ToInt32(TextBox4.Text);
                    global_current_stock = Convert.ToInt32(TextBox5.Text);
                    if (TextBox7.Text != null) global_issued_books = Convert.ToInt32(TextBox7.Text);
                    else global_issued_books = 0;
                }
                else
                {
                    Response.Write("<script>alert('Mã số Sách không tồn tại');</script>");
                    clearForm();
                }
                con.Close();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        void fillAuthorPublisherValues()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT author_name from author_master_tb1;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                DropDownList3.DataSource = dt;
                DropDownList3.DataValueField = "author_name";
                DropDownList3.DataBind();

                cmd = new SqlCommand("SELECT publisher_name from publisher_master_tb1;", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                DropDownList2.DataSource = dt;
                DropDownList2.DataValueField = "publisher_name";
                DropDownList2.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        bool checkIfBookExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from book_master_tb1 where book_id='" + TextBox1.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        void addNewBook()
        {
            try
            {


                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO book_master_tb1 values(@book_id,@book_name,@author_name,@publisher_name,@publish_date,@language,@edition,@book_cost,@no_of_pages,@book_description,@actual_stock,@current_stock)", con);

                cmd.Parameters.AddWithValue("@book_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@author_name", DropDownList3.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publisher_name", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publish_date", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@language", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@edition", TextBox9.Text.Trim());
                cmd.Parameters.AddWithValue("@book_cost", TextBox10.Text.Trim());
                cmd.Parameters.AddWithValue("@no_of_pages", TextBox11.Text.Trim());
                cmd.Parameters.AddWithValue("@book_description", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@actual_stock", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@current_stock", TextBox4.Text.Trim());


                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Thêm sách thành công.');</script>");
                resetTable();
                clearForm();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void resetTable()
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter("Select [book_id] AS [Mã số Sách],[book_name] AS [Tên Sách] ,[author_name] AS [Tác giả] ,[publisher_name] AS [Nhà xuất bản],[actual_stock] AS [Số lượng thực tế] ,[current_stock] AS [Số lượng hiện tại] FROM [ELib].[dbo].[book_master_tb1]", con);
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            con.Close();
        }
        void clearForm()
        {
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox9.Text = "";
            TextBox10.Text = "";
            TextBox11.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
        }
    }
}