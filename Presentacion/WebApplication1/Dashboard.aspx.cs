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

        private void CargarCampos()
        {
            ddlCampo.Items.Clear();
            ddlCampo.Items.Add(new ListItem("Codigo", "Codigo"));
            ddlCampo.Items.Add(new ListItem("Nombre", "Nombre"));
            ddlCampo.Items.Add(new ListItem("Precio", "Precio"));
        }

        private void configurarBusquedaAvanzada(bool estadoAvanzado)
        {
            // Si estadoAvanzado es TRUE, habilitamos los combos
            ddlCampo.Enabled = estadoAvanzado;
            ddlCriterio.Enabled = estadoAvanzado;
            txtFiltro.Enabled = estadoAvanzado;
            btnBuscarAvanzado.Enabled = estadoAvanzado;

            // La búsqueda simple funciona al revés (si es avanzada, la simple se apaga)
            txtBusqueda.Enabled = !estadoAvanzado;
            btnBuscar.Enabled = !estadoAvanzado;
            
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                dvgArticulo.DataSource = new ArticuloNegocio().listarArticulo();
                dvgArticulo.DataBind();
                CargarCampos();
                configurarBusquedaAvanzada(false);

                // Cargar datos iniciales si es necesario
            }
        }

        protected void dvgArticulo_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void dvgArticulo_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void checkBusquedaAvanzada_CheckedChanged(object sender, EventArgs e)
        {
            configurarBusquedaAvanzada(checkBusquedaAvanzada.Checked);
        }
    }
}