<%@ Page Title="" Language="C#" MasterPageFile="~/CallCenter/CallCenter.Master" AutoEventWireup="true" CodeBehind="Colonias.aspx.cs" Inherits="WA_CombugasCC.CallCenter.Colonias" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>

.sa {
    height: 300px !important;
    overflow-x: hidden;
    overflow-y: scroll;
    display:block;
}
    </style>
    
<div class="page-container" >
    <div class="page-content-wrapper">
        <div class="page-head">
            <div class="container">
                <div class="page-title">
                    <h1>Colonias</h1>
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
                        <a href="#">Catalogos</a>
                        <i class="fa fa-circle"></i>
                    </li>
                    <li>
                        <span>Colonias</span>
                    </li>
                </ul>
                <div class="page-content-inner" style="min-height: 400px;">
                    <div class="row">
                        <div class="col-md-9 col-sm-12">
                            <div class="portlet light "> 
                                <div class="portlet-title">
                                    <div class="caption caption-md">
                                        Colonias.
                                    </div>
                                </div>          
                                <div class="portlet-body">
                                    <div class="row">                         
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">  
                                                
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <center>Buscar por:</center>
                                                <div class="col-md-3 col-sm-12 col-xs-12">
                                                    <center><label>Zona.</label></center>
                                                    <select class="js-example-basic-single form-control col-md-12 col-sm-12 col-xs-12" id="zonaFil" style="margin-top:5px;margin-bottom:10px;">
                                                         <option value="-1"></option>
                                                    </select>
                                                </div>
                                                <div class="col-md-3 col-sm-12 col-xs-12">
                                                    <center><label>Estado.</label></center>
                                                    <select class="js-example-basic-single form-control col-md-12 col-sm-12 col-xs-12" id="estadoFil" style="margin-top:5px;margin-bottom:10px;">
                                                         <option value="-1"></option>
                                                    </select>
                                                </div>
                                                <div class="col-md-3 col-sm-12 col-xs-12">
                                                    <center><label>Ciudad.</label></center>
                                                    <select class="js-example-basic-single form-control col-md-12 col-sm-12 col-xs-12" id="ciudadFil" style="margin-top:5px;margin-bottom:10px;">
                                                         <option value="-1"></option>
                                                    </select>
                                                </div>
                                                <div class="col-md-3 col-sm-12 col-xs-12">
                                                    <center><label>C.P.</label></center>
                                                    <select class="js-example-basic-single form-control col-md-12 col-sm-12 col-xs-12" id="codigoFil" style="margin-top:5px;margin-bottom:10px;">
                                                         <option value="-1"></option>
                                                    </select>
                                                </div>
                                            </div>
                                         <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="border-bottom:3px #eff3f8 solid;margin-top:10px;margin-bottom:10px;"></div>

                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-top:100px;">   
                                               <table class="table table-striped table-bordered table-hover dt-responsive" width="100%" id="tab" cellspacing="0" width="100%">
                                                    <thead>
                                                        <tr>
                                                            <th hidden>ID</th>
                                                            <th  style="">Nombre</th>
                                                            <th style="text-align: center; " >Ciudad</th>
                                                            <th style="text-align: center; " >Estado</th>
                                                            <th style="text-align: center; " >Zona</th>
                                                            <th style="text-align: center; width:40px;" >¿Activo?</th>
                                                            <th style="text-align: center; width:40px;" >Modificar</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="tablecols">
                                                   
                                                    </tbody>
                                                </table>     
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3 col-sm-12">
                            <div class="portlet light "> 
                                <div class="portlet-title">
                                    <div class="caption caption-md">
                                        Agregar una colonia.
                                    </div>
                                </div>          
                                <div class="portlet-body">
                                    <div class="row">                       
                                               
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-top:5px;margin-bottom:10px;">
                                               <label>Tipo de asentamiento</label>
                                                 <select class="js-example-basic-single form-control col-md-12 col-sm-12 col-xs-12" id="ZNSELEC12" style="margin-top:5px;margin-bottom:10px;">
                                                     <option value="-1"></option>
                                                </select>
                                            </div>
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-top:5px;margin-bottom:10px;">
                                                 <label >Nombre de la colonia.</label>
                                                <input id="nombreCol" class="form-control" type="text"/>
                                            </div>
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <label>Selecciona una zona.</label>
                                                 <select class="js-example-basic-single form-control col-md-12 col-sm-12 col-xs-12" id="ZNSELEC" style="margin-top:5px;margin-bottom:10px;">
                                                     <option value="-1"></option>
                                                </select>
                                            </div>
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <label>Selecciona un estado.</label>
                                                <select class="js-example-basic-single form-control col-md-12 col-sm-12 col-xs-12" id="ZNSELEC2" style="margin-top:5px;margin-bottom:10px;">
                                                     <option value="-1" disabled>Primero: seleccione una zona.</option>
                                                </select>
                                            </div>
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <label>Selecciona una ciudad.</label>
                                                 <select class="js-example-basic-single form-control col-md-12 col-sm-12 col-xs-12" id="ZNSELEC3" style="margin-top:5px;margin-bottom:10px;">
                                                     <option value="-1" >Primero: seleccione un estado</option>
                                                </select>
                                            </div>
                                              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <label>Selecciona un codigo postal.</label>
                                                 <select class="js-example-basic-single form-control col-md-12 col-sm-12 col-xs-12" id="ZNSELEC32" style="margin-top:5px;margin-bottom:10px;">
                                                     <option value="-1" ></option>
                                                </select>
                                            </div>
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <right><button id="btnguardar" class="btn red pull-right" type="button" style="margin-top: 15px !important;" onclick="Guardar()">Guardar</button></right>
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
    <a href="javascript:;" class="page-quick-sidebar-toggler">
                
    </a>
