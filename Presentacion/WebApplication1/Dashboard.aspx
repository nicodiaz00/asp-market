<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="WebApplication1.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row g-4 py-5 row-cols-1 row-cols-lg-4">
        <div class="col bg-primary">
            <asp:TextBox runat="server" ID="txtBusqueda">

            </asp:TextBox>
            <asp:Button runat="server" ID="btnBuscar" Text="buscar"/>
        </div>
        <div class="col">
        </div>
        
    </div>
    <div class="row g-4 py-5 row-cols-1 row-cols-lg-4">
        <div class="col">
            <asp:UpdatePanel runat="server" ID="updatepanel1">
                <ContentTemplate>
                    <asp:GridView runat="server" ID="dvgArticulo" AutoGenerateColumns="false" CssClass="table table-dark table-striped table-hover" OnSelectedIndexChanged="dvgArticulo_SelectedIndexChanged" DataKeyNames="Id" OnPageIndexChanging="dvgArticulo_PageIndexChanging" AllowPaging="true" PageSize="5">
                        <Columns>
                            <asp:BoundField HeaderText="ID" DataField="Id" ItemStyle-CssClass="d-none" HeaderStyle-CssClass="d-none" />
                            <asp:BoundField HeaderText="CODIGO" DataField="Codigo" ItemStyle-CssClass="" HeaderStyle-CssClass="" />
                            <asp:BoundField HeaderText="NOMBRE" DataField="Nombre" ItemStyle-CssClass="" HeaderStyle-CssClass="" />
                            <asp:BoundField HeaderText="DESCRIPCIÓN" DataField="Descripcion" ItemStyle-CssClass="" HeaderStyle-CssClass="" />
                            <asp:BoundField HeaderText="IDMARCA" DataField="Marca.Id" ItemStyle-CssClass="" HeaderStyle-CssClass="oculto" />
                            <asp:BoundField HeaderText="IDCATEGORIA" DataField="Categoria.Id" ItemStyle-CssClass="" HeaderStyle-CssClass="" />
                            <asp:BoundField HeaderText="CATEGORIA" DataField="Categoria" ItemStyle-CssClass="" HeaderStyle-CssClass="" />
                            <asp:BoundField HeaderText="MARCA" DataField="Marca" ItemStyle-CssClass="" HeaderStyle-CssClass="" />
                            <asp:BoundField HeaderText="IMAGEN" DataField="ImagenUrl" ItemStyle-CssClass="" HeaderStyle-CssClass="" />
                            <asp:BoundField HeaderText="PRECIO" DataField="Precio" ItemStyle-CssClass="" HeaderStyle-CssClass="" />
                            <asp:CommandField ShowSelectButton="true" HeaderText="EDITAR" SelectText="✍️" ItemStyle-CssClass="" HeaderStyle-CssClass="" />

                        </Columns>
                    </asp:GridView>

                </ContentTemplate>
            </asp:UpdatePanel>

        </div>
    </div>



</asp:Content>
