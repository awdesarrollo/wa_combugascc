using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using WA_CombugasCC.Core;

namespace WA_CombugasCC.CallCenter
{
    public partial class TipoServicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public class ajaxResponse
        {
            public bool Result { get; set; }
            public string Message { get; set; }
            public string Data { get; set; }

        }


        public class OperadorClass
        {
            public int id { get; set; }
            public string nombre { get; set; }
            public DateTime? fecha { get; set; }
            public bool? estado { get; set; }
            public OperadorClass(int idz, string nombre, DateTime? fecha, bool? estado)
            {
                this.id = idz;
                this.nombre = nombre;
                this.estado = estado;
                this.fecha = fecha;
            }

        }


        //Cargar datos
        [WebMethod]
        public static ajaxResponse CargarDatos()
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                var agrupacion = from p in context.servicio select p;
                List<OperadorClass> lista = new List<OperadorClass>();
                foreach (var grupo in agrupacion)
                {
                    lista.Add(new OperadorClass(grupo.id_servicio, grupo.descripcion, grupo.alta, grupo.status));
                }
                var jsonSerialiser = new JavaScriptSerializer();
                var json = jsonSerialiser.Serialize(lista);
                Response.Result = true;
                Response.Message = "Bien";
                Response.Data = json;
            }
            catch (Exception ex)
            {
                Response.Result = false;
                Response.Message = "Ha ocurrido un error al agregar zona. " + ex.Message;
                Response.Data = null;
            }
            return Response;
        }//END METODO CARGARDATOS


        //CARGAR UN OPERADOR
        [WebMethod]
        public static ajaxResponse Un(int Id)
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                var agrupacion = from p in context.servicio where p.id_servicio == Id select p;
                List<OperadorClass> lista = new List<OperadorClass>();
                foreach (var grupo in agrupacion)
                {
                    lista.Add(new OperadorClass(grupo.id_servicio, grupo.descripcion, grupo.alta, grupo.status));
                }
                var jsonSerialiser = new JavaScriptSerializer();
                var json = jsonSerialiser.Serialize(lista);
                Response.Result = true;
                Response.Message = "Bien";
                Response.Data = json;
            }
            catch (Exception ex)
            {
                Response.Result = false;
                Response.Message = "Ha ocurrido un error al agregar zona. " + ex.Message;
                Response.Data = null;
            }
            return Response;
        }//END METODO UN OPERADOR


        //GUARDAR OPERADOR
        [WebMethod]
        public static ajaxResponse Guardar(string Nombre, bool Activo)
        {
            ajaxResponse Response = new ajaxResponse();
            servicio objZona = new servicio();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                objZona.descripcion = Nombre;
                objZona.status = Activo;
                objZona.alta = DateTime.Now;
                context.servicio.InsertOnSubmit(objZona);
                context.SubmitChanges();
                OperadorClass zona = new OperadorClass(objZona.id_servicio, Nombre, DateTime.Now, Activo);
                var jsonSerialiser = new JavaScriptSerializer();
                var json = jsonSerialiser.Serialize(zona);

                // Alimentamos Bitacora
                Bitacora b = new Bitacora();
                b.fechahora = DateTime.Now;
                b.id_usuario = ((usuarios)HttpContext.Current.Session["sesionUsuario"]).id_usuario;
                b.modulo = "TipoServicio.aspx";
                b.funcion = "Agregar Servicio";
                b.entidad = json;
                b.detalle = ((usuarios)HttpContext.Current.Session["sesionUsuario"]).username + " - Usuario agrego servicio: " + Nombre;
                ClassBicatora.insertBitacora(b);

                Response.Result = true;
                Response.Message = "Se agrego zona correctamente.";

            }
            catch (Exception ex)
            {
                Response.Result = false;
                Response.Message = "Ha ocurrido un error al agregar zona. " + ex.Message;
                Response.Data = null;
            }
            return Response;
        }//END METODO GUARDAR


        //ACTUALIZAR OPERADOR
        [WebMethod]
        public static ajaxResponse Actualizar(int Id, string Nombre, bool Activo)
        {
            ajaxResponse Response = new ajaxResponse();
            servicio objZona = new servicio();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                objZona = context.servicio.Where(x => x.id_servicio == Id).SingleOrDefault();
                if (objZona != null)
                {
                    Response.Result = true;
                    Response.Message = "Actualizacion Correcta";
                    Response.Data = null;
                    objZona.descripcion = Nombre;
                    objZona.status = Activo;
                    context.SubmitChanges();
                    OperadorClass zona = new OperadorClass(Id, Nombre, objZona.alta, Activo);
                    var jsonSerialiser = new JavaScriptSerializer();
                    var json = jsonSerialiser.Serialize(zona);
                    // Alimentamos Bitacora
                    Bitacora b = new Bitacora();
                    b.fechahora = DateTime.Now;
                    b.id_usuario = ((usuarios)HttpContext.Current.Session["sesionUsuario"]).id_usuario;
                    b.modulo = "TipoServicio.aspx";
                    b.funcion = "Actualizo servicio";
                    b.entidad = json;
                    b.detalle = ((usuarios)HttpContext.Current.Session["sesionUsuario"]).username + " - Usuario actualizo servicio: " + Nombre;
                    ClassBicatora.insertBitacora(b);
                }

            }
            catch (Exception ex)
            {
                Response.Result = false;
                Response.Message = "Ha ocurrido un error al agregar zona. " + ex.Message;
                Response.Data = null;
            }
            return Response;
        }




    }
}