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
    public partial class Default : System.Web.UI.Page
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
            public int idpadre { get; set; }
            public menuClass(int idmodulo, string titulo, string url, int idpadre)
            {
                this.idmodulo = idmodulo;
                this.titulo = titulo;
                this.url = url;
                this.idpadre = idpadre;
            }

        }
        #endregion

        #region WebMethods

        [WebMethod(EnableSession = true)]
        public static ajaxResponse CargaMenuPadre()
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                var objModulos = (from modulos in context.modulos
                              join permisos in context.permisos on modulos.id_modulo equals permisos.id_modulo
                              where permisos.id_rol == ((usuario)HttpContext.Current.Session["sesionUsuario"]).id_rol 
                              && modulos.id_modulo_padre == 0 && modulos.isactive == true
                              select modulos).ToList();

                List<menuClass> menu = new List<menuClass>();
                foreach (var grupo in objModulos)
                {
                    menu.Add(new menuClass(grupo.id_modulo, grupo.titulo, grupo.url_modulo, grupo.id_modulo_padre));
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
                    Response.Message = "El Rol de usuario no cuenta con modulos visibles, verifique por favor.";
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
        public static ajaxResponse CargaMenuHijo(int idmodulo)
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                var objModulos = (from modulos in context.modulos
                                  join permisos in context.permisos on modulos.id_modulo equals permisos.id_modulo
                                  where permisos.id_rol == ((usuario)HttpContext.Current.Session["sesionUsuario"]).id_rol
                                  && modulos.id_modulo_padre == idmodulo && modulos.isactive == true
                                  select modulos).ToList();

                List<menuClass> menu = new List<menuClass>();
                foreach (var grupo in objModulos)
                {
                    menu.Add(new menuClass(grupo.id_modulo, grupo.titulo, grupo.url_modulo, grupo.id_modulo_padre));
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
                    Response.Message = "El Rol de usuario no cuenta con modulos visibles, verifique por favor.";
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

        #endregion


    }
}