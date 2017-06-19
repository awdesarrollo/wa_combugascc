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
    public partial class Roles : System.Web.UI.Page
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

        public class objRoles
        {
            public int idRol { get; set; }
            public string nombreRol { get; set; }
            public objRoles(int idRol, string nombreRol)
            {
                this.idRol = idRol;
                this.nombreRol = nombreRol;
            }
        }

        #endregion


        #region WebMethods

        [WebMethod(EnableSession = true)]
        public static ajaxResponse CargarRoles()
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                var Roles = (from roles in context.roles
                                  select roles).ToList();

                List<objRoles> objRoles = new List<objRoles>();
                foreach (var grupo in Roles)
                {
                    objRoles.Add(new objRoles(grupo.id_rol, grupo.descripcion));
                }

                var jsonSerialiser = new JavaScriptSerializer();
                var jsonRoles = jsonSerialiser.Serialize(objRoles);

                if (objRoles != null)
                {
                    Response.Result = true;
                    Response.Message = "";
                    Response.Data = jsonRoles;
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
        public static ajaxResponse AgregaRoles(string nombre)
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                role rol = new role();

                var entityExist = context.roles.Where(x => x.descripcion == nombre).SingleOrDefault();

                if (entityExist != null) // Duplicidad
                {
                    Response.Result = false;
                    Response.Message = "Ya se tiene un rol registrado con este nombre. ";
                    Response.Data = null;
                }
                else
                {
                    rol.descripcion = nombre;
                    context.roles.InsertOnSubmit(rol);
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
        public static ajaxResponse ObtieneRolId(int idRol)
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                var Roles = (from roles in context.roles
                             where roles.id_rol == idRol 
                             select roles).SingleOrDefault();

               objRoles objRoles = new objRoles(Roles.id_rol, Roles.descripcion);
              
                var jsonSerialiser = new JavaScriptSerializer();
                var jsonRoles = jsonSerialiser.Serialize(objRoles);

                if (objRoles != null)
                {
                    Response.Result = true;
                    Response.Message = "";
                    Response.Data = jsonRoles;
                }
                else
                {
                    Response.Result = false;
                    Response.Message = "No fue posible consultar los datos.";
                    Response.Data = null;
                }
            }
            catch (Exception ex)
            {
                Response.Result = false;
                Response.Message = "No fue posible consultar los datos. " + ex.Message;
                Response.Data = null;
            }

            return Response;
        }

        [WebMethod(EnableSession = true)]
        public static ajaxResponse EditaRoles(string nombre, int idRol)
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                role rol = context.roles.Where(x => x.id_rol == idRol).SingleOrDefault();
                rol.descripcion = nombre;
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