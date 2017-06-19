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
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["sesionUsuario"] == null)
            {
                Response.Redirect("~/");
            }
            usuario objUsuario = (usuario)Session["sesionUsuario"];
            if (objUsuario.id_rol != 1)
            {
                Response.Redirect("~/CallCenter/");
            }
        }

        public class ajaxResponse
        {
            public bool Result { get; set; }
            public string Message { get; set; }
            public string Data { get; set; }
        }


        #region WebMethods

        [WebMethod(EnableSession = true)]
        public static ajaxResponse CargaMenu(string usuario, string password)
        {
            ajaxResponse Response = new ajaxResponse();
            List<modulo> objModulos = null;
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                objModulos = (from modulos in context.modulos
                              join permisos in context.permisos on modulos.id_modulo equals permisos.id_modulo
                              where permisos.id_rol == ((usuario)HttpContext.Current.Session["sesionUsuario"]).id_rol 
                              select modulos).ToList();

                if (objModulos != null)
                {
                    JavaScriptSerializer jss = new JavaScriptSerializer();
                    string jsonModulos = jss.Serialize(objModulos);

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