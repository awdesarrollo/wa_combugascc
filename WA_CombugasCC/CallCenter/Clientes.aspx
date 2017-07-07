<%@ Page Title="" Language="C#" MasterPageFile="~/CallCenter/CallCenter.Master" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="WA_CombugasCC.CallCenter.Clientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="page-container" >
            <div class="page-content-wrapper">
                <div class="page-head">
                    <div class="container">
                        <div class="page-title">
                            <h1>Alta Clientes</h1>
                        </div>
                    </div>
                </div>
                <div class="page-content">
                    <div class="container">
                        <ul class="page-breadcrumb breadcrumb">
                            <li>
                                <a href="Default.aspx">Home</a>
                                <i class="fa fa-circle"></i>
                            </li>
                            <li>
                                <a href="#">Clientes</a>
                                    <i class="fa fa-circle"></i>
                            </li>
                            <li>
                                <span>Alta Cliente</span>
                            </li>
                        </ul>
                        <div class="page-content-inner" style="min-height: 400px;">
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                    <div class="portlet light ">
                                        <div class="portlet-title">
                                            <div class="caption caption-md">
                                                Datos del Cliente
                                            </div>
                                        </div>
                                        <div class="portlet-body">
                                            <div class="col-md-12 col-sm-12">
                                                <div class="row">
                                                    <h4 style="margin-top: 5px;">Nombre completo del cliente</h4>
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-sm-12">
                                                <div class="row">      
                                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                                        <input id="Nombre" class="form-control" type="text" placeholder="Nombre(s)."/>
                                                    </div>
                                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                                        <input id="Apellido1" class="form-control" type="text" placeholder="Apellido Paterno."/>
                                                    </div>
                                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                                        <input id="Apellido2" class="form-control" type="text" placeholder="Apellido Materno."/>
                                                    </div>
                                                 </div>



                                                <div class="row" style="margin-top: 20px;">
                                                      <h4 style="margin-top: 5px;">Dirección del cliente</h4>
                                                </div>
                                                <div class="row">      
                                                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                         <label >Zona</label>
                                                        <input id="ZONA" class="form-control" type="text" placeholder="Ejemplo: COAHUILA"/>
                                                    </div>
                                                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                        <label >Estado</label>
                                                        <input id="ESTADO" class="form-control" type="text" placeholder="Ejemplo: COAHUILA"/>
                                                    </div>
                                                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                         <label >Ciudad</label>
                                                        <input id="CIUDAD" class="form-control" type="text" placeholder="Ejemplo: TORREÓN"/>
                                                    </div>
                                                     <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                          <label >Colonia</label>
                                                        <input id="COLONIA" class="form-control" type="text" placeholder="Ejemplo: COLONIA TORREÓN JARDÍN"/>
                                                    </div>
                                                 </div>
                                                <div class="row"  style="margin-top: 20px;">      
                                                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                        <label >Calle</label>
                                                        <input id="CALLE" class="form-control" type="text" placeholder="Ejemplo: AVENIDA JUAREZ"/>
                                                    </div>
                                                    <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                        <label >Número Interior</label>
                                                        <input id="NoInt" class="form-control" type="text" placeholder="Ejemplo: 3"/>
                                                    </div>
                                                    <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                        <label >Número Exterior</label>
                                                        <input id="NoExt" class="form-control" type="text" placeholder="Ejemplo: 1232 "/>
                                                    </div>
                                                     <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                         <label >Código Postal</label>
                                                        <input id="CODIGOP" class="form-control" type="text" placeholder="Ejemplo: 27001"/>
                                                    </div>
                                                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                        <label >Entre Calle</label>
                                                        <input id="ENTCALLE1" class="form-control" type="text" placeholder="Ejemplo: AVENIDA JUAREZ"/>
                                                    </div>
                                                 </div>
                                                <div class="row"  style="margin-top: 20px;">      
                                                    
                                                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                        <label >Entre Calle</label>
                                                        <input id="ENTCALLE2" class="form-control" type="text" placeholder="Ejemplo: AVENIDA JUAREZ"/>
                                                    </div>
                                                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                        <label >Entre Calle</label>
                                                        <input id="ENTCALLE3" class="form-control" type="text" placeholder="Ejemplo: AVENIDA JUAREZ"/>
                                                    </div>
                                                     <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                          <label >Cercano a:</label>
                                                        <input id="REFE" class="form-control" type="text" placeholder="Ejemplo: Iglesia, Tortilleria, Farmacia"/>
                                                    </div>
                                                 </div>
                                                <div class="row"  style="margin-top: 20px;">      
                                                    <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
                                                        <label >Observaciones</label>
                                                        <input id="OBSERVA" class="form-control" type="text" placeholder=""/>
                                                    </div>
                                                 </div>
                                                 <div class="row" style="margin-top: 20px;">
                                                      <h4 style="margin-top: 5px;">Teléfono del cliente</h4>
                                                </div>
                                                <div class="row" style="margin-top: 1px;">
                                                    <div class="col-md-12 col-sm-12">
                                                        <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
                                                            <input id="NoTel1" class="form-control" type="text" placeholder="No. Telefónico."/>
                                                       </div>
                                                       <div class="col-md-3 col-sm-12" style="padding-left: 0px;">
                                                          <select class="js-example-basic-single form-control col-md-12 col-sm-12 col-xs-12" id="Sel1">
                                                            <option value="CASA" selected>CASA</option>
                                                            <option value="CELULAR">CELULAR</option>
                                                            <option value="OFICINA">OFICINA</option>
                                                            <option value="OTROS">OTROS</option>
                                                          </select>
                                                       </div>
                                                       
                                                       <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                            <button id="btn1" class="btn red " type="button" style="display: block;" onclick="b1();">+</button>
                                                       </div>
                                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                            <button id="btnVerificar" class="btn red " type="button" style="display: block;" onclick="b1();">Verificar</button>
                                                       </div>
                                                        <div id="addmore">

                                                       </div>
                                                    </div>
                                                </div>


                                            </div>
                                            
                                          <div class="row" style="margin-top: 20px;">
                                              <div class="col-md-12" style="margin-top: 20px;">
                                                    <button id="btnguardar" class="btn red pull-right" type="button" style="margin-top:15px !important;display: block;" onclick="Guardar();">Guardar</button>&nbsp;
                                                    <button class="btn red pull-right" id="btnEditar" type="button" style="margin-top:15px !important; display: none;">Modificar</button>&nbsp;
                                                    <button id="btnLim" class="btn btn-default pull-right" type="button" style="margin-top:15px !important; margin-right:15px;" onclick="Limpiar();">Limpiar</button>&nbsp;
                                                   <button id="btnAgregar" class="btn btn-default pull-right" type="button" style="margin-top:15px !important; margin-right:15px;" onclick="AgregarElemento();">Agregar Elemento</button>&nbsp;
                                                </div>
                                          </div>
                                        </div>
                                    </div>
                                </div>



                            </div>
                           
                        </div>
                    </div>
                </div>
            </div>
           
        </div>






