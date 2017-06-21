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
    public partial class Usuarios : System.Web.UI.Page
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

        public class usuariosClass
        {
            public int idusuario { get; set; }
            public string usuario { get; set; }
            public string password { get; set; }
            public string nombre { get; set; }
            public string rol { get; set; }
            public bool estatus { get; set; }
            public int idrol { get; set; }
            public string ultimoacceso { get; set; }
            public usuariosClass(int idusuario, string usuario, string password, string nombre, string rol, bool estatus, int idrol, string ultimoacceso)
            {
                this.idusuario = idusuario;
                this.usuario = usuario;
                this.password = password;
                this.nombre = nombre;
                this.rol = rol;
                this.estatus = estatus;
                this.idrol = idrol;
                this.ultimoacceso = ultimoacceso;
            }

        }

        #endregion


        #region WebMethods

        [WebMethod(EnableSession = true)]
        public static ajaxResponse CargaUsuarios()
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                var objUsuarios = (from usuarios in context.usuarios
                                  select usuarios).ToList();

                List<usuariosClass> users = new List<usuariosClass>();
                foreach (var user in objUsuarios)
                {
                    users.Add(new usuariosClass(user.id_usuario, user.username, user.passwords, user.nombre, user.role.descripcion, (bool)user.isactive, (int)user.id_rol, user.horaultimoacceso.Value.ToLongDateString()));
                }
                var jsonSerialiser = new JavaScriptSerializer();
                var jsonUsuarios = jsonSerialiser.Serialize(users);

                if (jsonUsuarios != null)
                {
                    Response.Result = true;
                    Response.Message = "";
                    Response.Data = jsonUsuarios;
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

        #endregion
    }
}