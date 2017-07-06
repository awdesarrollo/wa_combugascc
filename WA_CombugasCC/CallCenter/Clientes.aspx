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
                                                      <h4 style="margin-top: 5px;">Teléfono del cliente</h4>
                                                </div>
                                                <div class="row" style="margin-top: 1px;">
                                                    <div class="col-md-12 col-sm-12">
                                                       <div class="col-md-3 col-sm-12" style="padding-left: 0px;">
                                                          <select class="js-example-basic-single form-control col-md-12 col-sm-12 col-xs-12" id="Sel1">
                                                            <option value="CASA" selected>CASA</option>
                                                            <option value="CELULAR">CELULAR</option>
                                                            <option value="OFICINA">OFICINA</option>
                                                          </select>
                                                       </div>
                                                       <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
                                                        <input id="NoTel1" class="form-control" type="text" placeholder="No. Telefónico."/>
                                                       </div>
                                                       <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                                        <button id="btn1" class="btn red " type="button" style="display: block;" onclick="b1();">+</button>
                                                       </div>

                                                    </div>
                                                    <div class="col-md-12 col-sm-12" style="margin-top:5px; display:none;" id="PanelTel2">
                                                       <div class="col-md-3 col-sm-12" style="padding-left: 0px;">
                                                          <select class="js-example-basic-single form-control col-md-12 col-sm-12 col-xs-12" id="Sel2">
                                                            <option value="CASA" >Casa</option>
                                                            <option value="CELULAR" selected>CELULAR</option>
                                                            <option value="OFICINA">OFICINA</option>
                                                          </select>
                                                       </div>
                                                       <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
                                                        <input id="NoTel2" class="form-control" type="text" placeholder="No. Telefónico."/>
                                                       </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                                        <button id="btn2" class="btn red " type="button" style="display: block;" onclick="b2();">+</button>
                                                       </div>
                                                    </div>
                                                    <div class="col-md-12 col-sm-12" style="margin-top:5px; display:none;" id="PanelTel3">
                                                       <div class="col-md-3 col-sm-12" style="padding-left: 0px;">
                                                          <select class="js-example-basic-single form-control col-md-12 col-sm-12 col-xs-12" id="Sel3">
                                                            <option value="CASA" >Casa</option>
                                                            <option value="CELULAR">CELULAR</option>
                                                            <option value="OFICINA"selected>OFICINA</option>
                                                          </select>
                                                       </div>
                                                       <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
                                                        <input id="NoTel3" class="form-control" type="text" placeholder="No. Telefónico."/>
                                                       </div>

                                                    </div>


                                                 </div>
                                                <div class="row" style="margin-top: 20px;">
                                                      <h4 style="margin-top: 5px;">Dirección del cliente</h4>
                                                </div>
                                                <div class="row" style="margin-top: 1px;">
                                                      
                                                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                        <label>Zona</label>
                                                        <select class="form-control select2 col-md-12 col-sm-12 col-xs-12" id="ZNSELEC">
                                                            <option value="-1"></option>
                                                        </select>

                                                    </div>
                                        
                                                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                        <label>Estado</label>
                                                         <select class="form-control select2 col-md-12 col-sm-12 col-xs-12" id="ZNSELEC2">
                                                             <option value="-1" disabled></option>
                                                        </select>
                                                    </div>
                                       
                                                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                        <label>Ciudad</label>
                                                        <select class="form-control select2 col-md-12 col-sm-12 col-xs-12" id="ZNSELEC3">
                                                             <option value="-1" disabled></option>
                                                        </select>
                                                    </div>
                                        
                                                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                        <label>Colonia</label>
                                                        <select class="form-control select2 col-md-12 col-sm-12 col-xs-12" id="ZNSELEC4">
                                                             <option value="-1" disabled></option>
                                                        </select>
                                                    </div>

                                                </div>
                                                 <div class="row" style="margin-top: 10px;">
                                                      
                                                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                        <label>Calle</label>
                                                        <select class="form-control select2 col-md-12 col-sm-12 col-xs-12" id="ZNSELEC5">
                                                            <option value="-1"></option>
                                                        </select>
                                                    </div>
                                        
                                                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                        <label>Entre</label>
                                                        <input id="Entre1" class="form-control" type="text" placeholder="Entre Calle."/>
                                                    </div>
                                       
                                                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                        <label>y Entre</label>
                                                         <input id="Entre2" class="form-control" type="text" placeholder="y Entre Calle."/>
                                                    </div>
                                        
                                                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                        <label>Código Postal</label>
                                                        <select class="form-control select2 col-md-12 col-sm-12 col-xs-12" id="ZNSELEC8">
                                                             <option value="-1" disabled></option>
                                                        </select>
                                                    </div>

                                                </div>


                                                 <div class="row" style="margin-top: 10px;">
                                                      
                                                    <div class="col-lg-2 col-md-3 col-sm-12 col-xs-12">
                                                        <label>No. Interior</label>
                                                        <input id="noInt" class="form-control" type="text" placeholder="No. Interior."/>
                                                    </div>
                                        
                                                    <div class="col-lg-2 col-md-3 col-sm-12 col-xs-12">
                                                        <label>No. Exterior</label>
                                                        <input id="noExt" class="form-control" type="text" placeholder="No. Exterior."/> 
                                                    </div>
                                       
                                                    <div class="col-lg-8 col-md-3 col-sm-12 col-xs-12">
                                                        <label>Referencias y Observaciones</label>
                                                        <input id="RefOb" class="form-control" type="text" placeholder="Referencias y Observaciones."/> 
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
         
          </div>
      </div>
      <div class="modal-footer" >
        <button class="btn btn-default" type="button"  data-dismiss="modal">Cancelar</button>
      </div>
    </div>
  </div>
