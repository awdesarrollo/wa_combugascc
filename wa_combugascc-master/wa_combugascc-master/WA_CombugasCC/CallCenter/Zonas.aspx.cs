using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using WA_CombugasCC.Core;
using System.Web.Script.Serialization;

namespace WA_CombugasCC.CallCenter
{
    public partial class Zonas : System.Web.UI.Page
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
        public static ajaxResponse Guardazona(string Nombre)
        {
            ajaxResponse Response = new ajaxResponse();
            zonas objZona = new zonas();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                objZona.descripcion = Nombre;
                objZona.estado = true;
                context.zonas.InsertOnSubmit(objZona);
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
                var agrupacion = from p in context.zonas select p;
                List<zonaClass> lista=new List<zonaClass>();      
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
                Response.Message = "Ha ocurrido un error al agregar zona. " + ex.Message;
                Response.Data = null;
            }
            return Response;
        }

        [WebMethod]
        public static ajaxResponse Unazona(int Id)
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                var agrupacion = from p in context.zonas where p.id_zona == Id select p;
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
                Response.Message = "Ha ocurrido un error al agregar zona. " + ex.Message;
                Response.Data = null;
            }
            return Response;   
        }
        [WebMethod]
        public static ajaxResponse UnazonaAct(int Id, string Nombre,bool stado)
        {
            ajaxResponse Response = new ajaxResponse();
            zonas objZona = new zonas();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                objZona = context.zonas.Where(x => x.id_zona == Id).SingleOrDefault();
                if (objZona != null)
                {
                    Response.Result = true;
                    Response.Message = "Actualizacion Correcta";
                    Response.Data = null;
                    objZona.descripcion = Nombre;
                    objZona.estado = stado;
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