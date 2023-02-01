<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userLoginPage.aspx.cs" Inherits="pr1.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="container">
      <div class="row">
         <div class="col-md-6 mx-auto">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <img width="150px" src="https://visualpharm.com/assets/113/Collaborator%20Male-595b40b65ba036ed117d3e36.svg"/>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <h3>Đăng nhập</h3>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <label>Mã số đăng nhập</label>
                        <div class="form-group">
                            <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" ></asp:TextBox>
                        </div>
                        <label>Mật khẩu</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server"  TextMode="Password"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Button class="btn btn-success btn-lg w-100 mx-auto" ID="Button1" runat="server" Text="Đăng nhập" OnClick="Button1_Click" />
                        </div>
                        <div class="form-group">
                           <a href="userSignUpPage.aspx"><input class="btn btn-info btn-lg w-100 mx-auto" id="Button2" type="button" value="Đăng ký" /></a>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <a href="homepage.aspx"><< Trang chủ</a><br><br>
         </div>
      </div>
   </div>
</asp:Content>