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
    public partial class Clientes : System.Web.UI.Page
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
            public string nombre { get; set; }
            public string apellido1 { get; set; }
            public string apellido2 { get; set; }
           
            public UnidadClass(int id, string nombre, string apellido1, string apellido2)
            {
                this.id = id;
                this.nombre = nombre;
                this.apellido1 = apellido1;
                this.apellido2 = apellido2;
            }

        }
        //GUARDAR 
        [WebMethod]
        public static ajaxResponse Guardar(string nombre, string Apellido1, string Apellido2, int IDTIPO, int ZONA, int ESTADO, int CIUDAD, int COLONIA,
           int CALLE, int noInt, int noExt, int CPL, int ENTRE1, int ENTRE2, int ENTRE3, string Ref, string OB, List<string> NOTEL, List<string> TIPNOTEL)
        {
        
            ajaxResponse Response = new ajaxResponse();
            Cliente o = new Cliente();
            try
            {
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                o.nombre = nombre;
                o.apellidoP = Apellido1;
                o.apellidoM = Apellido2;
                o.id_tipo = IDTIPO;
                o.alta = DateTime.Now;
                o.status = true;
                context.Cliente.InsertOnSubmit(o);
                context.SubmitChanges();

                int a = NOTEL.Count;
                for (int i = 0; i < a; i++)
                {
                    Telefono p = new Telefono();
                    p.no_telefono = NOTEL[i];
                    p.no_secuencia = i;
                    p.tipo_telefono = TIPNOTEL[i];
                    p.alta = DateTime.Now;
                    p.status = true;
                    context.Telefono.InsertOnSubmit(p);
                    context.SubmitChanges();
                    Cliente_Telefono ct = new Cliente_Telefono();
                    ct.id_cliente = o.id_cliente;
                    ct.no_telefono = p.id_telefono;
                    ct.alta= DateTime.Now;
                    ct.status = true;
                    context.Cliente_Telefono.InsertOnSubmit(ct);
                    context.SubmitChanges();
                }
                
	

                Direccion d = new Direccion();
                d.id_zona = ZONA;
                d.id_estado = ESTADO;
                d.id_ciudad = CIUDAD;
                d.id_colonia = COLONIA;
                d.id_calle = CALLE;
                d.no_exterior = noExt;
                d.no_interior = noInt;
                d.id_cp = CPL;
                d.entre_1 = ENTRE1;
                d.entre_2 = ENTRE2;
                d.entre_3 = ENTRE3;
                d.referencias = Ref;
                d.latitud = 0.0;
                d.longitud = 0.0;
                d.alta = DateTime.Now;
                d.status = true;
                context.Direccion.InsertOnSubmit(d);
                context.SubmitChanges();
                Cliente_Direccion cd = new Cliente_Direccion();
                cd.id_cliente = o.id_cliente;
                cd.id_direccion = d.id_direccion;
                cd.alta = DateTime.Now;
                cd.status = true;
                context.Cliente_Direccion.InsertOnSubmit(cd);
                context.SubmitChanges();


                UnidadClass zona = new UnidadClass(o.id_cliente,nombre,Apellido1,Apellido2);

                var jsonSerialiser = new JavaScriptSerializer();
                var json = jsonSerialiser.Serialize(zona);

                // Alimentamos Bitacora
                Bitacora b = new Bitacora();
                b.fechahora = DateTime.Now;
                b.id_usuario = ((usuarios)HttpContext.Current.Session["sesionUsuario"]).id_usuario;
                b.modulo = "Clientes.aspx";
                b.funcion = "Agregar Cliente";
                b.entidad = json;
                b.detalle = ((usuarios)HttpContext.Current.Session["sesionUsuario"]).username + " - Usuario agrego Cliente: " + nombre;
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

    }
}