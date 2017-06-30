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
            public string asentamiento { get; set; }
            public string CP { get; set; }
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
            public ColonClass(int idz, string nombre, string cd, string std, string zona, bool estado, int cdsid, int stdid,string asentamiento,string CP)
            {
                this.idz = idz;
                this.nombre = nombre;
                this.zona = zona;
                this.std = std;
                this.estado = estado;
                this.cd = cd;
                this.cdsid = cdsid;
                this.stdid = stdid;
                this.CP = CP;
                this.asentamiento = asentamiento;

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
        public class CodigoClass
        {
            public int idz { get; set; }
            public string nombre { get; set; }
            public bool? estado { get; set; }

            public CodigoClass(int idz, string nombre, bool? estado)
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
                                 join std in context.estados on col.id_estado equals std.id_estado join zn in context.zonas on
                                 col.id_zona equals zn.id_zona
                                 join AS in context.tipo_asentamiento on col.id_tipo equals AS.id_tipo
                                 where zn.estado==true & std.status==true &cd.status==true select new { col.id_colonia, col.descripcion, cd=cd.descripcion, std=std.descripcion,
                                 zona=zn.descripcion,col.status,Col=AS.descripcion};
                List<ColonClass> lista = new List<ColonClass>();
                foreach (var grupo in agrupacion)
                {
                    lista.Add(new ColonClass(grupo.id_colonia, grupo.Col + " " + grupo.descripcion, grupo.cd, grupo.std, grupo.zona, grupo.status,0,0));
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
        public static ajaxResponse CargarDatos2(int id,int tipo)//tabla filtro
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                var agrupacion= from col in context.colonias
                                join cd in context.ciudades on col.id_ciudad equals cd.id_ciudad
                                join std in context.estados on cd.id_estado equals std.id_estado
                                join zn in context.zonas on
                                std.id_zona equals zn.id_zona
                                join AS in context.tipo_asentamiento on col.id_tipo equals AS.id_tipo
                                where zn.estado == true & std.status == true & cd.status == true
                                select new
                                {
                                    col.id_colonia,
                                    col.descripcion,
                                    cd = cd.descripcion,
                                    std = std.descripcion,
                                    zona = zn.descripcion,
                                    col.status,
                                    Col = AS.descripcion
                                };
                if (tipo==1)
                {
                    agrupacion = from col in context.colonias
                                     join cd in context.ciudades on col.id_ciudad equals cd.id_ciudad
                                     join std in context.estados on col.id_estado equals std.id_estado
                                     join zn in context.zonas on col.id_zona equals zn.id_zona
                                 join AS in context.tipo_asentamiento on col.id_tipo equals AS.id_tipo
                                 where zn.estado == true & std.status == true & cd.status == true & zn.id_zona==id
                                     select new
                                     {
                                         col.id_colonia,
                                         col.descripcion,
                                         cd = cd.descripcion,
                                         std = std.descripcion,
                                         zona = zn.descripcion,
                                         col.status,
                                         Col = AS.descripcion
                                     };
                }
                else if (tipo == 2)
                {
                    agrupacion = from col in context.colonias
                                 join cd in context.ciudades on col.id_ciudad equals cd.id_ciudad
                                 join std in context.estados on col.id_estado equals std.id_estado
                                 join zn in context.zonas on col.id_zona equals zn.id_zona
                                 join AS in context.tipo_asentamiento on col.id_tipo equals AS.id_tipo
                                 where zn.estado == true & std.status == true & cd.status == true & std.id_estado == id
                                 select new
                                 {
                                     col.id_colonia,
                                     col.descripcion,
                                     cd = cd.descripcion,
                                     std = std.descripcion,
                                     zona = zn.descripcion,
                                     col.status,
                                     Col = AS.descripcion
                                 };
                }
                else if (tipo == 3)
                {
                    agrupacion = from col in context.colonias
                                 join cd in context.ciudades on col.id_ciudad equals cd.id_ciudad
                                 join std in context.estados on col.id_estado equals std.id_estado
                                 join zn in context.zonas on col.id_zona equals zn.id_zona
                                 join AS in context.tipo_asentamiento on col.id_tipo equals AS.id_tipo
                                 where zn.estado == true & std.status == true & cd.status == true & cd.id_ciudad == id
                                 select new
                                 {
                                     col.id_colonia,
                                     col.descripcion,
                                     cd = cd.descripcion,
                                     std = std.descripcion,
                                     zona = zn.descripcion,
                                     col.status,
                                     Col = AS.descripcion
                                 };
                }
                else if (tipo == 4)
                {
                    agrupacion = from col in context.colonias
                                 join cd in context.ciudades on col.id_ciudad equals cd.id_ciudad
                                 join std in context.estados on col.id_estado equals std.id_estado
                                 join zn in context.zonas on col.id_zona equals zn.id_zona
                                 join cp in context.cp on col.id_cp equals cp.id_cp
                                 join AS in context.tipo_asentamiento on col.id_tipo equals AS.id_tipo
                                 where zn.estado == true & std.status == true & cd.status == true & cp.id_cp == id
                                 select new
                                 {
                                     col.id_colonia,
                                     col.descripcion,
                                     cd = cd.descripcion,
                                     std = std.descripcion,
                                     zona = zn.descripcion,
                                     col.status,
                                     Col = AS.descripcion
                                 };
                }

                List<ColonClass> lista = new List<ColonClass>();
                foreach (var grupo in agrupacion)
                {
                    lista.Add(new ColonClass(grupo.id_colonia, grupo.Col + " " + grupo.descripcion, grupo.cd, grupo.std, grupo.zona, grupo.status, 0, 0));
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
        public static ajaxResponse CargarDatosCP()//combosCP
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                var agrupacion = from p in context.cp where p.status == true select p;
                List<CodigoClass> lista = new List<CodigoClass>();
                foreach (var grupo in agrupacion)
                {
                    lista.Add(new CodigoClass(grupo.id_cp, grupo.descripcion, grupo.status));
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
        public static ajaxResponse CargarDatosAs()//combosCP
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                var agrupacion = from p in context.tipo_asentamiento where p.status == true select p;
                List<CodigoClass> lista = new List<CodigoClass>();
                foreach (var grupo in agrupacion)
                {
                    lista.Add(new CodigoClass(grupo.id_tipo, grupo.descripcion, grupo.status));
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
        public static ajaxResponse GuardaCol(string Nombre, int Zona, int Edo, int Cd,int CP,int AS)
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
                objEst.id_cp = CP;
                objEst.id_tipo = AS;
                context.colonias.InsertOnSubmit(objEst);
                context.SubmitChanges();
                ColonClass co = new ColonClass(objEst.id_colonia, Nombre, Cd + "", Edo + "", Zona + "", true, Cd, Edo);
                var jsonSerialiser = new JavaScriptSerializer();
                var json = jsonSerialiser.Serialize(co);
                // Alimentamos Bitacora
                Bitacora b = new Bitacora();
                b.fechahora = DateTime.Now;
                b.id_usuario = ((usuarios)HttpContext.Current.Session["sesionUsuario"]).id_usuario;
                b.modulo = "Colonias.aspx";
                b.funcion = "Agrego colonia";
                b.entidad = json;
                b.detalle = ((usuarios)HttpContext.Current.Session["sesionUsuario"]).username + " - Usuario agrego colonia: " + Nombre;
                ClassBicatora.insertBitacora(b);
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
                                 join est in context.estados on col.id_estado equals est.id_estado
                                 join zn in context.zonas on col.id_zona equals zn.id_zona
                                 join AS in context.tipo_asentamiento on col.id_tipo equals AS.id_tipo
                                 join CP in context.cp on col.id_cp equals CP.id_cp
                                 where col.id_colonia == Id
                                 select new {
                                     col.id_colonia,
                                     col.descripcion,
                                     cd = p.descripcion,
                                     std = est.descripcion,
                                     zona = zn.descripcion,
                                     ase=AS.descripcion,
                                     cpp=CP.descripcion,
                                     col.status,
                                     col.id_ciudad,
                                     col.id_estado
                                 };

                List<ColonClass> lista = new List<ColonClass>();
                foreach (var grupo in agrupacion)
                {
                    lista.Add(new ColonClass(grupo.id_colonia, grupo.descripcion, grupo.cd, grupo.std, grupo.zona, grupo.status,grupo.id_ciudad,grupo.id_estado,grupo.ase,grupo.cpp));
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
        public static ajaxResponse UnacolAct(int Id, int idZ, int idE,int idC, string Nombre, bool stado,int TA, int CP)//Actualizar Ciudad
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
                    objZona.id_tipo = TA;
                    objZona.id_cp = CP;
                    objZona.descripcion = Nombre;
                    objZona.status = stado;
                    context.SubmitChanges();
                    ColonClass co = new ColonClass(Id, Nombre, idC + "", idE + "", idZ + "", stado, idC, idE);
                    var jsonSerialiser = new JavaScriptSerializer();
                    var json = jsonSerialiser.Serialize(co);
                    // Alimentamos Bitacora
                    Bitacora b = new Bitacora();
                    b.fechahora = DateTime.Now;
                    b.id_usuario = ((usuarios)HttpContext.Current.Session["sesionUsuario"]).id_usuario;
                    b.modulo = "Colonias.aspx";
                    b.funcion = "Actualizo colonia";
                    b.entidad = json;
                    b.detalle = ((usuarios)HttpContext.Current.Session["sesionUsuario"]).username + " - Usuario actualizo colonia: " + Nombre;
                    ClassBicatora.insertBitacora(b);
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