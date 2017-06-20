using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using WA_CombugasCC.Core;

namespace WA_CombugasCC.Admin
{
    public partial class Modulos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        #region Enumerables
        public class ajaxResponse
        {
            public bool Result { get; set; }
            public string Message { get; set; }
            public string Data { get; set; }
        }

        public class menuClass
        {
            public int idmodulo { get; set; }
            public string titulo { get; set; }
            public string url { get; set; }
            public string descripcion { get; set; }
            public bool estatus { get; set; }
            public int idpadre { get; set; }
            public menuClass(int idmodulo, string titulo, string url, string descripcion, bool estatus, int idpadre)
            {
                this.idmodulo = idmodulo;
                this.titulo = titulo;
                this.url = url;
                this.descripcion = descripcion;
                this.estatus = estatus;
                this.idpadre = idpadre;
            }

        }
        #endregion


        #region WebMethods

        [WebMethod(EnableSession = true)]
        public static ajaxResponse CargaPadre()
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                var objModulos = (from modulos in context.modulos
                                  where modulos.id_modulo_padre == 0 && modulos.isactive == true
                                  select modulos).ToList();

                List<menuClass> menu = new List<menuClass>();
                foreach (var grupo in objModulos)
                {
                    menu.Add(new menuClass(grupo.id_modulo, grupo.titulo, grupo.url_modulo, grupo.descripcion, (bool)grupo.isactive, grupo.id_modulo_padre));
                }
                var jsonSerialiser = new JavaScriptSerializer();
                var jsonModulos = jsonSerialiser.Serialize(menu);

                if (jsonModulos != null)
                {
                    Response.Result = true;
                    Response.Message = "";
                    Response.Data = jsonModulos;
                }
                else
                {
                    Response.Result = false;
                    Response.Message = "Error de consulta, verifique por favor.";
                    Response.Data = null;
                }
            }
            catch (Exception ex)
            {
                Response.Result = false;
                Response.Message = "Ha ocurrido un error al cargar. " + ex.Message;
                Response.Data = null;
            }

            return Response;
        }

        [WebMethod(EnableSession = true)]
        public static ajaxResponse CargaModulos()
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                var objModulos = (from modulos in context.modulos
                                  select modulos).ToList();

                List<menuClass> menu = new List<menuClass>();
                foreach (var grupo in objModulos)
                {
                    menu.Add(new menuClass(grupo.id_modulo, grupo.titulo, grupo.url_modulo, grupo.descripcion, (bool)grupo.isactive, grupo.id_modulo_padre));
                }
                var jsonSerialiser = new JavaScriptSerializer();
                var jsonModulos = jsonSerialiser.Serialize(menu);

                if (jsonModulos != null)
                {
                    Response.Result = true;
                    Response.Message = "";
                    Response.Data = jsonModulos;
                }
                else
                {
                    Response.Result = false;
                    Response.Message = "Error de consulta, verifique por favor.";
                    Response.Data = null;
                }
            }
            catch (Exception ex)
            {
                Response.Result = false;
                Response.Message = "Ha ocurrido un error al cargar. " + ex.Message;
                Response.Data = null;
            }

            return Response;
        }


        [WebMethod(EnableSession = true)]
        public static ajaxResponse ObtieneModuloId(int idmodulo)
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                modulo objModulos = (from modulos in context.modulos
                                     where modulos.id_modulo == idmodulo
                                  select modulos).SingleOrDefault();

                menuClass menu = new menuClass(objModulos.id_modulo, objModulos.titulo, objModulos.url_modulo, objModulos.descripcion, (bool)objModulos.isactive, objModulos.id_modulo_padre);
               
                var jsonSerialiser = new JavaScriptSerializer();
                var jsonModulos = jsonSerialiser.Serialize(menu);

                if (jsonModulos != null)
                {
                    Response.Result = true;
                    Response.Message = "";
                    Response.Data = jsonModulos;
                }
                else
                {
                    Response.Result = false;
                    Response.Message = "Error de consulta, verifique por favor.";
                    Response.Data = null;
                }
            }
            catch (Exception ex)
            {
                Response.Result = false;
                Response.Message = "Ha ocurrido un error al cargar. " + ex.Message;
                Response.Data = null;
            }

            return Response;
        }

        [WebMethod(EnableSession = true)]
        public static ajaxResponse EditaModulos(string titulo, string descripcion, string archivo, bool estatus, int idpadre, int idmodulo)
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                modulo objModulo = context.modulos.Where(x => x.id_modulo == idmodulo).SingleOrDefault();
                objModulo.titulo = titulo;
                objModulo.descripcion = descripcion;
                objModulo.url_modulo = archivo;
                objModulo.isactive = estatus;
                objModulo.id_modulo_padre = idpadre;
                context.SubmitChanges();

                Response.Result = true;
                Response.Message = "Éxito";
                Response.Data = null;
            }
            catch (Exception ex)
            {
                Response.Result = false;
                Response.Message = "Ha ocurrido un error al cargar. " + ex.Message;
                Response.Data = null;
            }

            return Response;
        }

        [WebMethod(EnableSession = true)]
        public static ajaxResponse AgregaModulos(string titulo, string descripcion, string archivo, bool estatus, int idpadre)
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                modulo objModulo = new modulo();

                objModulo.titulo = titulo;
                objModulo.descripcion = descripcion;
                objModulo.url_modulo = archivo;
                objModulo.isactive = estatus;
                objModulo.id_modulo_padre = idpadre;
                context.modulos.InsertOnSubmit(objModulo);
                context.SubmitChanges();

                Response.Result = true;
                Response.Message = "Éxito";
                Response.Data = null;


            }
            catch (Exception ex)
            {
                Response.Result = false;
                Response.Message = "Ha ocurrido un error al cargar. " + ex.Message;
                Response.Data = null;
            }

            return Response;
        }

        #endregion

    }
}