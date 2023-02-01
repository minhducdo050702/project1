<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="homePage.aspx.cs" Inherits="pr1.homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
        <img src="Assets/imgs/home-bg.jpg"class="img-fluid" />
   </section>
   <section>
      <div class="container">
         <div class="row">
         <div class="row">
            <div class="col-md-4">
               <center>
                  <img width="150px" src="Assets/imgs/sign-up.png" />
                  <h4>Đăng ký</h4>
                  <p class="text-justify">Đăng ký tài khoản mượn sách</p>
               </center>
            </div>
            <div class="col-md-4">
               <center>
                   <img width="150px" src="Assets/imgs/search-online.png" />
                  <h4>Tìm sách</h4>
                  <p class="text-justify">Tìm sách trực tuyến</p>
               </center>
            </div>
            <div class="col-md-4">
               <center>
                   <img width="150px" src="Assets/imgs/library.png" />
                  <h4>Thư viện trực tuyến</h4>
                  <p class="text-justify">Theo dõi mượn trả sách</p>
               </center>
            </div>
         </div>
      </div>
   </section>
     <section>
       <img src="https://library.hust.edu.vn/sites/default/files/styles/slidechinh/public/Screenshot%20%28459%29.png?itok=4qsv9jfA"class="w-100 mx-auto"  />
   </section> 
</asp:Content>
