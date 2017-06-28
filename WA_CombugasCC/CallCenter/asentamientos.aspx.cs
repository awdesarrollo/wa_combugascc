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
    public partial class asentamientos : System.Web.UI.Page
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
        public class zonaClass
        {
            public int idz { get; set; }
            public string nombre { get; set; }
            public bool estado { get; set; }
            public zonaClass(int idz, string nombre, bool estado)
            {
                this.idz = idz;
                this.nombre = nombre;
                this.estado = estado;
            }

        }
        [WebMethod]
        public static ajaxResponse Guarda(string Nombre)
        {
            ajaxResponse Response = new ajaxResponse();
            tipo_asentamiento objZona = new tipo_asentamiento();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                objZona.descripcion = Nombre;
                objZona.status = true;
                context.tipo_asentamiento.InsertOnSubmit(objZona);
                context.SubmitChanges();

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
        }
        // Retornar listado de clientes
        [WebMethod]
        public static ajaxResponse CargarDatos()
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                var agrupacion = from p in context.tipo_asentamiento select p;
                List<zonaClass> lista = new List<zonaClass>();
                foreach (var grupo in agrupacion)
                {
                    lista.Add(new zonaClass(grupo.id_tipo, grupo.descripcion, grupo.status));
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
        }

        [WebMethod]
        public static ajaxResponse Un(int Id)
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                var agrupacion = from p in context.tipo_asentamiento where p.id_tipo == Id select p;
                List<zonaClass> lista = new List<zonaClass>();
                foreach (var grupo in agrupacion)
                {
                    lista.Add(new zonaClass(grupo.id_tipo, grupo.descripcion, grupo.status));
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
        }
        [WebMethod]
        public static ajaxResponse UnazonaAct(int Id, string Nombre, bool stado)
        {
            ajaxResponse Response = new ajaxResponse();
            tipo_asentamiento objZona = new tipo_asentamiento();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                objZona = context.tipo_asentamiento.Where(x => x.id_tipo == Id).SingleOrDefault();
                if (objZona != null)
                {
                    Response.Result = true;
                    Response.Message = "Actualizacion Correcta";
                    Response.Data = null;
                    objZona.descripcion = Nombre;
                    objZona.status = stado;
                    context.SubmitChanges();
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