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
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                dvgArticulo.DataSource = new ArticuloNegocio().listarArticulo();
                dvgArticulo.DataBind();
                // Cargar datos iniciales si es necesario
            }
        }

        protected void dvgArticulo_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void dvgArticulo_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }
    }
}