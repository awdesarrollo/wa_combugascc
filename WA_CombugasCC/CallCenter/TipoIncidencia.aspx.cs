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
    public partial class TipoIncidencia : System.Web.UI.Page
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


        public class TipoClass
        {
            public int id { get; set; }
            public string nombre { get; set; }
            public string foto { get; set; }
            public DateTime? fecha { get; set; }
            public bool? estado { get; set; }
            public TipoClass(int idz, string nombre, DateTime? fecha, bool? estado,string foto)
            {
                this.id = idz;
                this.nombre = nombre;
                this.estado = estado;
                this.fecha = fecha;
                this.foto = foto;
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
                var agrupacion = from p in context.Incidencias select p;
                List<TipoClass> lista = new List<TipoClass>();
                foreach (var grupo in agrupacion)
                {
                    lista.Add(new TipoClass(grupo.id_incidencia, grupo.descripcion, grupo.alta, grupo.status,grupo.foto));
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
                Response.Message = "Ha ocurrido un error al agregar." + ex.Message;
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
                var agrupacion = from p in context.Incidencias where p.id_incidencia == Id select p;
                List<TipoClass> lista = new List<TipoClass>();
                foreach (var grupo in agrupacion)
                {
                    lista.Add(new TipoClass(grupo.id_incidencia, grupo.descripcion, grupo.alta, grupo.status,grupo.foto));
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
                Response.Message = "Ha ocurrido un error al agregar. " + ex.Message;
                Response.Data = null;
            }
            return Response;
        }//END METODO UN OPERADOR


        //GUARDAR OPERADOR
        [WebMethod]
        public static ajaxResponse Guardar(string Nombre, bool Activo)
        {
            ajaxResponse Response = new ajaxResponse();
            Incidencias objZona = new Incidencias();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                objZona.descripcion = Nombre;
                objZona.status = Activo;
                objZona.alta = DateTime.Now;
                context.Incidencias.InsertOnSubmit(objZona);
                context.SubmitChanges();
                TipoClass zona = new TipoClass(objZona.id_incidencia, Nombre, DateTime.Now, Activo,"");
                var jsonSerialiser = new JavaScriptSerializer();
                var json = jsonSerialiser.Serialize(zona);

                // Alimentamos Bitacora
                Bitacora b = new Bitacora();
                b.fechahora = DateTime.Now;
                b.id_usuario = ((usuarios)HttpContext.Current.Session["sesionUsuario"]).id_usuario;
                b.modulo = "TipoIncidencia.aspx";
                b.funcion = "Agregar Tipo de incidencia";
                b.entidad = json;
                b.detalle = ((usuarios)HttpContext.Current.Session["sesionUsuario"]).username + " - Usuario agrego tipo de incidencia: " + Nombre;
                ClassBicatora.insertBitacora(b);

                Response.Result = true;
                Response.Message = "Se agrego correctamente.";

            }
            catch (Exception ex)
            {
                Response.Result = false;
                Response.Message = "Ha ocurrido un error al agregar. " + ex.Message;
                Response.Data = null;
            }
            return Response;
        }//END METODO GUARDAR


        //ACTUALIZAR OPERADOR
        [WebMethod]
        public static ajaxResponse Actualizar(int Id, string Nombre, bool Activo)
        {
            ajaxResponse Response = new ajaxResponse();
            Incidencias objZona = new Incidencias();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                objZona = context.Incidencias.Where(x => x.id_incidencia == Id).SingleOrDefault();
                if (objZona != null)
                {
                    Response.Result = true;
                    Response.Message = "Actualizacion Correcta";
                    Response.Data = null;
                    objZona.descripcion = Nombre;
                    objZona.status = Activo;

                    context.SubmitChanges();
                    TipoClass zona = new TipoClass(Id, Nombre, objZona.alta, Activo,"");
                    var jsonSerialiser = new JavaScriptSerializer();
                    var json = jsonSerialiser.Serialize(zona);
                    // Alimentamos Bitacora
                    Bitacora b = new Bitacora();
                    b.fechahora = DateTime.Now;
                    b.id_usuario = ((usuarios)HttpContext.Current.Session["sesionUsuario"]).id_usuario;
                    b.modulo = "TipoIncidencia.aspx";
                    b.funcion = "Actualizo tipo de incidencia";
                    b.entidad = json;
                    b.detalle = ((usuarios)HttpContext.Current.Session["sesionUsuario"]).username + " - Usuario actualizo tipo de incidencia: " + Nombre;
                    ClassBicatora.insertBitacora(b);
                }

            }
            catch (Exception ex)
            {
                Response.Result = false;
                Response.Message = "Ha ocurrido un error al agregar. " + ex.Message;
                Response.Data = null;
            }
            return Response;
        }


    }
}