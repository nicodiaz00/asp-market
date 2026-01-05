<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">



    <div class="container col-xxl-8 px-4 py-5">
        <div class="row flex-lg-row-reverse align-items-center g-5 py-5">

            <div class="col-10 col-sm-8 col-lg-6">
                <img src="bootstrap-themes.png" class="d-block mx-lg-auto img-fluid" alt="Bootstrap Themes" width="700" height="500" loading="lazy">
            </div>

            <div class="col-lg-6">
                <h1 class="display-5 fw-bold text-body-emphasis lh-1 mb-3">ASP.MARKET</h1>

                <p class="lead">APP que te permite gestionar tus articulos de forma sensilla y amigable.</p>

                <div class="d-grid gap-2 d-md-flex justify-content-md-start">
                    <button type="button" class="btn btn-primary btn-lg px-4 me-md-2">Primary</button>
                    <button type="button" class="btn btn-outline-secondary btn-lg px-4">Default</button>
                </div>
            </div>

        </div>
    </div>
    <div class="row g-4 py-5 row-cols-1 row-cols-lg-4">


        <asp:Repeater runat="server" ID="repArticulo">
            <ItemTemplate>
                <div class="col">
                    <div class="card h-80">
                        <img src="<%#Eval("ImagenUrl") %>" class="card-img-top w-75 mx-auto d-block" style="height: 200px; object-fit: contain;" alt="...">
                        <div class="card-body">
                            <h5 class="card-title"><%#Eval("Nombre")%></h5>
                            <p class="card-text" style="display: -webkit-box; -webkit-line-clamp: 1; -webkit-box-orient: vertical; overflow: hidden; text-overflow: ellipsis;">
                                <%#Eval("Descripcion")%>
                            </p>                        

                        </div>
                        <div class="card-footer text-muted">
                            <asp:Button runat="server" ID="btnIdArticulo" CssClass="btn btn-info" CommandArgument='<%#Eval("Id")%>' CommandName="IdArticulo" OnClick="btnIdArticulo_Click" Text="Seleccionar" />
                            <asp:Button runat="server" ID="btnFavorito" Text="Detalle" CssClass="btn btn-info" CommandArgument='<%#Eval("Id")%>' CommandName="IdArticulo" OnClick="btnFavorito_Click" />
                        </div>
                    </div>
                </div>

            </ItemTemplate>
        </asp:Repeater>







    </div>

</asp:Content>
