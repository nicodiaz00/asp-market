using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Register : System.Web.UI.Page
    {
        private string urlPerfil = "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png";
        private Usuario usuarioNuevo(string nombre, string apellido, string email, string pass, string urlImagenPerfil)
        {
            Usuario nuevoUsuario = new Usuario();
            nuevoUsuario.Nombre = nombre;
            nuevoUsuario.Apellido = apellido;
            nuevoUsuario.Email = email;
            nuevoUsuario.Pass = pass;
            nuevoUsuario.UrlImagen = urlImagenPerfil;
            return nuevoUsuario;
            // Implementar la lógica para registrar un nuevo usuario
        }
        private void limpiarCampos()
        {
            txtUsername.Text = "";
            txtApellido.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
           UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
            try
            {
                usuarioNegocio.registrarUsuario(usuarioNuevo(txtUsername.Text, txtApellido.Text, txtEmail.Text, txtPassword.Text, urlPerfil));
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            limpiarCampos();
            Response.Redirect("Default.aspx");
        }
    }
}