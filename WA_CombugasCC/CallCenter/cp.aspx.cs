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
    public partial class cp : System.Web.UI.Page
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
        public class cpclass
        {
           

            public int idz { get; set; }
            public string nombre { get; set; }
            public string zona { get; set; }
            public string std { get; set; }
            public bool? estado { get; set; }
            public int? zonaid { get; set; }
            public int? stdid { get; set; }
            public cpclass(int idz, string nombre, string std, string zona, bool? estado, int? stdid, int? zonaid)
            {
                this.idz = idz;
                this.nombre = nombre;
                this.zona = zona;
                this.std = std;
                this.estado = estado;
                this.stdid = stdid;
                this.zonaid = zonaid;
            }

         
        }

        [WebMethod]
        public static ajaxResponse CargarDatos()//tabla
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                var agrupacion = from p in context.cp join z in context.zonas on p.id_zona equals z.id_zona join e in context.estados on p.id_estado equals e.id_estado  select new { p.id_cp, p.descripcion, Est = e.descripcion, zona = z.descripcion, p.status };
                List<cpclass> lista = new List<cpclass>();
                foreach (var grupo in agrupacion)
                {
                    lista.Add(new cpclass(grupo.id_cp, grupo.descripcion, grupo.Est, grupo.zona, grupo.status, 0, 0));
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
        public static ajaxResponse GuardaCP(string Nombre, int Zona, int Edo)
        {
            ajaxResponse Response = new ajaxResponse();
            Core.cp objEst = new Core.cp();
           
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                
                objEst.descripcion = Nombre;
                objEst.status = true;
                objEst.id_estado = Edo;
                objEst.id_zona = Edo;
                context.cp.InsertOnSubmit(objEst);
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
        public static ajaxResponse UnacdAct(int Id, int idZ, int idE, string Nombre, bool stado)//Actualizar Ciudad
        {
            ajaxResponse Response = new ajaxResponse();
            Core.cp objZona = new Core.cp();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                objZona = context.cp.Where(x => x.id_cp == Id).SingleOrDefault();
                if (objZona != null)
                {
                    Response.Result = true;
                    Response.Message = "Actualizacion Correcta";
                    Response.Data = null;
                    objZona.id_zona = idZ;
                    objZona.id_estado = idE;
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
        }//end
        [WebMethod]
        public static ajaxResponse Uncp(int Id)
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                var agrupacion = from p in context.cp
                                 join est in context.estados on p.id_estado equals est.id_estado
                                 join zn in context.zonas on est.id_zona equals zn.id_zona
                                 where p.id_cp == Id
                                 select new { p.id_cp, p.descripcion, esta = est.descripcion, zon = zn.descripcion, p.status, p.id_zona, p.id_estado };
                List<cpclass> lista = new List<cpclass>();
                foreach (var grupo in agrupacion)
                {
                    lista.Add(new cpclass(grupo.id_cp, grupo.descripcion, grupo.esta, grupo.zon, grupo.status, grupo.id_estado, grupo.id_zona));
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
    }
}