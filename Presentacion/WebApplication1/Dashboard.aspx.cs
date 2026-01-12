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

            if(regexValidator != null)
            {
                regexValidator.Enabled = estadoAvanzado;
            }
            if(regexValidator != null)
            {
                reqValidator.Enabled = estadoAvanzado;
            }
            
        }
        private void actualizarCriterio(string campo)
        {
            ddlCriterio.Items.Clear();
            txtBusqueda.Text = "";
            txtFiltro.Text = "";

            if (campo == "Codigo" || campo == "Nombre")
            {
                txtFiltro.TextMode = TextBoxMode.SingleLine;
                if (regexValidator != null)
                {
                    // Preferir una expresión real. ".*" acepta todo; si no quieres validar, deshabilita el validador.
                    regexValidator.ValidationExpression = @"^[\p{L}\p{N} ]+$";
                    regexValidator.ErrorMessage = "Solo se permiten números y letras.";
                    regexValidator.Enabled = true;
                }
                ddlCriterio.Items.Add("Empieza");
                ddlCriterio.Items.Add("Contiene");
                ddlCriterio.Items.Add("Termina");
            }
            else
            {
                if (regexValidator != null)
                {
                    // Deshabilitar validación cuando no corresponde
                    regexValidator.Enabled = true;
                    //txtFiltro.TextMode = System.Web.UI.WebControls.TextBoxMode.Number;
                    txtFiltro.TextMode = TextBoxMode.Number;
                    regexValidator.ValidationExpression = "^[0-9]+(\\.[0-9]+)?$";
                    regexValidator.ErrorMessage = "Solo se permiten números y puntos.";
                }
                ddlCriterio.Items.Add("Igual a");
                ddlCriterio.Items.Add("Mayor a");
                ddlCriterio.Items.Add("Menor a");
            }
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

        protected void ddlCampo_SelectedIndexChanged(object sender, EventArgs e)
        {
            string campoSeleccionado = ddlCampo.SelectedValue;
            actualizarCriterio(campoSeleccionado);
        }
    }
}