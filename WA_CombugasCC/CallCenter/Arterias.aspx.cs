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
    public partial class Arterias : System.Web.UI.Page
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
        public class ArtClass
        {
            public int idz { get; set; }
            public string nombre { get; set; }
            public string col { get; set; }
            public string cd { get; set; }
            public string zona { get; set; }
            public string std { get; set; }
            public bool estado { get; set; }
            public int stdid { get; set; }
            public int cdsid { get; set; }
            public int colid { get; set; }
            public string tipo { get; set; }


            public ArtClass(int idz, string nombre,string col, string cd, string std, string zona, bool estado, int cdsid, int stdid,int colid)
            {
                this.idz = idz;
                this.nombre = nombre;
                this.zona = zona;
                this.std = std;
                this.estado = estado;
                this.cd = cd;
                this.cdsid = cdsid;
                this.stdid = stdid;
                this.col = col;
                this.colid = colid;

            }
            public ArtClass(int idz, string nombre, string col, string cd, string std, string zona, bool estado, int cdsid, int stdid, int colid,string tipo)
            {
                this.idz = idz;
                this.nombre = nombre;
                this.zona = zona;
                this.std = std;
                this.estado = estado;
                this.cd = cd;
                this.cdsid = cdsid;
                this.stdid = stdid;
                this.col = col;
                this.colid = colid;
                this.tipo = tipo;

            }

        }
        public class colonClass
        {
            public int idz { get; set; }
            public string nombre { get; set; }
            public bool estado { get; set; }

            public colonClass(int idz, string nombre, bool estado)
            {
                this.idz = idz;
                this.nombre = nombre;
                this.estado = estado;

            }

        }
        public class calleClass
        {
            public int idz { get; set; }
            public string nombre { get; set; }
            public bool estado { get; set; }

            public calleClass(int idz, string nombre, bool estado)
            {
                this.idz = idz;
                this.nombre = nombre;
                this.estado = estado;

            }

        }
        [WebMethod]
        public static ajaxResponse CargarDatosCa()//combosCalles
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                var agrupacion = from p in context.tipo_calle where p.status == true select p;
                List<calleClass> lista = new List<calleClass>();
                foreach (var grupo in agrupacion)
                {
                    lista.Add(new calleClass(grupo.id_tipo, grupo.descripcion, grupo.status));
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
        public static ajaxResponse CargarDatosColCd(int idCd)//combos estados por zona
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                var agrupacion = from p in context.colonias where p.id_ciudad == idCd select p;
                List<colonClass> lista = new List<colonClass>();
                foreach (var grupo in agrupacion)
                {
                    lista.Add(new colonClass(grupo.id_colonia, grupo.descripcion, grupo.status));
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
        public static ajaxResponse CargarDatos()//tabla
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                var agrupacion = from art in context.calles
                                 join col in context.colonias on art.id_colonia equals col.id_colonia
                                 join cd in context.ciudades on art.id_ciudad equals cd.id_ciudad
                                 join std in context.estados on art.id_estado equals std.id_estado
                                 join zn in context.zonas on
                                 art.id_zona equals zn.id_zona
                                 join tp in context.tipo_calle on art.id_tipo equals tp.id_tipo
                                 select new
                                 {
                                     art.id_calle,
                                     art.descripcion,
                                     col= col.descripcion,
                                     cd = cd.descripcion,
                                     std = std.descripcion,
                                     zona = zn.descripcion,
                                     art.status,
                                     tipo = tp.descripcion
                                 };
                List<ArtClass> lista = new List<ArtClass>();
                foreach (var grupo in agrupacion)
                {
                    lista.Add(new ArtClass(grupo.id_calle, grupo.descripcion, grupo.col, grupo.cd, grupo.std, grupo.zona, grupo.status, 0, 0,0, grupo.tipo));
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
        public static ajaxResponse CargarDatos2(int id, int tipo)//tabla filtro
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                var agrupacion = from art in context.calles
                                 join col in context.colonias on art.id_colonia equals col.id_colonia
                                 join cd in context.ciudades on art.id_ciudad equals cd.id_ciudad
                                 join std in context.estados on art.id_estado equals std.id_estado
                                 join zn in context.zonas on art.id_zona equals zn.id_zona
                                 
                                 select new
                                 {
                                     art.id_calle,
                                     art.descripcion,
                                     col = col.descripcion,
                                     cd = cd.descripcion,
                                     std = std.descripcion,
                                     zona = zn.descripcion,
                                     art.status
                                 };
                if (tipo == 1)
                {
                    agrupacion = from art in context.calles
                                     join col in context.colonias on art.id_colonia equals col.id_colonia
                                     join cd in context.ciudades on art.id_ciudad equals cd.id_ciudad
                                     join std in context.estados on art.id_estado equals std.id_estado
                                     join zn in context.zonas on art.id_zona equals zn.id_zona
                                     where art.id_zona==id
                                     select new
                                     {
                                         art.id_calle,
                                         art.descripcion,
                                         col = col.descripcion,
                                         cd = cd.descripcion,
                                         std = std.descripcion,
                                         zona = zn.descripcion,
                                         art.status
                                     };
                }
                else if (tipo == 2)
                {
                    agrupacion = from art in context.calles
                                 join col in context.colonias on art.id_colonia equals col.id_colonia
                                 join cd in context.ciudades on art.id_ciudad equals cd.id_ciudad
                                 join std in context.estados on art.id_estado equals std.id_estado
                                 join zn in context.zonas on art.id_zona equals zn.id_zona
                                 where art.id_estado == id
                                 select new
                                 {
                                     art.id_calle,
                                     art.descripcion,
                                     col = col.descripcion,
                                     cd = cd.descripcion,
                                     std = std.descripcion,
                                     zona = zn.descripcion,
                                     art.status
                                 };
                }
                else if (tipo == 3)
                {
                    agrupacion = from art in context.calles
                                 join col in context.colonias on art.id_colonia equals col.id_colonia
                                 join cd in context.ciudades on art.id_ciudad equals cd.id_ciudad
                                 join std in context.estados on art.id_estado equals std.id_estado
                                 join zn in context.zonas on art.id_zona equals zn.id_zona
                                 where art.id_ciudad == id
                                 select new
                                 {
                                     art.id_calle,
                                     art.descripcion,
                                     col = col.descripcion,
                                     cd = cd.descripcion,
                                     std = std.descripcion,
                                     zona = zn.descripcion,
                                     art.status
                                 };
                }
                else if (tipo == 4)
                {
                    agrupacion = from art in context.calles
                                 join col in context.colonias on art.id_colonia equals col.id_colonia
                                 join cd in context.ciudades on art.id_ciudad equals cd.id_ciudad
                                 join std in context.estados on art.id_estado equals std.id_estado
                                 join zn in context.zonas on art.id_zona equals zn.id_zona
                                 where art.id_colonia == id
                                 select new
                                 {
                                     art.id_calle,
                                     art.descripcion,
                                     col = col.descripcion,
                                     cd = cd.descripcion,
                                     std = std.descripcion,
                                     zona = zn.descripcion,
                                     art.status
                                 };
                }

                List<ArtClass> lista = new List<ArtClass>();
                foreach (var grupo in agrupacion)
                {
                    lista.Add(new ArtClass(grupo.id_calle, grupo.descripcion, grupo.col, grupo.cd, grupo.std, grupo.zona, grupo.status, 0, 0, 0));
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
        public static ajaxResponse GuardaArt(string Nombre, int Zona, int Edo, int Cd,int Col,int Tp)
        {
            ajaxResponse Response = new ajaxResponse();
            calles objEst = new calles();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                objEst.id_zona = Zona;
                objEst.descripcion = Nombre;
                objEst.status = true;
                objEst.id_estado = Edo;
                objEst.id_ciudad = Cd;
                objEst.id_colonia = Col;
                objEst.id_tipo = Tp;
                context.calles.InsertOnSubmit(objEst);
                context.SubmitChanges();
                ArtClass calle = new ArtClass(objEst.id_calle, Nombre, Col + "", Cd + "", Edo + "", Zona + "", true, 0, 0, 0, Tp+"");
                var jsonSerialiser = new JavaScriptSerializer();
                var json = jsonSerialiser.Serialize(calle);
                // Alimentamos Bitacora
                Bitacora b = new Bitacora();
                b.fechahora = DateTime.Now;
                b.id_usuario = ((usuarios)HttpContext.Current.Session["sesionUsuario"]).id_usuario;
                b.modulo = "Arterias.aspx";
                b.funcion = "Agrego calle";
                b.entidad = json;
                b.detalle = ((usuarios)HttpContext.Current.Session["sesionUsuario"]).username + " - Usuario agrego calle: " + Nombre;
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
        public static ajaxResponse Unaart(int Id)
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                var agrupacion = from art in context.calles
                                 join col in context.colonias on art.id_colonia equals col.id_colonia
                                 join p in context.ciudades on art.id_ciudad equals p.id_ciudad
                                 join est in context.estados on art.id_estado equals est.id_estado
                                 join zn in context.zonas on art.id_zona equals zn.id_zona
                                 join tp in context.tipo_calle on art.id_tipo equals tp.id_tipo
                                 where art.id_calle == Id
                                 select new
                                 {
                                     art.id_calle,
                                     art.descripcion,
                                     col = col.descripcion,
                                     cd = p.descripcion,
                                     std = est.descripcion,
                                     zona = zn.descripcion,
                                     art.status,
                                     art.id_ciudad,
                                     art.id_estado,
                                     art.id_colonia,
                                     tipo=tp.descripcion
                                 };

                List<ArtClass> lista = new List<ArtClass>();
                foreach (var grupo in agrupacion)
                {
                    lista.Add(new ArtClass(grupo.id_calle, grupo.descripcion, grupo.col, grupo.cd, grupo.std, grupo.zona, grupo.status, grupo.id_ciudad, grupo.id_estado, grupo.id_colonia,grupo.tipo));
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
        public static ajaxResponse UnaartAct(int Id, int idZ, int idE, int idC, int idCo, string Nombre, bool stado,int tipo)//Actualizar Art
        {
            ajaxResponse Response = new ajaxResponse();
            calles objZona = new calles();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                objZona = context.calles.Where(x => x.id_calle == Id).SingleOrDefault();
                if (objZona != null)
                {
                    Response.Result = true;
                    Response.Message = "Actualizacion Correcta";
                    Response.Data = null;
                    objZona.id_zona = idZ;
                    objZona.id_estado = idE;
                    objZona.id_ciudad = idC;
                    objZona.id_colonia = idCo;
                    objZona.id_tipo = tipo;
                    objZona.descripcion = Nombre;
                    objZona.status = stado;
                    context.SubmitChanges();
                    ArtClass calle = new ArtClass(Id, Nombre, idCo + "", idC + "", idE + "", idZ + "", stado, 0, 0, 0, tipo + "");
                    var jsonSerialiser = new JavaScriptSerializer();
                    var json = jsonSerialiser.Serialize(calle);
                    // Alimentamos Bitacora
                    Bitacora b = new Bitacora();
                    b.fechahora = DateTime.Now;
                    b.id_usuario = ((usuarios)HttpContext.Current.Session["sesionUsuario"]).id_usuario;
                    b.modulo = "Arterias.aspx";
                    b.funcion = "Actualizo calle";
                    b.entidad = json;
                    b.detalle = ((usuarios)HttpContext.Current.Session["sesionUsuario"]).username + " - Usuario actualizo calle: " + Nombre;
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