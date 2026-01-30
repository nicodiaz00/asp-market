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
        private string urlImagen = "https://tse3.mm.bing.net/th/id/OIP.3Wpv91fvc8FukJX-gslWbgHaHa?rs=1&pid=ImgDetMain&o=7&rm=3";
        private void listarMarcas()
        {
            MarcaNegocio marcaNegocio = new MarcaNegocio();
            
                ddMarca.DataSource = marcaNegocio.listarMarcas();
                ddMarca.DataTextField = "DescripcionMarca";
                ddMarca.DataValueField = "Id";
                ddMarca.DataBind();
                        
        }
        private void listarCategorias()
        {
            CategoriaNegocio categoriaNegocio = new CategoriaNegocio();
                ddCategoria.DataSource = categoriaNegocio.listarCategoria();
                ddCategoria.DataTextField = "DescripcionCategoria";
                ddCategoria.DataValueField = "Id";
                ddCategoria.DataBind();

        }
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

                if (!string.IsNullOrEmpty(articulo.ImagenUrl) && (articulo.ImagenUrl.StartsWith("http") || articulo.ImagenUrl.StartsWith("https")))
                {
                    txtImagen.Text = articulo.ImagenUrl;
                    imgArticulo.ImageUrl = articulo.ImagenUrl;

                }
                else
                {
                    txtImagen.Text = urlImagen;
                    imgArticulo.ImageUrl = urlImagen;
                }
                   
                ddMarca.SelectedValue = articulo.Marca.Id.ToString();
                ddMarca.Text = articulo.Marca.DescripcionMarca;
                ddCategoria.SelectedValue = articulo.Categoria.Id.ToString();
                ddCategoria.Text = articulo.Categoria.DescripcionCategoria;

            }
            
        }
        private void editarArticulo()
        {
            string idArticulo = Request.QueryString["id"];
            ArticuloNegocio articuloNegocio = new ArticuloNegocio();
            articuloNegocio.editarArticulo(txtCodigo.Text, txtNombre.Text,txtDescripcion.Text,int.Parse(ddMarca.SelectedValue), int.Parse(ddCategoria.SelectedValue), txtImagen.Text, decimal.Parse(txtPrecio.Text),int.Parse(idArticulo));
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
                        
                        listarMarcas();
                        listarCategorias();
                        CargarArticuloEdicion(idArticulo);
                    }
                }
                catch (Exception ex)
                {

                    Session.Add("error", ex.ToString());
                }
                
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                editarArticulo();
                Response.Redirect("Default.aspx", false);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx",false);
        }
    }
}