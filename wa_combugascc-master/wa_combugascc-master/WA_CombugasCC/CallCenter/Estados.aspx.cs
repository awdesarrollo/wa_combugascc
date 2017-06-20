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
    public partial class Estados : System.Web.UI.Page
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
        public class EstadoClass
        {
            public int idz { get; set; }
            public string nombre { get; set; }
            public string zona { get; set; }
            public bool estado { get; set; }
            public EstadoClass(int idz,string nombre, string zona, bool estado)
            {
                this.idz = idz;
                this.nombre = nombre;
                this.zona = zona;
                this.estado = estado;
            }

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
        public static ajaxResponse CargarDatos()
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                var agrupacion = from p in context.estados join z in context.zonas on p.id_zona equals z.id_zona select new { p.id_estado,p.descripcion,zona=z.descripcion,p.status };       
                List<EstadoClass> lista = new List<EstadoClass>();
                foreach (var grupo in agrupacion)
                {
                    lista.Add(new EstadoClass(grupo.id_estado, grupo.descripcion, grupo.zona, grupo.status));
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
                Response.Message = "Ha ocurrido un error al agregar estado. " + ex.Message;
                Response.Data = null;
            }
            return Response;
        }
        [WebMethod]
        public static ajaxResponse CargarDatosZonas()
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                var agrupacion = from p in context.zonas select p;
                List<zonaClass> lista = new List<zonaClass>();
                foreach (var grupo in agrupacion)
                {
                    lista.Add(new zonaClass(grupo.id_zona, grupo.descripcion, grupo.estado));
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
                Response.Message = "Ha ocurrido un error al agregar estado. " + ex.Message;
                Response.Data = null;
            }
            return Response;
        }

        [WebMethod]
        public static ajaxResponse GuardaEstado(string Nombre,int Zona)
        {
            ajaxResponse Response = new ajaxResponse();
            estados objEst = new estados();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                objEst.id_zona = Zona;
                objEst.descripcion = Nombre;
                objEst.status = true;
                context.estados.InsertOnSubmit(objEst);
                context.SubmitChanges();
                Response.Result = true;
                Response.Message = "Se agrego estado correctamente.";
                Response.Data = null;
            }
            catch (Exception ex)
            {
                Response.Result = false;
                Response.Message = "Ha ocurrido un error al agregar estado. " + ex.Message;
                Response.Data = null;
            }
            return Response;
        }//end
        [WebMethod]
        public static ajaxResponse Unaestado(int Id)
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                var agrupacion = from p in context.estados join z in context.zonas on p.id_zona equals z.id_zona where p.id_estado == Id select new { p.id_estado, p.descripcion, zona = z.descripcion, p.status };
                List<EstadoClass> lista = new List<EstadoClass>();
                foreach (var grupo in agrupacion)
                {
                    lista.Add(new EstadoClass(grupo.id_estado, grupo.descripcion, grupo.zona, grupo.status));
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
                Response.Message = "Ha ocurrido un error al agregar estado. " + ex.Message;
                Response.Data = null;
            }
            return Response;
        }//end
        [WebMethod]
        public static ajaxResponse UnestadoAct(int Id,int idZ, string Nombre, bool stado)
        {
            ajaxResponse Response = new ajaxResponse();
            estados objZona = new estados();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                objZona = context.estados.Where(x => x.id_estado == Id).SingleOrDefault();
                if (objZona != null)
                {
                    Response.Result = true;
                    Response.Message = "Actualizacion Correcta";
                    Response.Data = null;
                    objZona.id_zona = idZ;
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