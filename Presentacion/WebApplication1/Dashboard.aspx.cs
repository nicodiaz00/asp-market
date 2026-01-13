using System;
using System.Collections.Generic;
using System.Configuration;
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
            ddlCampo.Items.Add(new ListItem("Seleccione...", "Seleccione"));
            ddlCampo.Items.Add(new ListItem("Codigo", "Codigo"));
            ddlCampo.Items.Add(new ListItem("Nombre", "Nombre"));
            ddlCampo.Items.Add(new ListItem("Precio", "Precio"));
        }

        private void configurarBusquedaAvanzada(bool estadoAvanzado)
        {

            ddlCampo.Enabled = estadoAvanzado;
            ddlCriterio.Enabled = estadoAvanzado;
            txtFiltro.Enabled = estadoAvanzado;
            btnBuscarAvanzado.Enabled = estadoAvanzado;
            txtBusqueda.Enabled = !estadoAvanzado;
            btnBuscar.Enabled = !estadoAvanzado;
            txtFiltro.Text = "";


        }
        private void actualizarCriterio(string campo)
        {
            ddlCriterio.Items.Clear();
            txtBusqueda.Text = "";
            txtFiltro.Text = "";

            // 1. Lógica para TEXTO
            if (campo == "Codigo" || campo == "Nombre")
            {
                txtFiltro.TextMode = TextBoxMode.SingleLine;

                ddlCriterio.Items.Add("Empieza");
                ddlCriterio.Items.Add("Contiene");
                ddlCriterio.Items.Add("Termina");

                // ACTIVAR validador de letras, DESACTIVAR el de números
                regexLetras.Enabled = true;
                regexNumeros.Enabled = false;
            }
            // 2. Lógica para NÚMEROS
            else
            {
                txtFiltro.TextMode = TextBoxMode.Number;

                ddlCriterio.Items.Add("Igual a");
                ddlCriterio.Items.Add("Mayor a");
                ddlCriterio.Items.Add("Menor a");

                // DESACTIVAR validador de letras, ACTIVAR el de números
                regexLetras.Enabled = false;
                regexNumeros.Enabled = true;
            }
        }
        private List<Articulo> filtrarArticulos(string campo, string criterio, string filtro)
        {
            ArticuloNegocio negocio = new ArticuloNegocio();
            List<Articulo> listaFiltrada = new List<Articulo>();

            return negocio.filtrarArticulo(campo, criterio, filtro);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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

        protected void ddlCampo_SelectedIndexChanged(object sender, EventArgs e)
        {
            string campoSeleccionado = ddlCampo.SelectedValue;
            actualizarCriterio(campoSeleccionado);
        }

        protected void btnBuscarAvanzado_Click(object sender, EventArgs e)
        {
            string campo = ddlCampo.SelectedValue;
            string criterio = ddlCriterio.SelectedValue;
            string filtro = txtFiltro.Text;

            try
            {
                List<Articulo> listaFiltrada = filtrarArticulos(campo, criterio, filtro);
                dvgArticulo.DataSource = listaFiltrada;
                dvgArticulo.DataBind();
            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
            }
        }
    }
}