</div>





     <script type="text/javascript">
         $(document).ready(function () {

             $('.select2').select2();
            
         });
         function AgregarElemento() {
             $('#mdAgrega').modal('show');
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
             $("#ZNSELEC").select2("val", "");
             $("#ZNSELEC2").select2("val", "");
             $("#ZNSELEC3").select2("val", "");
             $("#ZNSELEC4").select2("val", "");
             $("#ZNSELEC5").select2("val", "");
             $("#ZNSELEC8").select2("val", "");
             llenarSelect();
             
         }
         function b1() {
             document.getElementById('btn1').style.display = 'none';
             document.getElementById('PanelTel2').style.display = 'block';
         }
         function b2() {
             document.getElementById('btn2').style.display = 'none';
             document.getElementById('PanelTel3').style.display = 'block';
         }
         
         llenarSelect();
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
         $("select[id=ZNSELEC]").change(function () {
             var VALOR = $('#ZNSELEC').val();
             $('#ZNSELEC2').html('"<option value="-1"></option>"');
             $('#ZNSELEC2 option:contains("")').attr('selected', 'selected');
             if (VALOR == '-1') {
             } else {
                 $.ajax({
                     type: "POST",
                     url: "Ciudades.aspx/CargarDatosEstadZN",
                     data: '{ idzone:' + VALOR + ' }',
                     contentType: "application/json; charset=utf-8",
                     dataType: "json",
                     success: function (response) {
                         if (response.d.Result) {
                             var parsedTest = JSON.parse(response.d.Data);
                             var metodo = "";
                             for (var i = 0; i < parsedTest.length; i++) {
                                 if (parsedTest[i]['estado']) {
                                     $('#ZNSELEC2').append('<option value="' + parsedTest[i]['idz'] + '">' + parsedTest[i]['nombre'] + '</option>');
                                 } else {
                                 }
                             }
                         } else {
                         }
                     },
                     error: function (error) {
                         console.log("ERROR: " + error);
                     }
                 });

             }
         });
         $("select[id=ZNSELEC2]").change(function () {
             var VALOR = $('#ZNSELEC2').val();
             $('#ZNSELEC3').html('"<option value="-1"></option>"');

             $('#ZNSELEC3 option:contains("")').attr('selected', 'selected');
             if (VALOR == '-1') {
             } else {
                 $.ajax({
                     type: "POST",
                     url: "Colonias.aspx/CargarDatosCdEst",
                     data: '{ idEst:' + VALOR + ' }',
                     contentType: "application/json; charset=utf-8",
                     dataType: "json",
                     success: function (response) {
                         if (response.d.Result) {
                             var parsedTest = JSON.parse(response.d.Data);

                             for (var i = 0; i < parsedTest.length; i++) {
                                 if (parsedTest[i]['estado']) {
                                     $('#ZNSELEC3').append('<option value="' + parsedTest[i]['idz'] + '">' + parsedTest[i]['nombre'] + '</option>');
                                 } else {
                                 }
                             }
                         } else {
                         }
                     },
                     error: function (error) {
                         console.log("ERROR: " + error);
                     }
                 });
             }
             llenaCP();
         });
         $("select[id=ZNSELEC3]").change(function () {
             var VALOR = $('#ZNSELEC3').val();
             $('#ZNSELEC4').html('"<option value="-1"></option>"');

             $('#ZNSELEC4 option:contains("")').attr('selected', 'selected');
             if (VALOR == '-1') {
             } else {
                 $.ajax({
                     type: "POST",
                     url: "Colonias.aspx/CargarDatos2",
                     data: '{ id:' + VALOR + ',tipo:3 }',
                     contentType: "application/json; charset=utf-8",
                     dataType: "json",
                     success: function (response) {
                         if (response.d.Result) {
                             var parsedTest = JSON.parse(response.d.Data);

                             for (var i = 0; i < parsedTest.length; i++) {
                                 if (parsedTest[i]['estado']) {
                                     $('#ZNSELEC4').append('<option value="' + parsedTest[i]['idz'] + '">' + parsedTest[i]['nombre'] + '</option>');
                                 } else {
                                 }
                             }
                         } else {
                         }
                     },
                     error: function (error) {
                         console.log("ERROR: " + error);
                     }
                 });
             }
         });
         $("select[id=ZNSELEC4]").change(function () {//Carga Calles por Colonia
             var VALOR = $('#ZNSELEC4').val();
             $('#ZNSELEC5').html('"<option value="-1"></option>"');

             $('#ZNSELEC5 option:contains("")').attr('selected', 'selected');
             if (VALOR == '-1') {
             } else {
                 $.ajax({
                     type: "POST",
                     url: "Arterias.aspx/CargarDatos2",
                     data: '{ id:' + VALOR + ',tipo:4 }',
                     contentType: "application/json; charset=utf-8",
                     dataType: "json",
                     success: function (response) {
                         if (response.d.Result) {
                             var parsedTest = JSON.parse(response.d.Data);

                             for (var i = 0; i < parsedTest.length; i++) {
                                 if (parsedTest[i]['estado']) {
                                     $('#ZNSELEC5').append('<option value="' + parsedTest[i]['idz'] + '">' + parsedTest[i]['nombre'] + '</option>');
                                 } else {
                                 }
                             }
                         } else {
                         }
                     },
                     error: function (error) {
                         console.log("ERROR: " + error);
                     }
                 });
             }
         });
     </script>

</asp:Content>
