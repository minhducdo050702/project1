<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminBookIssuing.aspx.cs" Inherits="pr1.adminbookissuing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
         });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-fluid">
      <div class="row">
         <div class="col-md-5">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Danh sách mượn trả sách</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <img width="100px" src="https://visualpharm.com/assets/688/Books-595b40b65ba036ed117d3c94.svg" />
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <label>Mã số Tài khoản</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="VD: 20200158"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Mã số sách</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="VD: 1234"></asp:TextBox>
                               <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Tìm kiếm" OnClick="Button1_Click" />
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <label>Họ tên Người mượn</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="VD: Đỗ Minh Đức" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Tên sách</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="VD: Giải tích I" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <label>Ngày mượn</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Start Date" TextMode="Date"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Ngày trả</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="End Date" TextMode="Date"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-6">
                         <asp:Button ID="Button2" class="btn btn-lg btn-block btn-primary" runat="server" Text="Mượn" OnClick="Button2_Click" />
                     </div>
                     <div class="col-6">
                         <asp:Button ID="Button4" class="btn btn-lg btn-block btn-success" runat="server" Text="Trả" OnClick="Button4_Click" />
                     </div>
                  </div>
               </div>
            </div>
            <a href="homepage.aspx"><< Trang chủ</a><br>
            <br>
         </div>
         <div class="col-md-7">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Danh sách sách đã mượn</h4>
                       </center>
										</div>
									</div>
									<div class="row">
										<div class="col">
											<hr>
											</div>
										</div>
										<div class="row">
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ELibConnectionString %>' SelectCommand="SELECT * FROM [book_issue_tb1]">
											</asp:SqlDataSource>
											<div class="col">
												<asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound">
													<Columns>
                                                        <asp:BoundField DataField="member_id" HeaderText="Mã số Người mượn" SortExpression="member_id"></asp:BoundField>
                                                        <asp:BoundField DataField="member_name" HeaderText="Tên người mượn" SortExpression="member_name"></asp:BoundField>
                                                        <asp:BoundField DataField="book_id" HeaderText="Mã số sách" SortExpression="book_id"></asp:BoundField>
                                                        <asp:BoundField DataField="book_name" HeaderText="Tên sách" SortExpression="book_name"></asp:BoundField>
                                                        <asp:BoundField DataField="issue_date" HeaderText="Ngày mượn" SortExpression="issue_date"></asp:BoundField>
                                                        <asp:BoundField DataField="due_date" HeaderText="Ngày hết hạn" SortExpression="due_date"></asp:BoundField>
													</Columns>
												</asp:GridView>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</asp:Content>