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
    public partial class Productos : System.Web.UI.Page
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
   
        public class ProducClass
        {
            public int id { get; set; }
            public string nombre { get; set; }
            public int id_Ser { get; set; }
            public string nombre_Ser { get; set; }
            public decimal? precio { get; set; }
            public bool? estado { get; set; }

            public ProducClass(int id,string nombre,int id_Ser, string nombre_Ser,decimal? precio,bool? estado)
            {
                this.id = id;
                this.nombre = nombre;
                this.id_Ser = id_Ser;
                this.nombre_Ser = nombre_Ser;
                this.estado = estado;
                this.precio = precio;
            }

        }


        //Cargar datos
        [WebMethod]
        public static ajaxResponse CargarDatos()
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                var agrupacion = from p in context.producto
                                 join s in context.servicio on p.id_servicio equals s.id_servicio
                                 select new { p.id_producto,p.descripcion,s.id_servicio,servicio=s.descripcion,
                                 p.precio,p.status};
                List<ProducClass> lista = new List<ProducClass>();
                foreach (var grupo in agrupacion)
                {
                    lista.Add(new ProducClass(grupo.id_producto, grupo.descripcion,grupo.id_servicio,grupo.servicio, grupo.precio, grupo.status));
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


        //CARGAR UN OPERADOR
        [WebMethod]
        public static ajaxResponse Un(int Id)
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                var agrupacion = from p in context.producto
                                 join s in context.servicio on p.id_servicio equals s.id_servicio
                                 where p.id_producto == Id
                                 select new
                                 {
                                     p.id_producto,
                                     p.descripcion,
                                     s.id_servicio,
                                     servicio = s.descripcion,
                                     p.precio,
                                     p.status
                                 };
                List<ProducClass> lista = new List<ProducClass>();
                foreach (var grupo in agrupacion)
                {
                    lista.Add(new ProducClass(grupo.id_producto, grupo.descripcion, grupo.id_servicio, grupo.servicio, grupo.precio, grupo.status));
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


        //GUARDAR OPERADOR
        [WebMethod]
        public static ajaxResponse Guardar(string Nombre,decimal Precio,int ISer, bool Activo)
        {
            ajaxResponse Response = new ajaxResponse();
            producto obj = new producto();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                obj.descripcion = Nombre;
                obj.precio = Precio;
                obj.id_servicio = ISer;
                obj.status = Activo;
                obj.alta = DateTime.Now;
                context.producto.InsertOnSubmit(obj);
                context.SubmitChanges();
                ProducClass zona = new ProducClass(obj.id_producto, Nombre, ISer, "", Precio,Activo);
                var jsonSerialiser = new JavaScriptSerializer();
                var json = jsonSerialiser.Serialize(zona);

                // Alimentamos Bitacora
                Bitacora b = new Bitacora();
                b.fechahora = DateTime.Now;
                b.id_usuario = ((usuarios)HttpContext.Current.Session["sesionUsuario"]).id_usuario;
                b.modulo = "Productos.aspx";
                b.funcion = "Agregar Producto";
                b.entidad = json;
                b.detalle = ((usuarios)HttpContext.Current.Session["sesionUsuario"]).username + " - Usuario agrego producto: " + Nombre;
                ClassBicatora.insertBitacora(b);

                Response.Result = true;
                Response.Message = "Se agrego zona correctamente.";

            }
            catch (Exception ex)
            {
                Response.Result = false;
                Response.Message = "Ha ocurrido un error al agregar zona. " + ex.Message;
                Response.Data = null;
            }
            return Response;
        }//END METODO GUARDAR


        //ACTUALIZAR OPERADOR
        [WebMethod]
        public static ajaxResponse Actualizar(int Id, string Nombre, decimal Precio, int ISer, bool Activo)
        {
            ajaxResponse Response = new ajaxResponse();
            producto obj = new producto();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                obj = context.producto.Where(x => x.id_producto == Id).SingleOrDefault();
                if (obj != null)
                {
                    Response.Result = true;
                    Response.Message = "Actualizacion Correcta";
                    Response.Data = null;
                    obj.descripcion = Nombre;
                    obj.precio = Precio;
                    obj.id_servicio = ISer;
                    obj.status = Activo;
                    context.SubmitChanges();
                    ProducClass zona = new ProducClass(obj.id_producto, Nombre, ISer, "", Precio, Activo);
                    var jsonSerialiser = new JavaScriptSerializer();
                    var json = jsonSerialiser.Serialize(zona);
                    // Alimentamos Bitacora
                    Bitacora b = new Bitacora();
                    b.fechahora = DateTime.Now;
                    b.id_usuario = ((usuarios)HttpContext.Current.Session["sesionUsuario"]).id_usuario;
                    b.modulo = "Productos.aspx";
                    b.funcion = "Actualizo producto";
                    b.entidad = json;
                    b.detalle = ((usuarios)HttpContext.Current.Session["sesionUsuario"]).username + " - Usuario actualizo producto: " + Nombre;
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