using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
<<<<<<< HEAD
=======
<<<<<<< HEAD
using System.Data;
using System.Web.Services;
using System.Web.Script.Services;
using WA_CombugasCC.Core;
=======
using System.Web.Services;
using System.Data;
using System.Web.Script.Services;
>>>>>>> master
>>>>>>> Eduardo


namespace WA_CombugasCC 
{
    public partial class Default : System.Web.UI.Page
    {
        

        public class ajaxResponse
        {
            public bool Result { get; set; }
            public string Message { get; set; }
            public string Data { get; set; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        #region WebMethods

        [WebMethod(EnableSession = true)]
        public static ajaxResponse Login(string usuario, string password)
        {
            ajaxResponse Response = new ajaxResponse();
            usuario objUsuario = null;
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                objUsuario = context.usuarios.Where(x => x.username == usuario && x.passwords == password).SingleOrDefault();


                if (objUsuario != null) {
                    if(objUsuario.isactive) {

                        Response.Result = true;
                        Response.Message = "Acceso Correcto";
                        Response.Data = null;


                        objUsuario.horaultimoacceso = DateTime.Now;
                        objUsuario.userisonline = true;
                        HttpContext.Current.Session["sesionUsuario"] = objUsuario;
                        context.SubmitChanges();

                    } else {
                        Response.Result = false;
                        Response.Message = "El usuario de acceso no esta activo, verifique por favor.";
                        Response.Data = null;
                    }
                } else {
                    Response.Result = false;
                    Response.Message = "Datos de Acceso incorrectos, verifique por favor.";
                    Response.Data = null;
                }
            }
            catch (Exception ex)
            {
                Response.Result = false;
                Response.Message = "Ha ocurrido un error al iniciar la sesión del usuario. " + ex.Message;
                Response.Data = null;
            }

            return Response;
        }

        #endregion

    }
}