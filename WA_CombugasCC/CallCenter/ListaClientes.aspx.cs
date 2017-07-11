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
                                 join cp in context.cp on p.id_cp equals cp.id_cp
                                 join dc in context.Cliente_Direccion on p.id_direccion equals dc.id_direccion
                                 where dc.id_cliente == Id 
                                 select new
                                 {
                                     p.id_direccion,
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
                    lista.Add(new ListasD(grupo.id_direccion, grupo.calle,grupo.id_calle,grupo.no_exterior,grupo.no_interior,grupo.colonia,grupo.id_colonia,
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
    }
}