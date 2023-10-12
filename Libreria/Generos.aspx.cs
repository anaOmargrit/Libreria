using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Libreria
{
    public partial class Generos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void bt_crear_Click(object sender, EventArgs e)
        {
            try
            {
                if (tb_descripcion.Text != "")
                {
                    ds_generos.Insert();
                    lb_mensaje.Text = "El género se ha creado correctamente.";
                    tb_descripcion.Text = string.Empty;

                }
                else
                {
                    lb_mensaje.Text = "Debe ingresar una descripción.";
                }
            }
            catch(SqlException err) 
            {
                StreamWriter streamWriter = new StreamWriter($"{Server.MapPath(".")}/log.txt", true);
                streamWriter.WriteLine("Ha ocurrido un error al crear un Género: " + err.Message);
                streamWriter.Close();
                lb_mensaje.Text = "Ha ocurrido un error al crear un Género.";
            }
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            lb_mensaje.Text = string.Empty;
        }

        protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            if (e.Exception == null)
            {
                if (e.AffectedRows == 1)
                {
                    lb_mensaje.Text = "El género se ha eliminado correctamente.";
                }
                else
                {
                    lb_mensaje.Text = "Ha ocurrido un error al eliminar el Género.";
                }                
            }            
            else
            {
                StreamWriter streamWriter = new StreamWriter($"{Server.MapPath(".")}/log.txt", true);
                streamWriter.WriteLine("Ha ocurrido un error al eliminar el Género: " + e.Exception.Message);
                streamWriter.Close();
                e.ExceptionHandled = true;
                lb_mensaje.Text = "Ha ocurrido un error al eliminar el Género.";
            }
        }

        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            if (e.Exception == null)
            {
                if (e.AffectedRows == 1)
                {
                    lb_mensaje.Text = "El género se ha actualizado correctamente.";
                }
                else
                {
                    lb_mensaje.Text = "Ha ocurrido un error al actualizar el Género.";
                }                
            }
            else
            {
                StreamWriter streamWriter = new StreamWriter($"{Server.MapPath(".")}/log.txt", true);
                streamWriter.WriteLine("Ha ocurrido un error al actualizar el Género: " + e.Exception.Message);
                streamWriter.Close();
                e.ExceptionHandled = true;
                lb_mensaje.Text = "Ha ocurrido un error al actualizar el Género.";
            }
        }
    }
}