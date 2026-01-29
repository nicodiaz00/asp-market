<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="WebApplication1.Edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row g-3">
        <div class="col-12">
            <h2>Editar Artículo</h2>
        </div>  
    </div>
    <div class="row g-3">
        <div class="col-6 d-flex flex-column">
            <label class="form-label m-1">Codigo</label>
            <asp:TextBox runat="server" ID="txtCodigo" CssClass="form-control m-1" />

            <label class="form-label m-1">Nombre</label>
            <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control m-1" />

            <label class="form-label m-1">Descripción</label>
            <asp:TextBox runat="server" ID="txtDescripcion" TextMode="MultiLine" CssClass="form-control m-1" />

            <label class="form-label m-1">Imagen</label>
            <asp:TextBox runat="server" ID="txtImagen" CssClass="form-control m-1" />

            <label class="form-label m-1">Precio</label>
            <asp:TextBox runat="server" ID="txtPrecio" CssClass="form-control m-1" TextMode="SingleLine" />

            <label class="form-label m-1">Marca</label>
            <asp:DropDownList runat="server" ID="ddMarca" CssClass="form-control form-control-sm m-1"></asp:DropDownList>

            <label class="form-label">Categoria</label>
            <asp:DropDownList runat="server" ID="ddCategoria" CssClass="form-control form-control-sm"></asp:DropDownList>
        </div>
        <div class="col-6 d-flex justify-content-center align-items-center">
            <asp:Image runat="server" ID="imgArticulo" Style="max-height: 300px;" ImageUrl="https://tse3.mm.bing.net/th/id/OIP.3Wpv91fvc8FukJX-gslWbgHaHa?rs=1&pid=ImgDetMain&o=7&rm=3" />
        </div>
        <div class="row g-3">
            <div class="col-12 d-flex flex-row justify-content-center align-items-center">
                <asp:Button runat="server" ID="btnGuardar" Text="Guardar" CssClass="btn btn-outline-success btn-sm m-1 shadow p-1 bg-white rounded" OnClick="btnGuardar_Click" />
                <asp:Button runat="server" ID="btnCancelar" Text="Cancelar" CssClass="btn btn-outline-warning btn-sm m-1 shadow  bg-white rounded" OnClick="btnCancelar_Click" />
                </div>
        </div>


    </div>
</asp:Content>
