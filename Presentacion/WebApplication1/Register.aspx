<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApplication1.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
        <div class="row g-3 vh-100">
            <div class="col-12 d-flex flex-column justify-content-center align-items-center">
                <div class="d-flex w-100 justify-content-center">
                    <h2 class="align-text-center">Registro de usuario</h2>
                </div>
                <div class="d-flex w-25 flex-column justify-content-center">
                    <asp:Label runat="server" Text="Nombre" CssClass="mt-1"></asp:Label>
                    <asp:TextBox runat="server" ID="txtUsername" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server"
                        ID="rfvUsername"
                        ControlToValidate="txtUsername"
                        ErrorMessage="Ingrese nombre."
                        CssClass="text-danger"
                        Display="Dynamic" />
                    <asp:Label runat="server" Text="Apellido" CssClass="mt-1"></asp:Label>
                    <asp:TextBox runat="server" ID="txtApellido" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server"
                        ID="rfvSurname"
                        ControlToValidate="txtApellido"
                        ErrorMessage="Ingrese apellido."
                        CssClass="text-danger"
                        Display="Dynamic" />

                    <asp:Label runat="server" Text="Correo" CssClass="mt-3"></asp:Label>
                    <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server"
                        ID="rfvEmail"
                        ControlToValidate="txtEmail"
                        ErrorMessage="El correo es obligatorio."
                        CssClass="text-danger"
                        Display="Dynamic" />
                    <asp:RegularExpressionValidator runat="server"
                        ID="regexEmail"
                        ControlToValidate="txtEmail"
                        ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                        ErrorMessage="Ingrese un correo electrónico válido."
                        CssClass="text-danger"
                        Display="Dynamic" />
                    <asp:Label runat="server" Text="Contraseña:" CssClass="mt-3"></asp:Label>
                    <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server"
                        ID="rfvPassword"
                        ControlToValidate="txtPassword"
                        ErrorMessage="La contraseña es obligatoria."
                        CssClass="text-danger"
                        Display="Dynamic" />
                    <div class="d-flex flex-row justify-content-center">
                        <asp:Button runat="server" ID="btnRegister" Text="Registrar" CssClass="btn btn-primary m-1" OnClick="btnRegister_Click" />
                        <asp:Button runat="server" ID="btnVolver" Text="Volver" CssClass="btn btn-secondary m-1" OnClick="btnVolver_Click" CausesValidation="false" />
                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
