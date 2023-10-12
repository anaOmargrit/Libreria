using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Libreria
{
    public partial class Libros : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void bt_actualizar_Click(object sender, EventArgs e)
        {
            try
            {                
                if (tb_titulo.Text != "" && ddl_generos.SelectedIndex >= 0)
                {
                    ds_libros.Update();
                    lb_mensaje.Text = "El libro se ha actualizado correctamente.";
                    tb_titulo.Text = string.Empty;
                    ddl_generos.SelectedIndex = 0;
                }
                else
                {
                    lb_mensaje.Text = "Debe ingresar un título y seleccionar un género para actualizar el libro.";
                }
            }
            catch (SqlException err)
            {
                StreamWriter streamWriter = new StreamWriter($"{Server.MapPath(".")}/log.txt", true);
                streamWriter.WriteLine("Ha ocurrido un error al actualizar el Libro: " + tb_titulo.Text + " " + err.Message);
                streamWriter.Close();
                lb_mensaje.Text = "Ha ocurrido un error al actualizar el Libro.";
            }
        }

        protected void bt_crear_Click(object sender, EventArgs e)
        {
            try
            {
                if (tb_titulo.Text != "" && ddl_generos.SelectedIndex >= 0)
                {
                    ds_libros.Insert();
                    lb_mensaje.Text = "El libro se ha creado correctamente.";
                    tb_titulo.Text = string.Empty;
                    ddl_generos.SelectedIndex = 0;
                }
                else
                {
                    lb_mensaje.Text = "Debe ingresar un título y seleccionar un género para crear un libro.";
                }
            }
            catch (SqlException err)
            {
                StreamWriter streamWriter = new StreamWriter($"{Server.MapPath(".")}/log.txt", true);
                streamWriter.WriteLine("Ha ocurrido un error al crear el Libro: " + err.Message);
                streamWriter.Close();
                lb_mensaje.Text = "Ha ocurrido un error al crear el Libro.";
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                tb_titulo.Text = GridView1.SelectedRow.Cells[1].Text;
                ddl_generos.SelectedValue = GridView1.SelectedRow.Cells[2].Text;
                lb_mensaje.Text = string.Empty;
            }
            catch (System.Exception err)
            {
                StreamWriter streamWriter = new StreamWriter($"{Server.MapPath(".")}/log.txt", true);
                streamWriter.WriteLine("Ha ocurrido un error al recuperar los datos del Libro: " + err.Message);
                streamWriter.Close();
                lb_mensaje.Text = "Ha ocurrido un error al recuperar los datos del Libro.";
            }
        }

        protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            if (e.Exception == null)
            {
                if (e.AffectedRows == 1)
                {
                    lb_mensaje.Text = "El libro se ha eliminado correctamente.";
                }
                else
                {
                    lb_mensaje.Text = "Ha ocurrido un error al eliminar el Libro.";
                }                
            }
            else
            {
                StreamWriter streamWriter = new StreamWriter($"{Server.MapPath(".")}/log.txt", true);
                streamWriter.WriteLine("Ha ocurrido un error al eliminar el Libro: " + e.Exception.Message);
                streamWriter.Close();
                e.ExceptionHandled = true;
                lb_mensaje.Text = "Ha ocurrido un error al eliminar el Libro.";
            }
            
        }
    }
}