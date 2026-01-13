<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="WebApplication1.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row g-4 py-5 row-cols-1 row-cols-lg-4 vh-20">
        <div class="col w-50 h-50">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="d-flex flex-row align-items-center">
                        <asp:Label runat="server" Text="Buscar"></asp:Label>
                        <asp:TextBox runat="server" ID="txtBusqueda" CssClass="form-control ms-2"></asp:TextBox>
                        <asp:Button runat="server" ID="btnBuscar" Text="Buscar" CssClass="btn btn-primary ms-1" />

                    </div>
                    <div class="d-flex flex-col">

                        <asp:CheckBox runat="server" ID="checkBusquedaAvanzada" Text="&nbsp;&nbsp;Busqueda avanzada" CssClass="ms-1" OnCheckedChanged="checkBusquedaAvanzada_CheckedChanged" AutoPostBack="true" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

        <asp:UpdatePanel runat="server" ID="UpdatePanelAvanzado">
            <ContentTemplate>

                <div class="d-flex align-items-center">

                    <label for="ddlCampo" class="ms-2">Campo</label>
                    <asp:DropDownList runat="server" ID="ddlCampo"
                        AutoPostBack="true"
                        CssClass="btn btn-primary btn-sm dropdown-toggle ms-2" OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged">
                    </asp:DropDownList>

                    <label for="ddlCriterio" class="ms-2">Criterio</label>
                    <asp:DropDownList runat="server" ID="ddlCriterio"
                        CssClass="btn btn-primary btn-sm dropdown-toggle ms-2">
                    </asp:DropDownList>

                    <label for="txtFiltro" class="ms-2">Filtro</label>
                    <asp:TextBox runat="server" ID="txtFiltro"
                        CssClass="form-control form-control-sm ms-2"
                        Style="width: 150px;"> </asp:TextBox>
                    <asp:RegularExpressionValidator runat="server" ID="regexLetras"
                        ControlToValidate="txtFiltro"
                        ValidationExpression="^[a-zA-Z0-9 ñÑáéíóúÁÉÍÓÚ]+$"
                        ErrorMessage="Solo se permiten letras y números."
                        CssClass="text-danger" Display="Dynamic" ValidationGroup="BusquedaAvanzada"
                        Enabled="false" />

                    <asp:RegularExpressionValidator runat="server" ID="regexNumeros"
                        ControlToValidate="txtFiltro"
                        ValidationExpression="^[0-9]+([.,][0-9]+)?$"
                        ErrorMessage="Solo números (use coma o punto)."
                        CssClass="text-danger" Display="Dynamic" ValidationGroup="BusquedaAvanzada"
                        Enabled="false" />

                    <asp:Button Text="Buscar" runat="server" ID="btnBuscarAvanzado"
                        CssClass="btn btn-primary btn-sm ms-3"
                        ValidationGroup="BusquedaAvanzada" OnClick="btnBuscarAvanzado_Click" />

                </div>

            </ContentTemplate>
        </asp:UpdatePanel>



    </div>
    <div class="row g-4 py-5 row-cols-1 row-cols-lg-4 vh-80">
        <div class="col flex-column w-100 border rounded-3 overflow-hidden">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>




                    <asp:GridView runat="server" ID="dvgArticulo" AutoGenerateColumns="false" CssClass="table table-light table-striped table-hover mb-0" OnSelectedIndexChanged="dvgArticulo_SelectedIndexChanged" DataKeyNames="Id" OnPageIndexChanging="dvgArticulo_PageIndexChanging" AllowPaging="true" PageSize="5" GridLines="None">
                        <Columns>
                            <asp:BoundField HeaderText="ID" DataField="Id" ItemStyle-CssClass="d-none" HeaderStyle-CssClass="d-none" />
                            <asp:BoundField HeaderText="CODIGO" DataField="Codigo" ItemStyle-CssClass="" HeaderStyle-CssClass="" />
                            <asp:BoundField HeaderText="NOMBRE" DataField="Nombre" ItemStyle-CssClass="" HeaderStyle-CssClass="" />
                            <asp:BoundField HeaderText="DESCRIPCIÓN" DataField="Descripcion" ItemStyle-CssClass="" HeaderStyle-CssClass="" />
                            <asp:BoundField HeaderText="IDMARCA" DataField="Marca.Id" ItemStyle-CssClass="d-none" HeaderStyle-CssClass="d-none" />
                            <asp:BoundField HeaderText="IDCATEGORIA" DataField="Categoria.Id" ItemStyle-CssClass="d-none" HeaderStyle-CssClass="d-none" />
                            <asp:BoundField HeaderText="CATEGORIA" DataField="Categoria" ItemStyle-CssClass="" HeaderStyle-CssClass="" />
                            <asp:BoundField HeaderText="MARCA" DataField="Marca" ItemStyle-CssClass="" HeaderStyle-CssClass="" />
                            <asp:BoundField HeaderText="IMAGEN" DataField="ImagenUrl" ItemStyle-CssClass="d-none" HeaderStyle-CssClass="d-none" />
                            <asp:BoundField HeaderText="PRECIO" DataField="Precio" ItemStyle-CssClass="" HeaderStyle-CssClass="" />
                            <asp:CommandField ShowSelectButton="true" HeaderText="EDITAR" SelectText="✍️" ItemStyle-CssClass="" HeaderStyle-CssClass="" />

                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>


        </div>
    </div>



</asp:Content>
