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
    public partial class ListaClientes : System.Web.UI.Page
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
        public class Listas
        {
            public int id { get; set; }
            public string nombre { get; set; }
            public string tipo { get; set; }
            public bool? estado { get; set; }

            public  Listas(int id,string nombre,string tipo,bool? estado)
            {
                this.id = id;
                this.nombre = nombre;
                this.tipo = tipo;
                this.estado = estado;
            }

        }

        public class ListasD
        {
            public int id { get; set; }
            public string calle { get; set; }
            public int id_calle { get; set; }
            public int? no_exterior { get; set; }
            public int? no_interior { get; set; }
            public string colonia { get; set; }
            public int id_colonia { get; set; }
            public string cd { get; set; }
            public int id_ciudad { get; set; }
            public string edo { get; set; }
            public int id_estado { get; set; }
            public string zona { get; set; }
            public int id_zona { get; set; }
            public string codigo { get; set; }
            public string TODO { get; set; }
            public string Ref { get; set; }
            public string Obs { get; set; }
            public int id_cp { get; set; }
            public bool? estado { get; set; }

            public ListasD(int id, string calle, int id_calle, int? no_exterior, int? no_interior, string colonia, int id_colonia, string cd, int id_ciudad,
                 string edo, int id_estado, string zona, int id_zona, string codigo, int id_cp, bool? estado)
            {
                this.id = id;
                this.calle = calle;
                this.id_calle = id_calle;
                this.no_exterior = no_exterior;
                this.no_interior = no_interior;
                this.colonia = colonia;
                this.id_colonia = id_colonia;
                this.cd = cd;
                this.id_ciudad = id_ciudad;
                this.edo = edo;
                this.id_estado = id_estado;
                this.zona = zona;
                this.id_zona = id_zona;
                this.codigo = codigo;
                this.id_cp = id_cp;
               // this.TODO = TODO;
                this.estado = estado;
            }
            public ListasD(int id, string calle, int id_calle, int? no_exterior, int? no_interior, string colonia, int id_colonia, string cd, int id_ciudad,
                 string edo, int id_estado, string zona, int id_zona, string codigo, int id_cp, string Ref, string Obs, bool? estado)
            {
                this.id = id;
                this.calle = calle;
                this.id_calle = id_calle;
                this.no_exterior = no_exterior;
                this.no_interior = no_interior;
                this.colonia = colonia;
                this.id_colonia = id_colonia;
                this.cd = cd;
                this.id_ciudad = id_ciudad;
                this.edo = edo;
                this.id_estado = id_estado;
                this.zona = zona;
                this.id_zona = id_zona;
                this.codigo = codigo;
                this.Ref = Ref;
                this.Obs = Obs;
                this.id_cp = id_cp;
                // this.TODO = TODO;
                this.estado = estado;
            }

        }
        public class ListasT
        {
            public int id { get; set; }
            public string numero { get; set; }
            public string tipo { get; set; }
            public bool? estado { get; set; }

            public ListasT(int id, string numero, string tipo, bool? estado)
            {
                this.id = id;
                this.numero = numero;
                this.tipo = tipo;
                this.estado = estado;
            }

        }
        public class ListasC
        {
            public int id { get; set; }
            public string nombre { get; set; }
            public string ap { get; set; }
            public string ap2 { get; set; }
            public string uss { get; set; }
            public string pass { get; set; }
            public string tipo { get; set; }
            public bool? estado { get; set; }

            public ListasC(int id, string nombre, string ap, string ap2, string uss, string pass, string tipo, bool? estado)
            {
                this.id = id;
                this.nombre = nombre;
                this.ap = ap;
                this.ap2 = ap2;
                this.uss = uss;
                this.pass = pass;
                this.tipo = tipo;
                this.estado = estado;
            }

        }
       

        [WebMethod]
        public static ajaxResponse CargarDatos()
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                var agrupacion = from p in context.Cliente join z in context.tipo_cliente on p.id_tipo equals z.id_tipo select new { p.id_cliente,p.nombre,p.apellidoP,
                p.apellidoM,z.descripcion,p.status};
                List<Listas> lista = new List<Listas>();
                foreach (var grupo in agrupacion)
                {
                    lista.Add(new Listas(grupo.id_cliente, grupo.nombre+" "+grupo.apellidoP+" "+grupo.apellidoM, grupo.descripcion,grupo.status));
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
                Response.Message = "Ha ocurrido un error al agregar zona. " + ex.Message;
                Response.Data = null;
            }
            return Response;
        }//END METODO CARGARDATOS

        //CARGAR 
        [WebMethod]
        public static ajaxResponse DirCli(int Id)
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                var agrupacion = from p in context.Direccion
                                 join z in context.zonas on p.id_zona equals z.id_zona
                                 join e in context.estados on p.id_estado equals e.id_estado
                                 join ci in context.ciudades on p.id_ciudad equals ci.id_ciudad
                                 join col in context.colonias on p.id_colonia equals col.id_colonia
                                 join ar in context.calles on p.id_calle equals ar.id_calle
                                 join tpc in context.tipo_calle on ar.id_tipo equals tpc.id_tipo
                                 join cp in context.cp on p.id_cp equals cp.id_cp
                                 join dc in context.Cliente_Direccion on p.id_direccion equals dc.id_direccion
                                 where dc.id_cliente == Id 
                                 select new
                                 {
                                     p.id_direccion,
                                     tpc.descripcion,
                                     calle = ar.descripcion,
                                     p.id_calle,
                                     p.no_exterior,
                                     p.no_interior,
                                     colonia = col.descripcion,
                                     p.id_colonia,
                                     cd = ci.descripcion,
                                     p.id_ciudad,
                                     edo = e.descripcion,
                                     p.id_estado,
                                     zona = z.descripcion,
                                     p.id_zona,
                                     codigo = cp.descripcion,
                                     p.id_cp,
                                     p.status
                                 };
                  
                List<ListasD> lista = new List<ListasD>();
                foreach (var grupo in agrupacion)
                {
                    lista.Add(new ListasD(grupo.id_direccion,grupo.descripcion+" "+ grupo.calle,grupo.id_calle,grupo.no_exterior,grupo.no_interior,grupo.colonia,grupo.id_colonia,
                        grupo.cd,grupo.id_ciudad,grupo.edo,grupo.id_estado,grupo.zona,grupo.id_zona,grupo.codigo,grupo.id_cp, grupo.status));
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
                Response.Message = "Ha ocurrido un error al agregar zona. " + ex.Message;
                Response.Data = null;
            }
            return Response;
        }//END METODO UN OPERADOR

        [WebMethod]
        public static ajaxResponse TelCli(int Id)
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                var agrupacion = from p in context.Telefono
                                 join tc in context.Cliente_Telefono on p.id_telefono equals tc.no_telefono
                                 where tc.id_cliente == Id
                                 select new
                                 {
                                     p.id_telefono,
                                     p.no_telefono,
                                     p.tipo_telefono,
                                     p.status
                                 };

                List<ListasT> lista = new List<ListasT>();
                foreach (var g in agrupacion)
                {
                    lista.Add(new ListasT(g.id_telefono,g.no_telefono,g.tipo_telefono,g.status));
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
                Response.Message = "Ha ocurrido un error al agregar zona. " + ex.Message;
                Response.Data = null;
            }
            return Response;
        }//END METODO UN OPERADOR

        [WebMethod]
        public static ajaxResponse UnCli(int Id)
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                var agrupacion = from p in context.Cliente
                                 join t in context.tipo_cliente on p.id_tipo equals t.id_tipo
                                 where p.id_cliente == Id select new {
                                     p.id_cliente,
                                     p.nombre,
                                     p.apellidoP,
                                     p.apellidoM,
                                     p.username,
                                     p.pass,
                                     t.descripcion,
                                     p.status};



                List <ListasC> lista = new List<ListasC>();
                foreach (var g in agrupacion)
                {
                    lista.Add(new ListasC(g.id_cliente, g.nombre, g.apellidoP, g.apellidoM, g.username, g.pass, g.descripcion, g.status));
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
                Response.Message = "Ha ocurrido un error al agregar zona. " + ex.Message;
                Response.Data = null;
            }
            return Response;
        }//END METODO UN OPERADOR

        //ACTUALIZAR OPERADOR
        [WebMethod]
        public static ajaxResponse Actualizar(int Id, string nombres, string a1, string a2, string usern, string passs, int tips, bool Activo)
        {
        
        ajaxResponse Response = new ajaxResponse();
            Cliente o = new Cliente();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                o = context.Cliente.Where(x => x.id_cliente == Id).SingleOrDefault();
                if (o != null)
                {
                    Response.Result = true;
                    Response.Message = "Actualizacion Correcta";
                    Response.Data = null;
                    o.nombre = nombres;
                    o.apellidoP = a1;
                    o.apellidoM = a2;
                    o.username = usern;
                    o.pass = passs;
                    o.id_tipo = tips;
                    o.status = Activo;
                    context.SubmitChanges();


                   

                    ListasC os = new ListasC(Id, nombres, a1, a2, usern, passs, tips+"",  Activo);

                    var jsonSerialiser = new JavaScriptSerializer();
                    var json = jsonSerialiser.Serialize(os);
                    // Alimentamos Bitacora
                    Bitacora b = new Bitacora();
                    b.fechahora = DateTime.Now;
                    b.id_usuario = ((usuarios)HttpContext.Current.Session["sesionUsuario"]).id_usuario;
                    b.modulo = "ListaCLientes.aspx";
                    b.funcion = "Actualizo Cliente";
                    b.entidad = json;
                    b.detalle = ((usuarios)HttpContext.Current.Session["sesionUsuario"]).username + " - Usuario actualizo Cliente: " + nombres+" "+ a1+" "+a2;
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
        }

        [WebMethod]
        public static ajaxResponse UnTELEF(int Id)
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                var agrupacion = from p in context.Telefono where p.id_telefono == Id select p;

                List<ListasT> lista = new List<ListasT>();
                foreach (var g in agrupacion)
                {
                    lista.Add(new ListasT(g.id_telefono, g.no_telefono, g.tipo_telefono, g.status));
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
                Response.Message = "Ha ocurrido un error al agregar zona. " + ex.Message;
                Response.Data = null;
            }
            return Response;
        }//END METODO UN OPERADOR

        //ACTUALIZAR OPERADOR
        [WebMethod]
        public static ajaxResponse ActualizarTEL(int Id, string no, string tipos, bool Activo)
        {

            ajaxResponse Response = new ajaxResponse();
            Telefono o = new Telefono();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                o = context.Telefono.Where(x => x.id_telefono == Id).SingleOrDefault();
                if (o != null)
                {
                    Response.Result = true;
                    Response.Message = "Actualizacion Correcta";
                    Response.Data = null;
                    o.no_telefono = no;
                    o.tipo_telefono = tipos;
                    o.status = Activo;
                    context.SubmitChanges();




                    ListasT os = new ListasT(Id, no, tipos, Activo);

                    var jsonSerialiser = new JavaScriptSerializer();
                    var json = jsonSerialiser.Serialize(os);
                    // Alimentamos Bitacora
                    Bitacora b = new Bitacora();
                    b.fechahora = DateTime.Now;
                    b.id_usuario = ((usuarios)HttpContext.Current.Session["sesionUsuario"]).id_usuario;
                    b.modulo = "ListaCLientes.aspx";
                    b.funcion = "Actualizo Telefono";
                    b.entidad = json;
                    b.detalle = ((usuarios)HttpContext.Current.Session["sesionUsuario"]).username + " - Usuario actualizo Telefono";
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
        }

        [WebMethod]
        public static ajaxResponse UnaDirec(int Id)
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                var agrupacion = from p in context.Direccion
                                 join z in context.zonas on p.id_zona equals z.id_zona
                                 join e in context.estados on p.id_estado equals e.id_estado
                                 join cd in context.ciudades on p.id_ciudad equals cd.id_ciudad
                                 join col in context.colonias on p.id_colonia equals col.id_colonia
                                 join ca in context.calles on p.id_calle equals ca.id_calle
                                 join cp in context.cp on p.id_cp equals cp.id_cp
                                 where p.id_direccion == Id
                                 select new
                                 {
                                     p.id_direccion,
                                     p.id_zona,
                                     zona= z.descripcion,
                                     p.id_estado,
                                     estado=e.descripcion,
                                     p.id_ciudad,
                                     cd=cd.descripcion,
                                     p.id_colonia,
                                     col=col.descripcion,
                                     p.id_calle,
                                     calle=ca.descripcion,
                                     p.id_cp,
                                     cp=cp.descripcion,
                                     p.no_exterior,
                                     p.no_interior,
                                     p.referencias,
                                     p.status,
                                     p.observaciones
                                 };

                List<ListasD> lista = new List<ListasD>();
                foreach (var g in agrupacion)
                {
                    lista.Add(new ListasD(g.id_direccion,g.calle,g.id_calle,g.no_exterior,g.no_interior,g.col,g.id_colonia,g.cd,g.id_ciudad,
                        g.estado,g.id_estado,g.zona,g.id_zona,g.cp,g.id_cp,g.referencias,g.observaciones,g.status));
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
                Response.Message = "Ha ocurrido un error al agregar zona. " + ex.Message;
                Response.Data = null;
            }
            return Response;
        }//END METODO UN OPERADOR


        [WebMethod]
        public static ajaxResponse ActualizarDir(int Id,int ZONA, int ESTADO, int CIUDAD, int COLONIA,
           int CALLE, int noInt, int noExt, int CPL,string Ref, string OB, bool Activo )
        {
       
            ajaxResponse Response = new ajaxResponse();
            Direccion d = new Direccion();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                d = context.Direccion.Where(x => x.id_direccion == Id).SingleOrDefault();
                if (d != null)
                {
                    Response.Result = true;
                    Response.Message = "Actualizacion Correcta";
                    Response.Data = null;
                    d.id_zona = ZONA;
                    d.id_estado = ESTADO;
                    d.id_ciudad = CIUDAD;
                    d.id_colonia = COLONIA;
                    d.id_calle = CALLE;
                    d.no_exterior = noExt;
                    d.no_interior = noInt;
                    d.id_cp = CPL;
                    d.referencias = Ref;
                 
                    d.observaciones = OB;
                    d.status = Activo;
                    context.SubmitChanges();




                    ListasT os = new ListasT(Id, "Modifico", "Direccion", Activo);

                    var jsonSerialiser = new JavaScriptSerializer();
                    var json = jsonSerialiser.Serialize(os);
                    // Alimentamos Bitacora
                    Bitacora b = new Bitacora();
                    b.fechahora = DateTime.Now;
                    b.id_usuario = ((usuarios)HttpContext.Current.Session["sesionUsuario"]).id_usuario;
                    b.modulo = "ListaCLientes.aspx";
                    b.funcion = "Actualizo Dirrecion";
                    b.entidad = json;
                    b.detalle = ((usuarios)HttpContext.Current.Session["sesionUsuario"]).username + " - Usuario actualizo Dirrecion";
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
        }

    }
}