<div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="mdAgrega">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span></button>
        <h4 class="modal-title" >Agregar un elemento</h4>
      </div>
      <div class="modal-body" >
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <button type="button" class="btn red col-md-12 col-sm-12 col-xs-12" data-toggle="modal" data-target="#ZONAz">ZONA</button>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <button type="button" class="btn red col-md-12 col-sm-12 col-xs-12"  data-toggle="modal" data-target="#ESTADOz">ESTADO</button>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <button type="button" class="btn red col-md-12 col-sm-12 col-xs-12"  data-toggle="modal" data-target="#CIUDADz">CIUDAD</button>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12" style="margin-top:20px;">
                    <button type="button" class="btn red col-md-12 col-sm-12 col-xs-12"  data-toggle="modal" data-target="#COLONIAz">COLONIA</button>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12" style="margin-top:20px;">
                    <button type="button" class="btn red col-md-12 col-sm-12 col-xs-12"  data-toggle="modal" data-target="#CALLEz">CALLE</button>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12" style="margin-top:20px;">
                    <button type="button" class="btn red col-md-12 col-sm-12 col-xs-12"  data-toggle="modal" data-target="#CPz">C.P</button>
                </div>
                
            </div>
      </div>
      <div class="modal-footer" >
        <button class="btn btn-default" type="button"  data-dismiss="modal">Cancelar</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="ZONAz">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span></button>
        <h4 class="modal-title" >Agregar una Zona</h4>
      </div>
      <div class="modal-body" >
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <label style="margin-top: 5px;">Nombre de la zona</label>
                                        
                    <input id="nombrezona" class="form-control" type="text"/>
                </div>

            </div>
      </div>
      <div class="modal-footer" >
        <button class="btn btn-default" type="button"  data-dismiss="modal">Cancelar</button>
          <button id="btn11" class="btn red pull-right" type="button" style="margin-top:15px !important;" onclick="GuardarZONA();">Guardar</button>
      </div>
    </div>
  </div>
