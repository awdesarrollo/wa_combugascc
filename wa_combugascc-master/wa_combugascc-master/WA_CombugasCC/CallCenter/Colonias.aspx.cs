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
    public partial class Colonias : System.Web.UI.Page
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
        public class ColonClass
        {
            public int idz { get; set; }
            public string nombre { get; set; }
            public string cd { get; set; }
            public string zona { get; set; }
            public string std { get; set; }
            public bool estado { get; set; }
            public int stdid { get; set; }
            public int cdsid { get; set; }

            public ColonClass(int idz, string nombre, string cd, string std, string zona, bool estado,int cdsid,int stdid)
            {
                this.idz = idz;
                this.nombre = nombre;
                this.zona = zona;
                this.std = std;
                this.estado = estado;
                this.cd = cd;
                this.cdsid = cdsid;
                this.stdid = stdid;

            }

        }
        public class CiudadClass
        {
            public int idz { get; set; }
            public string nombre { get; set; }
            public bool estado { get; set; }

            public CiudadClass(int idz, string nombre,bool estado)
            {
                this.idz = idz;
                this.nombre = nombre;
                this.estado = estado;

            }

        }
        [WebMethod]
        public static ajaxResponse CargarDatos()//tabla
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                var agrupacion = from col in context.colonias join cd in context.ciudades on col.id_ciudad equals cd.id_ciudad
                                 join std in context.estados on cd.id_estado equals std.id_estado join zn in context.zonas on
                                 std.id_zona equals zn.id_zona where zn.estado==true & std.status==true &cd.status==true select new { col.id_colonia, col.descripcion, cd=cd.descripcion, std=std.descripcion,
                                 zona=zn.descripcion,col.status};
                List<ColonClass> lista = new List<ColonClass>();
                foreach (var grupo in agrupacion)
                {
                    lista.Add(new ColonClass(grupo.id_colonia, grupo.descripcion, grupo.cd, grupo.std, grupo.zona, grupo.status,0,0));
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
        [WebMethod]
        public static ajaxResponse CargarDatosCdEst(int idEst)//combos estados por zona
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                var agrupacion = from p in context.ciudades
                                 join z in context.zonas on p.id_zona equals z.id_zona where p.id_estado == idEst & z.estado==true select p;
                List<CiudadClass> lista = new List<CiudadClass>();
                foreach (var grupo in agrupacion)
                {
                    lista.Add(new CiudadClass(grupo.id_ciudad, grupo.descripcion,grupo.status));
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
        [WebMethod]
        public static ajaxResponse GuardaCol(string Nombre, int Zona, int Edo, int Cd)
        {
            ajaxResponse Response = new ajaxResponse();
            colonias objEst = new colonias();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                objEst.id_zona = Zona;
                objEst.descripcion = Nombre;
                objEst.status = true;
                objEst.id_estado = Edo;
                objEst.id_ciudad = Cd;
                context.colonias.InsertOnSubmit(objEst);
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
        public static ajaxResponse Unacol(int Id)
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                var agrupacion = from col in context.colonias
                                 join p in context.ciudades on col.id_ciudad equals p.id_ciudad
                                 join est in context.estados on p.id_estado equals est.id_estado
                                 join zn in context.zonas on est.id_zona equals zn.id_zona
                                 where col.id_colonia == Id
                                 select new {
                                     col.id_colonia,
                                     col.descripcion,
                                     cd = p.descripcion,
                                     std = est.descripcion,
                                     zona = zn.descripcion,
                                     col.status,
                                     col.id_ciudad,
                                     col.id_estado
                                 };

                List<ColonClass> lista = new List<ColonClass>();
                foreach (var grupo in agrupacion)
                {
                    lista.Add(new ColonClass(grupo.id_colonia, grupo.descripcion, grupo.cd, grupo.std, grupo.zona, grupo.status,grupo.id_ciudad,grupo.id_estado));
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
        [WebMethod]
        public static ajaxResponse UnacolAct(int Id, int idZ, int idE,int idC, string Nombre, bool stado)//Actualizar Ciudad
        {
            ajaxResponse Response = new ajaxResponse();
            colonias objZona = new colonias();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                objZona = context.colonias.Where(x => x.id_colonia == Id).SingleOrDefault();
                if (objZona != null)
                {
                    Response.Result = true;
                    Response.Message = "Actualizacion Correcta";
                    Response.Data = null;
                    objZona.id_zona = idZ;
                    objZona.id_estado = idE;
                    objZona.id_ciudad = idC;
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
    }
}