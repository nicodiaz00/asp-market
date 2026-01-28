<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="WebApplication1.Edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row g-3">

        <div class="col-12">
            <label class="form-label">Codigo</label>
            <asp:TextBox runat="server" ID="txtCodigo" CssClass="form-control" />
        </div>
        <div class="col-12">
            <label class="form-label">Nombre</label>
            <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
        </div>

        <div class="col-12">
            <label class="form-label">Descripción</label>
            <asp:TextBox runat="server" ID="txtDescripcion" TextMode="MultiLine" CssClass="form-control" />
        </div>
        <div class="col-12">
            <label class="form-label">Imagen</label>
            <asp:TextBox runat="server" ID="txtImagen" CssClass="form-control" />
        </div>
        <div class="col-12">
            <asp:Image runat="server" ID="imgArticulo" Style="max-height: 100px;" ImageUrl="https://tse3.mm.bing.net/th/id/OIP.3Wpv91fvc8FukJX-gslWbgHaHa?rs=1&pid=ImgDetMain&o=7&rm=3" />
        </div>
        <div class="col-12">
            <label class="form-label">Precio</label>
            <asp:TextBox runat="server" ID="txtPrecio" CssClass="form-control" TextMode="Number" />
        </div>
        <div class="col-12">
            <label class="form-label">Marca</label>
            <asp:DropDownList runat="server" ID="ddMarca"></asp:DropDownList>
        </div>
        <div class="col-12">
            <label class="form-label">Categoria</label>
            <asp:DropDownList runat="server" ID="ddCategoria"></asp:DropDownList>
        </div>


    </div>
</asp:Content>
