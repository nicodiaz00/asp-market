using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace WebApplication1
{
    public partial class _Default : Page
    {
        List<Articulo> listaArticulos { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                ArticuloNegocio negocio = new ArticuloNegocio();
                listaArticulos = negocio.listarArticulo();
                repArticulo.DataSource = listaArticulos;
                repArticulo.DataBind();


            }
        }

        protected void btnIdArticulo_Click(object sender, EventArgs e)
        {

        }

        protected void btnFavorito_Click(object sender, EventArgs e)
        {

        }
    }
}