</div>

    <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="ESTADOz">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span></button>
        <h4 class="modal-title" >Agregar un Estado</h4>
      </div>
      <div class="modal-body" >
            <div class="row">
                
            </div>
      </div>
      <div class="modal-footer" >
        <button class="btn btn-default" type="button"  data-dismiss="modal">Cancelar</button>
      </div>
    </div>
  </div>
</div>

    <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="CIUDADz">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span></button>
        <h4 class="modal-title" >Agregar una Ciudad</h4>
      </div>
      <div class="modal-body" >
            <div class="row">
                
            </div>
      </div>
      <div class="modal-footer" >
        <button class="btn btn-default" type="button"  data-dismiss="modal">Cancelar</button>
      </div>
    </div>
  </div>
</div>

    <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="COLONIAz">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span></button>
        <h4 class="modal-title" >Agregar una Colonia</h4>
      </div>
      <div class="modal-body" >
            <div class="row">
                
            </div>
      </div>
      <div class="modal-footer" >
        <button class="btn btn-default" type="button"  data-dismiss="modal">Cancelar</button>
      </div>
    </div>
  </div>
</div>

    <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="CALLEz">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span></button>
        <h4 class="modal-title" >Agregar una Calle</h4>
      </div>
      <div class="modal-body" >
            <div class="row">
                
            </div>
      </div>
      <div class="modal-footer" >
        <button class="btn btn-default" type="button"  data-dismiss="modal">Cancelar</button>
      </div>
    </div>
  </div>
</div>

    <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="CPz">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span></button>
        <h4 class="modal-title" >Agregar un Código postal</h4>
      </div>
      <div class="modal-body" >
            <div class="row">
                
            </div>
      </div>
      <div class="modal-footer" >
        <button class="btn btn-default" type="button"  data-dismiss="modal">Cancelar</button>
      </div>
    </div>
  </div>
