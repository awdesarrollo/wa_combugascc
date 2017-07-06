﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using WA_CombugasCC.Core;

namespace WA_CombugasCC.CallCenter
{
    public partial class Operadores : System.Web.UI.Page
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


        public class OperadorClass
        {
            public int id { get; set; }
            public string nombre { get; set; }
            public string usuario { get; set; }
            public string dir { get; set; }
            public string a1 { get; set; }
            public string a2 { get; set; }
            public string foto { get; set; }
            public string contrasenia { get; set; }
            public DateTime? fecha { get; set; }
            public bool? estado { get; set; }
            public OperadorClass(int idz, string nombre, DateTime? fecha,bool? estado)
            {
                this.id = idz;
                this.nombre = nombre;
                this.estado = estado;
                this.fecha = fecha;
            }
            public OperadorClass(int idz, string nombre, DateTime? fecha, bool? estado,string usuario,string contrasenia, string a1, string a2,string foto,string dir)
            {
                this.id = idz;
                this.nombre = nombre;
                this.estado = estado;
                this.fecha = fecha;
                this.usuario = usuario;
                this.contrasenia = contrasenia;
                this.a1 = a1;
                this.a2 = a2;
                this.foto = foto;
                this.dir = dir;
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
                var agrupacion = from p in context.operador select p;
                List<OperadorClass> lista = new List<OperadorClass>();
                foreach (var grupo in agrupacion)
                {
                    lista.Add(new OperadorClass(grupo.id_operador, grupo.nombre + " " + grupo.apellidoP + " " + grupo.apellidoM, grupo.alta, grupo.status));
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
                var agrupacion = from p in context.operador where p.id_operador == Id select p;
                List<OperadorClass> lista = new List<OperadorClass>();
                foreach (var grupo in agrupacion)
                {
                    lista.Add(new OperadorClass(grupo.id_operador, grupo.nombre, grupo.alta, grupo.status,grupo.username,grupo.pass,grupo.apellidoP,grupo.apellidoM,grupo.foto,grupo.direccion));
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
        public static ajaxResponse Guardar(string Nombre,bool Activo, string Us, string Pass,string A1, string A2,string IDFOTO,string Dir)
        {
            ajaxResponse Response = new ajaxResponse();
            operador objZona = new operador();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                objZona.nombre = Nombre;
                objZona.apellidoP = A1;
                objZona.apellidoM = A2;
                objZona.status = Activo;
                objZona.pass = Pass;
                objZona.direccion = Dir;
                objZona.username = Us;
                objZona.foto = IDFOTO;
                objZona.alta= DateTime.Now;
                context.operador.InsertOnSubmit(objZona);
                context.SubmitChanges();

                fotografias foto = new fotografias();
                foto = context.fotografias.Where(x => x.nombre == IDFOTO).SingleOrDefault();
                if (foto != null)
                {
                    foto.confirmada = 1;
                    foto.id_chofer = objZona.id_operador;
                    context.SubmitChanges();
                }
                OperadorClass zona = new OperadorClass(objZona.id_operador, Nombre, DateTime.Now ,Activo);
                var jsonSerialiser = new JavaScriptSerializer();
                var json = jsonSerialiser.Serialize(zona);

                // Alimentamos Bitacora
                Bitacora b = new Bitacora();
                b.fechahora = DateTime.Now;
                b.id_usuario = ((usuarios)HttpContext.Current.Session["sesionUsuario"]).id_usuario;
                b.modulo = "Operadores.aspx";
                b.funcion = "Agregar Operador";
                b.entidad = json;
                b.detalle = ((usuarios)HttpContext.Current.Session["sesionUsuario"]).username + " - Usuario agrego operador: " + Nombre;
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
        public static ajaxResponse Actualizar(int Id, string Nombre, bool Activo,string Us,string Pass, string A1, string A2, string IDFOTO, string Dir)
        {
            ajaxResponse Response = new ajaxResponse();
            operador objZona = new operador();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                objZona = context.operador.Where(x => x.id_operador == Id).SingleOrDefault();
                if (objZona != null)
                {
                    Response.Result = true;
                    Response.Message = "Actualizacion Correcta";
                    Response.Data = null;
                    objZona.nombre = Nombre;
                    objZona.apellidoP = A1;
                    objZona.apellidoM = A2;
                    objZona.status = Activo;
                    objZona.direccion = Dir;
                    objZona.pass = Pass;
                    objZona.foto = IDFOTO;
                    objZona.username = Us;
                    context.SubmitChanges();

                    fotografias foto = new fotografias();
                    
                    foto = context.fotografias.Where(x => x.id_chofer == Id & x.confirmada == 1 & x.nombre != IDFOTO).SingleOrDefault();

                    if (foto != null)
                    {
                        foto.confirmada = 0;
                        context.SubmitChanges();
                    }
                    foto = context.fotografias.Where(x => x.nombre == IDFOTO).SingleOrDefault();
                    if (foto != null)
                    {
                        foto.confirmada = 1;
                        foto.id_chofer = Id;
                        context.SubmitChanges();
                    }



                    OperadorClass zona = new OperadorClass(Id, Nombre,objZona.alta, Activo);
                    var jsonSerialiser = new JavaScriptSerializer();
                    var json = jsonSerialiser.Serialize(zona);
                    // Alimentamos Bitacora
                    Bitacora b = new Bitacora();
                    b.fechahora = DateTime.Now;
                    b.id_usuario = ((usuarios)HttpContext.Current.Session["sesionUsuario"]).id_usuario;
                    b.modulo = "Operadores.aspx";
                    b.funcion = "Actualizo operador";
                    b.entidad = json;
                    b.detalle = ((usuarios)HttpContext.Current.Session["sesionUsuario"]).username + " - Usuario actualizo operador: " + Nombre;
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