</div>

    <%-- Modal --%>
    
     <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="mdAgrega">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span></button>
        <h4 class="modal-title" >Modificar colonia</h4>
      </div>
      <div class="modal-body" >
          <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12" >
            <label class=" col-md-2 col-sm-2 col-xs-12" >Tipo<span>*:</span>
            </label>
            <div class=" col-md-10 col-sm-10 col-xs-12">
                   <select class="js-example-basic-single form-control col-md-12 col-sm-12 col-xs-12" id="ZNSELEC123">
                         <option value="-1"></option>
                   </select>
            </div>
            </div>
        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top:15px;" >
            <label class="col-md-2 col-sm-2 col-xs-12" >Nombre<span >* :</span></label>
            <div class="col-md-10 col-sm-10 col-xs-12">
              <input type="text" id="txtZona" required class="form-control col-md-7 col-xs-12 " value="">
            </div>
          </div> 
              <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top:15px;">
            <label class=" col-md-2 col-sm-2 col-xs-12" >Zona<span>*:</span>
            </label>
            <div class=" col-md-10 col-sm-10 col-xs-12">
                   <select class="js-example-basic-single form-control col-md-12 col-sm-12 col-xs-12" id="ZNSELEC4">
                         <option value="-1"></option>
                   </select>
            </div>
            </div> 
          <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top:15px;">
            <label class=" col-md-2 col-sm-2 col-xs-12" >Estado<span>*:</span>
            </label>
            <div class=" col-md-10 col-sm-10 col-xs-12">
                   <select class="js-example-basic-single form-control col-md-12 col-sm-12 col-xs-12" id="ZNSELEC5">
                         <option value="-1"></option>
                   </select>
            </div>
            </div>
              <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top:15px;">
            <label class=" col-md-2 col-sm-2 col-xs-12" >Ciudad<span>*:</span>
            </label>
            <div class=" col-md-10 col-sm-10 col-xs-12">
                   <select class="js-example-basic-single form-control col-md-12 col-sm-12 col-xs-12" id="ZNSELEC6">
                         <option value="-1"></option>
                   </select>
            </div>
            </div>
              <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top:15px;">
            <label class=" col-md-2 col-sm-2 col-xs-12" >C.P.<span>*:</span>
            </label>
            <div class=" col-md-10 col-sm-10 col-xs-12">
                   <select class="js-example-basic-single form-control col-md-12 col-sm-12 col-xs-12" id="ZNSELECCPP">
                         <option value="-1"></option>
                   </select>
            </div>
            </div>
          <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top:15px;">
            <label class=" col-md-2 col-sm-2 col-xs-12" >Activo<span>*:</span>
            </label>
            <div class=" col-md-10 col-sm-10 col-xs-12">
                   <input id="checkss" name="checkss" type="checkbox" class="icheck" >
            </div>
            </div> 
               </div>
      </div>
      <div class="modal-footer" >
        <button class="btn btn-default" type="button"  data-dismiss="modal">Cancelar</button>

        <button type="button" class="btn btn-success"  onclick="actualizar();">Guardar</button ">
      </div>
        
                  
      
    </div>
  </div>