</div>



     <script type="text/javascript">

         var more = 1;
         $(document).ready(function () {

            // $('.select2').select2();
            
         });
         function AgregarElemento() {
             $('#mdAgrega').modal('show');
         }
         

         function llenarSelectZONA() {
             $('#ZNSELEC').html('"<option value="-1"></option>"');
             $('#ZNSELEC option:contains("")').attr('selected', 'selected');
             $.ajax({
                 type: "POST",
                 url: "Estados.aspx/CargarDatosZonas",
                 data: "{}",
                 contentType: "application/json; charset=utf-8",
                 dataType: "json",
                 success: function (response) {
                     if (response.d.Result) {
                         var parsedTest = JSON.parse(response.d.Data);
                         var metodo = "";
                         for (var i = 0; i < parsedTest.length; i++) {
                             if (parsedTest[i]['estado']) {
                                 $('#ZNSELEC').append('<option value="' + parsedTest[i]['idz'] + '">' + parsedTest[i]['nombre'] + '</option>');
                             }
                         }

                     }
                 }, error: function (error) {
                     console.log("ERROR: " + error);
                 }
             });
            
         }

         






         function Limpiar() {
             $('#Nombre').val('');
             $('#Apellido1').val('');
             $('#Apellido2').val('');
             $('#NoTel1').val('');
             $('#NoTel2').val('');
             $('#NoTel3').val('');
             $('#Entre1').val('');
             $('#Entre2').val('');
             $('#noInt').val('');
             $('#noExt').val('');
             $('#RefOb').val('');
             document.getElementById('btn1').style.display = 'block';
             document.getElementById('PanelTel2').style.display = 'none';
             document.getElementById('btn2').style.display = 'block';
             document.getElementById('PanelTel3').style.display = 'none';
             //$("#ZNSELEC").select2("val", "");
             //$("#ZNSELEC2").select2("val", "");
             //$("#ZNSELEC3").select2("val", "");
             //$("#ZNSELEC4").select2("val", "");
             //$("#ZNSELEC5").select2("val", "");
             //$("#ZNSELEC8").select2("val", "");
             llenarSelect();
             
         }

         function b1() {
             var linea = '<div class="col-lg-5 col-md-5 col-sm-12 col-xs-12" style="margin-top:20px;"><input id="NoTel1' + more + '" class="form-control" type="text" placeholder="No. Telefónico."/></div><div class="col-md-3 col-sm-12" style="padding-left: 0px;margin-top:20px;"><select class="js-example-basic-single form-control col-md-12 col-sm-12 col-xs-12" id="Sel1' + more + '"><option value="CASA" selected>CASA</option> <option value="CELULAR">CELULAR</option><option value="OFICINA">OFICINA</option><option value="OTROS">OTROS</option></select></div>';
             $('#addmore').append(linea);
             more = more + 1;
                                                           
                                                            
                                                            
                                                          
                                                      
         }

       
         //llenarSelect()
         function llenarSelect() {
             $('#ZNSELEC').html('"<option value="-1"></option>"');
             $('#ZNSELEC option:contains("")').attr('selected', 'selected');

             $('#ZNSELEC2').html('"<option value="-1"></option>"');
             $('#ZNSELEC2 option:contains("")').attr('selected', 'selected');

             $('#ZNSELEC3').html('"<option value="-1"></option>"');
             $('#ZNSELEC3 option:contains("")').attr('selected', 'selected');

             $('#ZNSELEC4').html('"<option value="-1"></option>"');
             $('#ZNSELEC4 option:contains("")').attr('selected', 'selected');

             $('#ZNSELEC5').html('"<option value="-1"></option>"');
             $('#ZNSELEC5 option:contains("")').attr('selected', 'selected');

             $('#ZNSELEC8').html('"<option value="-1"></option>"');
             $('#ZNSELEC8 option:contains("")').attr('selected', 'selected');

             $.ajax({
                 type: "POST",
                 url: "Estados.aspx/CargarDatosZonas",
                 data: "{}",
                 contentType: "application/json; charset=utf-8",
                 dataType: "json",
                 success: function (response) {
                     if (response.d.Result) {
                         var parsedTest = JSON.parse(response.d.Data);
                         var metodo = "";
                         for (var i = 0; i < parsedTest.length; i++) {
                             if (parsedTest[i]['estado']) {
                                 $('#ZNSELEC').append('<option value="' + parsedTest[i]['idz'] + '">' + parsedTest[i]['nombre'] + '</option>');
                             } 
                         }

                     }
                 }, error: function (error) {
                     console.log("ERROR: " + error);
                 }
             });
             $('#ZNSELEC option:contains("")').attr('selected', 'selected');
         }

         function llenaCP() {
             $('#ZNSELEC8').html('"<option value="-1"></option>"');
             $('#ZNSELEC8 option:contains("")').attr('selected', 'selected');
             $.ajax({
                 type: "POST",
                 url: "Colonias.aspx/CargarDatosCP",
                 data: "{}",
                 contentType: "application/json; charset=utf-8",
                 dataType: "json",
                 success: function (response) {
                     if (response.d.Result) {
                         var parsedTest = JSON.parse(response.d.Data);
                         var metodo = "";
                         for (var i = 0; i < parsedTest.length; i++) {
                             if (parsedTest[i]['estado']) {                              
                                 $('#ZNSELEC8').append('<option value="' + parsedTest[i]['idz'] + '">' + parsedTest[i]['nombre'] + '</option>');
                             }
                         }

                     } 
                 }, error: function (error) {
                     console.log("ERROR: " + error);
                 }
             });

         }


         //region transacciones
         function Guardar() {
             //Obtener datos
             var res = $.trim($("#Nombre").val());
             var Nombre = res.toUpperCase();
             res = $.trim($("#Apellido1").val());
             var Apellido1 = res.toUpperCase();
             res = $.trim($("#Apellido2").val());
             var Apellido2 = res.toUpperCase();
             var Tel1 = $("#NoTel1").val();
             var Tel2 = $("#NoTel2").val();
             var Tel3 = $("#NoTel3").val();
             res = $.trim($("#Entre1").val());
             var Entre1 = res.toUpperCase();
             res = $.trim($("#Entre2").val());
             var Entre2 = res.toUpperCase();
             var noInt = $("#noInt").val();
             var noExt = $("#noExt").val();
             var RefOb = $("#RefOb").val();
             //var IdZona = $("#ZNSELEC").val();
             //var IdEstado = $("#ZNSELEC2").val();
             //var IdCiudad = $("#ZNSELEC3").val();
             //var IdColonia = $("#ZNSELEC4").val();
             //var IdCalle = $("#ZNSELEC5").val();
             //var IdCp = $("#ZNSELEC8").val();
            
             alert(Nombre); alert(Apellido1); alert(Apellido2); alert(Tel1); alert(Tel2); alert(Tel3); alert(Entre1);
             alert(Entre2); alert(noInt); alert(noExt); alert(RefOb);
             //alert(IdZona); alert(IdEstado); alert(IdCiudad); alert(IdColonia); alert(IdCalle); alert(IdCp);
         }
     </script>

</asp:Content>
