using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;

namespace WebApplication1
{
    public partial class Edit : System.Web.UI.Page
    {
        private void CargarArticuloEdicion(string idArticulo)
        {
            ArticuloNegocio articuloNegocio = new ArticuloNegocio();
            Articulo articulo = articuloNegocio.seleccionarArticulo(idArticulo);
            if ( articulo != null)
            {
                txtCodigo.Text = articulo.Codigo;
                txtNombre.Text = articulo.Nombre;
                txtDescripcion.Text = articulo.Descripcion;
                txtPrecio.Text = articulo.Precio.ToString();
                txtImagen.Text= articulo.ImagenUrl;
                imgArticulo.ImageUrl = articulo.ImagenUrl;
                


            }
            


        }
        protected void Page_Load(object sender, EventArgs e)
        {
          

            if (!IsPostBack)
            {
                try
                {
                    string idArticulo = Request.QueryString["id"];
                    if (!string.IsNullOrEmpty(idArticulo))
                    {
                        CargarArticuloEdicion(idArticulo);
                    }
                }
                catch (Exception ex)
                {

                    throw;
                }
                
            }
        }
    }
}