</div>

<%-- End Modal --%>


   
    <script type="text/javascript">
        var inicio = true;
        var GBLIDZONA = -1;
        var GBLIDEST = -1;
        var GBLIDCD = -1;
        var GBLIDCOL = -1;
        //Inicializar Cargar zonas y colonias
        $(document).ready(function () {
           // $("#ZNSELEC3").select2();
            llenarZona();
            llenarEdo();
            llenaCd();
            llenaCP();
            llenaAs();
            actualizaTabla();
        });
        function llenarZona() {
            $('#ZNSELEC').html('"<option value="-1"></option>"');
            $('#ZNSELEC option:contains("")').attr('selected', 'selected');
            $('#ZNSELEC4').html('"<option value="-1"></option>"');
            $('#ZNSELEC4 option:contains("")').attr('selected', 'selected');
            $('#zonaFil').html('"<option value="-1"></option>"');
            $('#zonaFil option:contains("")').attr('selected', 'selected');

            //$('#ZNSELEC2').html('"<option value="-1">Primero: seleccione una zona.</option>"');
            //$('#ZNSELEC3').html('"<option value="-1">Primero: seleccione un estado.</option>"');
            $.ajax({
                type: "POST",
                url: "Ciudades.aspx/CargarDatosZonas",
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
                                $('#ZNSELEC4').append('<option value="' + parsedTest[i]['idz'] + '">' + parsedTest[i]['nombre'] + '</option>');
                                $('#zonaFil').append('<option value="' + parsedTest[i]['idz'] + '">' + parsedTest[i]['nombre'] + '</option>');
                            } else {
                            }
                        }
                    } else {
                    }
                }, error: function (error) {
                    console.log("ERROR: " + error);
                }
            });
            $('#ZNSELEC option:contains("")').attr('selected', 'selected');
        }
        function llenarEdo() {
            $('#ZNSELEC2').html('"<option value="-1"></option>"');
            $('#ZNSELEC5').html('"<option value="-1"></option>"');
            $('#estadoFil').html('"<option value="-1"></option>"');
            $('#ZNSELEC2 option:contains("")').attr('selected', 'selected');
            $('#ZNSELEC5 option:contains("")').attr('selected', 'selected');
            $('#estadoFil option:contains("")').attr('selected', 'selected');

            $.ajax({
                type: "POST",
                url: "Ciudades.aspx/CargarDatosEstad",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d.Result) {


                        var parsedTest = JSON.parse(response.d.Data);

                        var metodo = "";
                        for (var i = 0; i < parsedTest.length; i++) {
                            if (parsedTest[i]['estado']) {
                                $('#ZNSELEC2').append('<option value="' + parsedTest[i]['idz'] + '">' + parsedTest[i]['nombre'] + '</option>');
                                $('#ZNSELEC5').append('<option value="' + parsedTest[i]['idz'] + '">' + parsedTest[i]['nombre'] + '</option>');
                                $('#estadoFil').append('<option value="' + parsedTest[i]['idz'] + '">' + parsedTest[i]['nombre'] + '</option>');
                            } else {

                            }

                        }

                    } else {


                    }



                }, error: function (error) {
                    console.log("ERROR: " + error);
                }
            });
           
        }
        function llenaCd() {
            $('#ZNSELEC3').html('"<option value="-1"></option>"');
            $('#ZNSELEC6').html('"<option value="-1"></option>"');
            $('#ciudadFil').html('"<option value="-1"></option>"');
            $('#ZNSELEC3 option:contains("")').attr('selected', 'selected');
            $('#ZNSELEC6 option:contains("")').attr('selected', 'selected');
            $('#ciudadFil option:contains("")').attr('selected', 'selected');

            $.ajax({
                type: "POST",
                url: "Ciudades.aspx/CargarDatos",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d.Result) {


                        var parsedTest = JSON.parse(response.d.Data);

                        var metodo = "";
                        for (var i = 0; i < parsedTest.length; i++) {
                            if (parsedTest[i]['estado']) {
                                $('#ZNSELEC3').append('<option value="' + parsedTest[i]['idz'] + '">' + parsedTest[i]['nombre'] + '</option>');
                                $('#ZNSELEC6').append('<option value="' + parsedTest[i]['idz'] + '">' + parsedTest[i]['nombre'] + '</option>');
                                $('#ciudadFil').append('<option value="' + parsedTest[i]['idz'] + '">' + parsedTest[i]['nombre'] + '</option>');
                                
                            } else {

                            }

                        }

                    } else {


                    }



                }, error: function (error) {
                    console.log("ERROR: " + error);
                }
            });
            
        }
        function llenaCP() {
            $('#codigoFil').html('"<option value="-1"></option>"');
            $('#ciudadFil option:contains("")').attr('selected', 'selected');
            $('#ZNSELEC32').html('"<option value="-1"></option>"');
            $('#ZNSELEC32 option:contains("")').attr('selected', 'selected');
            $('#ZNSELECCPP').html('"<option value="-1"></option>"');
            $('#ZNSELECCPP option:contains("")').attr('selected', 'selected');
            
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
                                
                                $('#codigoFil').append('<option value="' + parsedTest[i]['idz'] + '">' + parsedTest[i]['nombre'] + '</option>');
                                $('#ZNSELEC32').append('<option value="' + parsedTest[i]['idz'] + '">' + parsedTest[i]['nombre'] + '</option>');
                                $('#ZNSELECCPP').append('<option value="' + parsedTest[i]['idz'] + '">' + parsedTest[i]['nombre'] + '</option>');
                            } else {

                            }

                        }

                    } else {


                    }



                }, error: function (error) {
                    console.log("ERROR: " + error);
                }
            });

        }
  
        function llenaAs() {
            $('#ZNSELEC12').html('"<option value="-1"></option>"');
            $('#ZNSELEC12 option:contains("")').attr('selected', 'selected');
            $('#ZNSELEC123').html('"<option value="-1"></option>"');
            $('#ZNSELEC123 option:contains("")').attr('selected', 'selected');

            $.ajax({
                type: "POST",
                url: "Colonias.aspx/CargarDatosAs",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d.Result) {


                        var parsedTest = JSON.parse(response.d.Data);

                        var metodo = "";
                        for (var i = 0; i < parsedTest.length; i++) {
                            if (parsedTest[i]['estado']) {

                                $('#ZNSELEC12').append('<option value="' + parsedTest[i]['idz'] + '">' + parsedTest[i]['nombre'] + '</option>');
                                $('#ZNSELEC123').append('<option value="' + parsedTest[i]['idz'] + '">' + parsedTest[i]['nombre'] + '</option>');

                            } else {

                            }

                        }

                    } else {


                    }



                }, error: function (error) {
                    console.log("ERROR: " + error);
                }
            });

        }
        function actualizaTabla() {
            if (!inicio) $("#tab").dataTable().fnDestroy();
            $("#tab tbody").html("");
            $.ajax({
                type: "POST",
                url: "Colonias.aspx/CargarDatos",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d.Result) {
                        var parsedTest = JSON.parse(response.d.Data);
                        var metodo = "";
                        for (var i = 1; i < parsedTest.length; i++) {
                            if (parsedTest[i]['estado']) {
                                metodo = '<span class="label label-success">SI</span>';
                            } else {
                                metodo = '<span class="label label-danger">NO</span>';//zona
                            }
                            $('#tab tbody').append('<tr>' + '<td hidden>' + parsedTest[i]['idz'] + '</td><td>' + parsedTest[i]['nombre'] + '</td><td style="text-align: center;">' + parsedTest[i]['cd'] + '</td><td style="text-align: center;">' + parsedTest[i]['std'] + '</td><td style="text-align: center;">' + parsedTest[i]['zona'] + '</td><td style="text-align: center;">' + metodo + '</td><td style="text-align: center;"><button type="button" class="btn btn-default btn-xs" onclick="carga(' + parsedTest[i]['idz'] + ')"><i class="fa fa-pencil"></i></button></td></tr>');
                        }
                        $("#tab").trigger("update").trigger("appendCache");
                        $("#tab").dataTable({
                            'language': { 'url': '//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json' },
                            buttons: [
                                { extend: 'print', className: 'btn dark btn-outline' },
                                { extend: 'pdf', className: 'btn green btn-outline' },
                                { extend: 'csv', className: 'btn purple btn-outline ' }
                            ],
                            responsive: {
                                details: {
                                }
                            },
                            "order": [
                                [2, 'asc']
                            ],
                            "lengthMenu": [
                                [5, 10, 50, 100, -1],
                                [5, 10, 50, 100, "Todos"]
                            ],
                            "pageLength": 10,
                            "dom": "<'row' <'col-md-12'B>><'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r><'table-scrollable't><'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>",
                        });
                        inicio = false;
                    } else {
                    }
                }, error: function (error) {
                    console.log("ERROR: " + error);
                }
            });
        }
        $("select[id=zonaFil]").change(function () {
           
            llenarEdo();
            llenaCd();
            llenaCP();
            llenaAs();
            var VALOR = $('#zonaFil').val();
            if (VALOR == '-1') {
            } else {
                if (!inicio) $("#tab").dataTable().fnDestroy();
                $("#tab tbody").html("");
                $.ajax({
                    type: "POST",
                    url: "Colonias.aspx/CargarDatos2",
                    data: '{ id:' + VALOR + ',tipo:1 }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d.Result) {
                            var parsedTest = JSON.parse(response.d.Data);
                            var metodo = "";
                            for (var i = 0; i < parsedTest.length; i++) {
                                if (parsedTest[i]['estado']) {
                                    metodo = '<span class="label label-success">SI</span>';
                                } else {
                                    metodo = '<span class="label label-danger">NO</span>';//zona
                                }
                                $('#tab tbody').append('<tr>' + '<td hidden>' + parsedTest[i]['idz'] + '</td><td>' + parsedTest[i]['nombre'] + '</td><td style="text-align: center;">' + parsedTest[i]['cd'] + '</td><td style="text-align: center;">' + parsedTest[i]['std'] + '</td><td style="text-align: center;">' + parsedTest[i]['zona'] + '</td><td style="text-align: center;">' + metodo + '</td><td style="text-align: center;"><button type="button" class="btn btn-default btn-xs" onclick="carga(' + parsedTest[i]['idz'] + ')"><i class="fa fa-pencil"></i></button></td></tr>');
                            }
                            $("#tab").trigger("update").trigger("appendCache");
                            $("#tab").dataTable({
                                'language': { 'url': '//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json' },
                                buttons: [
                                    { extend: 'print', className: 'btn dark btn-outline' },
                                    { extend: 'pdf', className: 'btn green btn-outline' },
                                    { extend: 'csv', className: 'btn purple btn-outline ' }
                                ],
                                responsive: {
                                    details: {
                                    }
                                },
                                "order": [
                                    [0, 'asc']
                                ],
                                "lengthMenu": [
                                    [5, 10, 50, 100, -1],
                                    [5, 10, 50, 100, "Todos"]
                                ],
                                "pageLength": 10,
                                "dom": "<'row' <'col-md-12'B>><'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r><'table-scrollable't><'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>",
                            });
                            inicio = false;
                        } else {
                        }
                    },
                    error: function (error) {
                        console.log("ERROR: " + error);
                    }
                });

            }
        });
        $("select[id=estadoFil]").change(function () {
            llenarZona();
            
            llenaCd();
            llenaCP();
            llenaAs();
            var VALOR = $('#estadoFil').val();
            if (VALOR == '-1') {
            } else {
                if (!inicio) $("#tab").dataTable().fnDestroy();
                $("#tab tbody").html("");
                $.ajax({
                    type: "POST",
                    url: "Colonias.aspx/CargarDatos2",
                    data: '{ id:' + VALOR + ',tipo:1 }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d.Result) {
                            var parsedTest = JSON.parse(response.d.Data);
                            var metodo = "";
                            for (var i = 0; i < parsedTest.length; i++) {
                                if (parsedTest[i]['estado']) {
                                    metodo = '<span class="label label-success">SI</span>';
                                } else {
                                    metodo = '<span class="label label-danger">NO</span>';//zona
                                }
                                $('#tab tbody').append('<tr>' + '<td hidden>' + parsedTest[i]['idz'] + '</td><td>' + parsedTest[i]['nombre'] + '</td><td style="text-align: center;">' + parsedTest[i]['cd'] + '</td><td style="text-align: center;">' + parsedTest[i]['std'] + '</td><td style="text-align: center;">' + parsedTest[i]['zona'] + '</td><td style="text-align: center;">' + metodo + '</td><td style="text-align: center;"><button type="button" class="btn btn-default btn-xs" onclick="carga(' + parsedTest[i]['idz'] + ')"><i class="fa fa-pencil"></i></button></td></tr>');
                            }
                            $("#tab").trigger("update").trigger("appendCache");
                            $("#tab").dataTable({
                                'language': { 'url': '//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json' },
                                buttons: [
                                    { extend: 'print', className: 'btn dark btn-outline' },
                                    { extend: 'pdf', className: 'btn green btn-outline' },
                                    { extend: 'csv', className: 'btn purple btn-outline ' }
                                ],
                                responsive: {
                                    details: {
                                    }
                                },
                                "order": [
                                    [0, 'asc']
                                ],
                                "lengthMenu": [
                                    [5, 10, 50, 100, -1],
                                    [5, 10, 50, 100, "Todos"]
                                ],
                                "pageLength": 10,
                                "dom": "<'row' <'col-md-12'B>><'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r><'table-scrollable't><'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>",
                            });
                            inicio = false;
                        } else {
                        }
                    },
                    error: function (error) {
                        console.log("ERROR: " + error);
                    }
                });

            }
        });
        $("select[id=ciudadFil]").change(function () {
            llenarZona();
            llenarEdo();
            
            llenaCP();
            llenaAs();
            var VALOR = $('#ciudadFil').val();
            if (VALOR == '-1') {
            } else {
                if (!inicio) $("#tab").dataTable().fnDestroy();
                $("#tab tbody").html("");
                $.ajax({
                    type: "POST",
                    url: "Colonias.aspx/CargarDatos2",
                    data: '{ id:' + VALOR + ',tipo:1 }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d.Result) {
                            var parsedTest = JSON.parse(response.d.Data);
                            var metodo = "";
                            for (var i = 0; i < parsedTest.length; i++) {
                                if (parsedTest[i]['estado']) {
                                    metodo = '<span class="label label-success">SI</span>';
                                } else {
                                    metodo = '<span class="label label-danger">NO</span>';//zona
                                }
                                $('#tab tbody').append('<tr>' + '<td hidden>' + parsedTest[i]['idz'] + '</td><td>' + parsedTest[i]['nombre'] + '</td><td style="text-align: center;">' + parsedTest[i]['cd'] + '</td><td style="text-align: center;">' + parsedTest[i]['std'] + '</td><td style="text-align: center;">' + parsedTest[i]['zona'] + '</td><td style="text-align: center;">' + metodo + '</td><td style="text-align: center;"><button type="button" class="btn btn-default btn-xs" onclick="carga(' + parsedTest[i]['idz'] + ')"><i class="fa fa-pencil"></i></button></td></tr>');
                            }
                            $("#tab").trigger("update").trigger("appendCache");
                            $("#tab").dataTable({
                                'language': { 'url': '//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json' },
                                buttons: [
                                    { extend: 'print', className: 'btn dark btn-outline' },
                                    { extend: 'pdf', className: 'btn green btn-outline' },
                                    { extend: 'csv', className: 'btn purple btn-outline ' }
                                ],
                                responsive: {
                                    details: {
                                    }
                                },
                                "order": [
                                    [0, 'asc']
                                ],
                                "lengthMenu": [
                                    [5, 10, 50, 100, -1],
                                    [5, 10, 50, 100, "Todos"]
                                ],
                                "pageLength": 10,
                                "dom": "<'row' <'col-md-12'B>><'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r><'table-scrollable't><'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>",
                            });
                            inicio = false;
                        } else {
                        }
                    },
                    error: function (error) {
                        console.log("ERROR: " + error);
                    }
                });

            }
        });
        $("select[id=codigoFil]").change(function () {
            llenarZona();
            llenarEdo();
            llenaCd();
            
            llenaAs();
            var VALOR = $('#codigoFil').val();
            if (VALOR == '-1') {
            } else {
                if (!inicio) $("#tab").dataTable().fnDestroy();
                $("#tab tbody").html("");
                $.ajax({
                    type: "POST",
                    url: "Colonias.aspx/CargarDatos2",
                    data: '{ id:' + VALOR + ',tipo:4 }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d.Result) {
                            var parsedTest = JSON.parse(response.d.Data);
                            var metodo = "";
                            for (var i = 0; i < parsedTest.length; i++) {
                                if (parsedTest[i]['estado']) {
                                    metodo = '<span class="label label-success">SI</span>';
                                } else {
                                    metodo = '<span class="label label-danger">NO</span>';//zona
                                }
                                $('#tab tbody').append('<tr>' + '<td hidden>' + parsedTest[i]['idz'] + '</td><td>' + parsedTest[i]['nombre'] + '</td><td style="text-align: center;">' + parsedTest[i]['cd'] + '</td><td style="text-align: center;">' + parsedTest[i]['std'] + '</td><td style="text-align: center;">' + parsedTest[i]['zona'] + '</td><td style="text-align: center;">' + metodo + '</td><td style="text-align: center;"><button type="button" class="btn btn-default btn-xs" onclick="carga(' + parsedTest[i]['idz'] + ')"><i class="fa fa-pencil"></i></button></td></tr>');
                            }
                            $("#tab").trigger("update").trigger("appendCache");
                            $("#tab").dataTable({
                                'language': { 'url': '//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json' },
                                buttons: [
                                    { extend: 'print', className: 'btn dark btn-outline' },
                                    { extend: 'pdf', className: 'btn green btn-outline' },
                                    { extend: 'csv', className: 'btn purple btn-outline ' }
                                ],
                                responsive: {
                                    details: {
                                    }
                                },
                                "order": [
                                    [0, 'asc']
                                ],
                                "lengthMenu": [
                                    [5, 10, 50, 100, -1],
                                    [5, 10, 50, 100, "Todos"]
                                ],
                                "pageLength": 10,
                                "dom": "<'row' <'col-md-12'B>><'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r><'table-scrollable't><'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>",
                            });
                            inicio = false;
                        } else {
                        }
                    },
                    error: function (error) {
                        console.log("ERROR: " + error);
                    }
                });

            }
        });

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
        });
        function Guardar() {
            // Nombre zona estado ciudad
            //Nombre
            var  res= $.trim($("#nombreCol").val());
            var Nombre = res.toUpperCase();
            //Zona
            var IDZon = $("#ZNSELEC").val();
            //Estado
            var IDEst = $("#ZNSELEC2").val();
            //Ciudad
            var IDCd = $("#ZNSELEC3").val();
            //CP
            var IDCP = $("#ZNSELEC32").val();
            //As
            var IDAS = $("#ZNSELEC12").val();

            if (Nombre == "") {
                toastr.error("Ingrese un nombre.", "Advertencia");
            } else {
                if (IDZon <= 0 || IDEst <= 0 || IDCd <= 0 || IDCP <= 0 || IDAS <= 0) {

                    toastr.error("Faltan campos, la colonia se almacenara con campos faltantes *Zona, Estado ,Ciudad, C.P. o Asentamiento.", "Advertencia");
                } else
                if (IDZon<=0) {
                    IDZon = 1;
                } else if (IDEst<=0) {
                    IDEst = 1;
                } else if (IDCd<=0) {
                    IDCd = 1;
                } else if (IDCP <= 0) {
                    IDCP = 1;
                } else if (IDAS <= 0) {
                    IDAS = 1;
                } else {
                    //Guardar
                    $.ajax({
                        type: "POST",
                        url: "Colonias.aspx/GuardaCol",
                        data: '{ Nombre:"' + Nombre + '", Zona:' + IDZon + ',Edo:' + IDEst + ',Cd:' + IDCd + ',CP:' + IDCP + ',AS:' + IDAS + ' }',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            if (response.d.Result) {
                                
                                $("#nombreCol").val('');
                                llenarZona();
                                llenarEdo();
                                llenaCd();
                                llenaCP();
                                llenaAs();
                                actualizaTabla();
                                toastr.success("La colonia ha sido agregada correctamente", "Éxito");
                            } else {
                                toastr.error("No es posible agregar esta colonia.", "Advertencia");
                                llenarZona();
                                llenarEdo();
                                llenaCd();
                                llenaCP();
                                llenaAs();
                                actualizaTabla();
                            }
                        },
                        error: function (error) {
                            console.log("ERROR: " + error);
                        }
                    });
                }
            }
        }

        function carga(idCol) {
            GBLIDCOL = idCol;

            $.ajax({
                type: "POST",
                url: "Colonias.aspx/Unacol",
                data: '{ Id:"' + idCol + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d.Result) {
                        var parsedTest = JSON.parse(response.d.Data);
                        var metodo = "";
                        for (var i = 0; i < parsedTest.length; i++) {
                            //Nombre Colonia
                            $("#txtZona").val(parsedTest[i]['nombre']);
                            //Zona
                            var zn = parsedTest[i]['zona'];
                            var as = parsedTest[i]['asentamiento'];
                            var csp = parsedTest[i]['CP'];
                            $('#ZNSELEC4 option:contains("' + zn + '")').attr('selected', 'selected');
                            $('#ZNSELECCPP option:contains("' + csp + '")').attr('selected', 'selected');
                            $('#ZNSELEC123 option:contains("' + as + '")').attr('selected', 'selected');
                            //Estado
                            var esd = parsedTest[i]['std'];
                            var esdid = parsedTest[i]['stdid'];
                            $('#ZNSELEC5').html('<option value="' + esdid + '">' + esd + '</option>');
                            //Ciudad
                            var CDS = parsedTest[i]['cd'];
                            var cdsid = parsedTest[i]['cdsid'];
                            $('#ZNSELEC6').html('<option value="' + cdsid + '">' + CDS + '</option>');
                            //Acivo
                            if (parsedTest[i]['estado']) {
                                $("#checkss").iCheck('check');
                            } else {
                                $("#checkss").iCheck('uncheck');
                            }
                        }
                        $('#mdAgrega').modal('show');
                    }
                },
                error: function (error) {
                    console.log("ERROR: " + error);
                }
            });
            $('#mdAgrega').modal('show');
        }
        $("select[id=ZNSELEC4]").change(function () {// Modal ZOna
            var VALOR = $('#ZNSELEC4').val();
            $('#ZNSELEC5').html('"<option value="-1"></option>"');
            $('#ZNSELEC6').html('"<option value="-1"></option>"');
            $('#ZNSELEC5 option:contains("")').attr('selected', 'selected');
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
        $("select[id=ZNSELEC5]").change(function () {// modal estados
            var VALOR = $('#ZNSELEC5').val();
            $('#ZNSELEC6').html('"<option value="-1"></option>"');
            $('#ZNSELEC6 option:contains("")').attr('selected', 'selected');
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
                                    $('#ZNSELEC6').append('<option value="' + parsedTest[i]['idz'] + '">' + parsedTest[i]['nombre'] + '</option>');
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
        function actualizar() {
            //Nombre
            var res = $.trim($("#txtZona").val());
            var Nombre = res.toUpperCase();
            //Zona
            GBLIDZONA = $('#ZNSELEC4').val();
            //Estado
            GBLIDEST = $('#ZNSELEC5').val();
            //Ciudad
            GBLIDCD = $('#ZNSELEC6').val();
            //TIPO
            var tipoAS = $('#ZNSELEC123').val();
            //CP
            var codeP = $('#ZNSELECCPP').val();
            //Activo
            var activo = true;
            var Activo = document.getElementById('checkss');
            if (Activo.checked) {
                activo = true;
            } else {
                activo = false;
            }

            //alert(Nombre);
            //alert(GBLIDZONA);
            //alert(GBLIDEST);
            //alert(GBLIDCD);
            //alert(GBLIDCOL);
            //alert(activo);
            if (GBLIDEST < 0) {
                toastr.error("Seleccione un estado.", "Advertencia");
            } else {
                if (GBLIDCD < 0) {
                    toastr.error("Seleccione una ciudad.", "Advertencia");
                } else {

                
                    //Hubo cambios
                    $.ajax({
                        type: "POST",
                        url: "Colonias.aspx/UnacolAct",
                        data: '{ Id:' + GBLIDCOL + ',idZ:' + GBLIDZONA + ',idE:' + GBLIDEST + ',idC:'+GBLIDCD+',Nombre:"' + Nombre + '",stado:' + activo + ',TA:'+tipoAS+',CP:'+codeP+' }',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            if (response.d.Result) {
                                
                                llenarZona();
                                llenarEdo();
                                llenaCd();
                                llenaCP();
                                llenaAs();
                                actualizaTabla();
                                $('#mdAgrega').modal('hide');
                                toastr.success("La colonia ha sido actualizada correctamente", "Éxito");
                            }
                        },
                        error: function (error) {
                            console.log("ERROR: " + error);
                        }
                    });
                }
            }
        }
    </script>
   
</asp:Content>
