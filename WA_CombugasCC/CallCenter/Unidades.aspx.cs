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
    public partial class Unidades : System.Web.UI.Page
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


        public class UnidadClass
        {
            public int id { get; set; }
            public string numero { get; set; }
            public string marca { get; set; }
            public string modelo { get; set; }
            public int? anio { get; set; }
            public string no_placa { get; set; }
            public string no_serie { get; set; }
            public DateTime? fecha { get; set; }
            public bool? estado { get; set; }

            public UnidadClass(int id, string numero, string marca, string modelo, int? anio, string no_placa, string no_serie, DateTime? fecha, bool? estado)
            {
                this.id = id;
                this.numero = numero;
                this.marca = marca;
                this.modelo = modelo;
                this.anio = anio;
                this.no_placa = no_placa;
                this.no_serie = no_serie;
                this.estado = estado;
                this.fecha = fecha;
            }

        }


        public class ServicioClass
        {
            public int id { get; set; }
            public string nombre { get; set; }
            public bool? estado { get; set; }

            public ServicioClass(int id, string nombre,  bool? estado)
            {
                this.id = id;
                this.nombre = nombre;
                this.estado = estado;
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
                var agrupacion = from p in context.truck select p;
                List<UnidadClass> lista = new List<UnidadClass>();
                foreach (var grupo in agrupacion)
                {
                    lista.Add(new UnidadClass(grupo.id_truck, grupo.numero, grupo.marca,grupo.modelo, grupo.anio,grupo.no_placa,grupo.no_serie,DateTime.Now,grupo.status));
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


        //Cargar datos Servicios
        [WebMethod]
        public static ajaxResponse CargarDatos2()
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                var agrupacion = from p in context.servicio select p;
                List<ServicioClass> lista = new List<ServicioClass>();
                foreach (var grupo in agrupacion)
                {
                    lista.Add(new ServicioClass(grupo.id_servicio, grupo.descripcion, grupo.status));
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
        public static ajaxResponse Un(int Id)
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                var agrupacion = from p in context.truck where p.id_truck == Id select p;
                List<UnidadClass> lista = new List<UnidadClass>();
                foreach (var grupo in agrupacion)
                {
                    lista.Add(new UnidadClass(grupo.id_truck, grupo.numero, grupo.marca, grupo.modelo, grupo.anio, grupo.no_placa, grupo.no_serie, DateTime.Now, grupo.status));
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


        //CARGAR PERMSOS POR ID
        [WebMethod(EnableSession = true)]
        public static ajaxResponse UnS(int idRol)
        {
            ajaxResponse Response = new ajaxResponse();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                var objModulos = (from modulos in context.servicio
                                  join permisos in context.servicioUnidad on modulos.id_servicio equals permisos.id_servicio
                                  where permisos.id_unidad == idRol
                                  && modulos.status == true
                                  select modulos).ToList();

                List<ServicioClass> asignacion = new List<ServicioClass>();
                foreach (var grupo in objModulos)
                {
                    asignacion.Add(new ServicioClass(grupo.id_servicio, grupo.descripcion, grupo.status));
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


        //GUARDAR 
        [WebMethod]
        public static ajaxResponse Guardar(string Numero, string Marca, string Modelo, int anio, string NumeroP, string NumeroS, bool Activo,List<int> servicios)
        {
            ajaxResponse Response = new ajaxResponse();
            truck objZona = new truck();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                objZona.numero = Numero;
                objZona.marca = Marca;
                objZona.modelo = Modelo;
                objZona.anio = anio;
                objZona.no_placa = NumeroP;
                objZona.no_serie = NumeroS;
                objZona.status = Activo;
                objZona.alta = DateTime.Now;
                context.truck.InsertOnSubmit(objZona);
                context.SubmitChanges();
                foreach (var a in servicios)
                {
                    servicioUnidad p = new servicioUnidad();
                    p.id_servicio = a;
                    p.id_unidad = objZona.id_truck;
                    p.status = true;
                    p.alta = DateTime.Now;
                    context.servicioUnidad.InsertOnSubmit(p);
                    context.SubmitChanges();
                }

                UnidadClass zona = new UnidadClass(objZona.id_truck, Numero, Marca, Modelo, anio, NumeroP, NumeroS, DateTime.Now, Activo);

                var jsonSerialiser = new JavaScriptSerializer();
                var json = jsonSerialiser.Serialize(zona);

                // Alimentamos Bitacora
                Bitacora b = new Bitacora();
                b.fechahora = DateTime.Now;
                b.id_usuario = ((usuarios)HttpContext.Current.Session["sesionUsuario"]).id_usuario;
                b.modulo = "Unidades.aspx";
                b.funcion = "Agregar Unidad";
                b.entidad = json;
                b.detalle = ((usuarios)HttpContext.Current.Session["sesionUsuario"]).username + " - Usuario agrego unidad: " + Numero;
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
        public static ajaxResponse Actualizar(int Id, string Numero, string Marca, string Modelo, int anio, string NumeroP, string NumeroS, bool Activo, List<int> servicios)
        {
            ajaxResponse Response = new ajaxResponse();
            truck objZona = new truck();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                objZona = context.truck.Where(x => x.id_truck == Id).SingleOrDefault();
                if (objZona != null)
                {
                    Response.Result = true;
                    Response.Message = "Actualizacion Correcta";
                    Response.Data = null;
                    objZona.numero = Numero;
                    objZona.marca = Marca;
                    objZona.modelo = Modelo;
                    objZona.anio = anio;
                    objZona.no_placa = NumeroP;
                    objZona.no_serie = NumeroS;
                    objZona.status = Activo;             
                    context.SubmitChanges();

                    // Se eliminar permisos existentes
                    var permisos = (from asignacion in context.servicioUnidad
                                    where asignacion.id_unidad == Id
                                    select asignacion).ToList();
                    foreach (var permiso in permisos)
                    {
                        context.servicioUnidad.DeleteOnSubmit(permiso);
                        context.SubmitChanges();
                    }


                    // Nueva Asignacion
                    foreach (var a in servicios)
                    {
                        servicioUnidad p = new servicioUnidad();
                        p.id_servicio = a;
                        p.id_unidad = Id;
                        p.status = true;
                        p.alta = DateTime.Now;
                        context.servicioUnidad.InsertOnSubmit(p);
                        context.SubmitChanges();
                    }



                    UnidadClass zona = new UnidadClass(Id, Numero, Marca, Modelo, anio, NumeroP, NumeroS, DateTime.Now, Activo);
                    var jsonSerialiser = new JavaScriptSerializer();
                    var json = jsonSerialiser.Serialize(zona);
                    // Alimentamos Bitacora
                    Bitacora b = new Bitacora();
                    b.fechahora = DateTime.Now;
                    b.id_usuario = ((usuarios)HttpContext.Current.Session["sesionUsuario"]).id_usuario;
                    b.modulo = "Unidades.aspx";
                    b.funcion = "Actualizo unidad";
                    b.entidad = json;
                    b.detalle = ((usuarios)HttpContext.Current.Session["sesionUsuario"]).username + " - Usuario actualizo unidad: " + Numero;
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