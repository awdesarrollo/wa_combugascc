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
    public partial class Permisos : System.Web.UI.Page
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

        public class permisosClass
        {
            public int idmodulo { get; set; }
            public string titulo { get; set; }
            public string url { get; set; }
            public int idpadre { get; set; }
            public permisosClass(int idmodulo, string titulo, string url, int idpadre, string descripcion)
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
        public static ajaxResponse ObtenerModulosRol(int idRol)
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                var objModulos = (from modulos in context.modulos
                                  join permisos in context.permisos on modulos.id_modulo equals permisos.id_modulo
                                  where permisos.id_rol == idRol
                                  && modulos.isactive == true
                                  select modulos).ToList();

                List<permisosClass> asignacion = new List<permisosClass>();
                foreach (var grupo in objModulos)
                {
                    asignacion.Add(new permisosClass(grupo.id_modulo, grupo.titulo, grupo.url_modulo, grupo.id_modulo_padre, grupo.descripcion));
                }
                var jsonSerialiser = new JavaScriptSerializer();
                var jsonModulos = jsonSerialiser.Serialize(asignacion);

                if (jsonModulos != null)
                {
                    Response.Result = true;
                    Response.Message = "";
                    Response.Data = jsonModulos;
                }
                else
                {
                    Response.Result = false;
                    Response.Message = "Sin permisos asignados";
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
        public static ajaxResponse AsignacionPermisos(int idRol, List<int> modulos)
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                // Se eliminar permisos existentes
                var permisos =(from asignacion in context.permisos
                                where asignacion.id_rol == idRol
                                select asignacion).ToList();
                foreach (var permiso in permisos)
                {
                    context.permisos.DeleteOnSubmit(permiso);
                    context.SubmitChanges();
                }


                // Nueva Asignacion
                foreach (var a in modulos)
                {
                    permiso p = new permiso();
                    p.id_rol = idRol;
                    p.id_modulo = a;
                    p.status = true;
                    p.observacion = "";

                    context.permisos.InsertOnSubmit(p);
                    context.SubmitChanges();
                }


                Response.Result = true;
                Response.Message = "Asignacion Exitosa";
                Response.Data = null;


            }
            catch (Exception ex)
            {
                Response.Result = false;
                Response.Message = "Ha ocurrido un problema. " + ex.Message;
                Response.Data = null;
            }

            return Response;
        }

        #endregion
    }
}