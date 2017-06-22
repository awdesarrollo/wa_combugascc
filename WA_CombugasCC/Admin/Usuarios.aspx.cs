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
                    string fechaultimo = (user.horaultimoacceso != null ? user.horaultimoacceso.Value.ToLongDateString() : "");
                    users.Add(new usuariosClass(user.id_usuario, user.username, user.passwords, user.nombre, user.role.descripcion, (bool)user.isactive, (int)user.id_rol, fechaultimo));
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

        [WebMethod(EnableSession = true)]
        public static ajaxResponse ObtieneUsuarioId(int idusuario)
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                usuario objUsuario = (from usuario in context.usuarios
                                     where usuario.id_usuario == idusuario
                                     select usuario).SingleOrDefault();

                usuariosClass user = new usuariosClass(objUsuario.id_usuario, objUsuario.username, objUsuario.passwords, objUsuario.nombre, objUsuario.role.descripcion, (bool)objUsuario.isactive, (int)objUsuario.id_rol, objUsuario.horaultimoacceso.Value.ToLongDateString());

                var jsonSerialiser = new JavaScriptSerializer();
                var jsonUsuario = jsonSerialiser.Serialize(user);

                if (jsonUsuario != null)
                {
                    Response.Result = true;
                    Response.Message = "";
                    Response.Data = jsonUsuario;
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
        public static ajaxResponse EditaUsuarios(string usuario, string password, string nombre, bool estatus, int idrol, int idusuario)
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();

                var entityExist = context.usuarios.Where(x => x.username == usuario && x.id_usuario != idusuario).SingleOrDefault();

                if (entityExist != null) // Duplicidad
                {
                    Response.Result = false;
                    Response.Message = "Ya se tiene un usuario registrado con este acceso. ";
                    Response.Data = null;
                }
                else
                {
                    usuario user = context.usuarios.Where(x => x.id_usuario == idusuario).SingleOrDefault();
                    user.username = usuario;
                    user.passwords = password;
                    user.nombre = nombre;
                    user.id_rol = idrol;
                    user.isactive = estatus;
                    context.SubmitChanges();

                    Response.Result = true;
                    Response.Message = "Éxito";
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
        public static ajaxResponse AgregaUsuarios(string usuario, string password, string nombre, bool estatus, int idrol)
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();

                var entityExist = context.usuarios.Where(x => x.username == usuario).SingleOrDefault();

                if (entityExist != null) // Duplicidad
                {
                    Response.Result = false;
                    Response.Message = "Ya se tiene un usuario registrado con este acceso. ";
                    Response.Data = null;
                }
                else
                {
                    usuario user = new usuario();
                    user.username = usuario;
                    user.passwords = password;
                    user.nombre = nombre;
                    user.id_rol = idrol;
                    user.isactive = estatus;
                    context.usuarios.InsertOnSubmit(user);
                    context.SubmitChanges();

                    Response.Result = true;
                    Response.Message = "Éxito";
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