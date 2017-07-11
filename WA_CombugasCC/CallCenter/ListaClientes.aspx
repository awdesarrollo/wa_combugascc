<%@ Page Title="" Language="C#" MasterPageFile="~/CallCenter/CallCenter.Master" AutoEventWireup="true" CodeBehind="ListaClientes.aspx.cs" Inherits="WA_CombugasCC.CallCenter.ListaClientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-container" >
            <div class="page-content-wrapper">
                <div class="page-head">
                    <div class="container">
                        <div class="page-title">
                            <h1>Lista de Clientes</h1>
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
                                <span>Lista de Clientes</span>
                            </li>
                        </ul>
                        <div class="page-content-inner" style="min-height: 400px;">
                            <div class="row">
                               

                                <div class="col-md-12 col-sm-12">
                                    <div class="portlet light ">
                                        <div class="portlet-title">
                                            <div class="caption caption-md">
                                                Clientes
                                            </div>
                                        </div>
                                        <div class="portlet-body">
                                          <table class="table table-striped table-bordered table-hover dt-responsive" width="100%" id="tab" cellspacing="0" width="100%">
                                                <thead>
                                                    <tr>
                                                        <th class="all">Nombre Completo</th>
                                                        <th class="all" style="text-align: center;">Tipo de Cliente</th>
                                                        <th class="all" style="text-align: center;">Estatus</th>
                                                        <th class="all" style="text-align: center;">Direccion(es)</th>
                                                        <th class="all" style="text-align: center;">Telefono(s)</th>
                                                        <th class="all" style="text-align: center;">Modificar</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>











                                 <div class="col-md-12 col-sm-12" id="MuestaDir" style="display:none;">
                                    <div class="portlet light ">
                                        <div class="portlet-title">
                                            <div class="caption caption-md">
                                                Direccion(es) del cliente 
                                            </div>
                                        </div>
                                        <div class="portlet-body">
                                          <table class="table table-striped table-bordered table-hover dt-responsive" width="100%" id="tab2" cellspacing="0" width="100%">
                                                <thead>
                                                    <tr>
                                                        <th class="all">Dirreccion</th>
                                                        <th class="all" style="text-align: center;">Estatus</th>
                                                        <th class="all" style="text-align: center;">Modificar</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                </tbody>
                                            </table>
                                            <div class="row">
                                                            
                                                            <button id="cerr2" class="btn btn-default pull-right" type="button" style="margin-top:15px !important; margin-right:15px;" onclick="CancelarEDICION();">Cancelar</button>&nbsp;
                                                  
                                            </div>
                                        </div>
                                    </div>
                                </div>




                                <div class="col-md-12 col-sm-12" id="MuestaTel" style="display:none;">
                                    <div class="portlet light ">
                                        <div class="portlet-title">
                                            <div class="caption caption-md">
                                                Telefono(s) del cliente 
                                            </div>
                                        </div>
                                        <div class="portlet-body">
                                          <table class="table table-striped table-bordered table-hover dt-responsive" width="100%" id="tab3" cellspacing="0" width="100%">
                                                <thead>
                                                    <tr>
                                                        <th class="all"># Telefónico</th>
                                                        <th class="all" style="text-align: center;">Tipo</th>
                                                        <th class="all" style="text-align: center;">Estatus</th>
                                                        <th class="all" style="text-align: center;">Modificar</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                </tbody>
                                            </table>
                                            <div class="row">
                                                            
                                                            <button id="cerr" class="btn btn-default pull-right" type="button" style="margin-top:15px !important; margin-right:15px;" onclick="CancelarEDICION();">Cancelar</button>&nbsp;
                                                  
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <div class="col-md-12 col-sm-12" id="MuestaDAT" style="display:none;">
                                    <div class="portlet light ">
                                        <div class="portlet-title">
                                            <div class="caption caption-md">
                                                Datos del cliente 
                                            </div>
                                        </div>
                                        <div class="portlet-body">
                                           <div class="row">
                                               <div class="col-md-12 col-sm-12">
                                                    <div class="row">
                                                        <h4 style="margin-top: 5px;margin-left:15px;">Nombre completo del cliente </h4>
                                                    </div>
                                                </div>
                                                <div class="col-md-12 col-sm-12">
                                                    <div class="row">      
                                                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                                            <center><label style="margin-top: 5px;">Nombre(s)</label></center>
                                                            <input id="Nombres" class="form-control" type="text" placeholder=""/>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                                            <center><label style="margin-top: 5px;">Apellido Paterno</label></center>
                                                            <input id="Apellido1s" class="form-control" type="text" placeholder=""/>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                                            <center><label style="margin-top: 5px;">Apellido Materno</label></center>
                                                            <input id="Apellido2s" class="form-control" type="text" placeholder=""/>
                                                        </div>
                                                     </div>
                                                    <div class="row" style="margin-top:20px;">      
                                                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                                            <center><label style="margin-top: 5px;">Usuario</label></center>
                                                            <input id="USERNAME" class="form-control" type="text" placeholder=""/>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">

                                                            <center><label style="margin-top: 5px;">Contraseña</label></center>
                                                            <input id="PASS" class="form-control" type="password" placeholder=""/>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                                            <center><label style="margin-top: 5px;">Activo</label></center>
                                                            <center><input id="checkss" name="checkss" type="checkbox"  class="icheck" style="margin-top:5px;"></center>
                                                        </div>
                                                     </div>
                                                    <div class="row" style="margin-top: 20px;">
                                                      <h4 style="margin-top: 5px;margin-left:15px;">Tipo de cliente</h4>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                        
                                                            <select class="js-example-basic-single form-control col-md-12 col-sm-12 col-xs-12" id="Sel2">
                                                                <option value="-1" ></option>
                                                           
                                                              </select>
                                                        </div>
                                                        <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
                                                            <button class="btn red pull-right" id="btnEditar" type="button" style="margin-top:15px !important;">Modificar</button>&nbsp;
                                                            <button id="btnLim" class="btn btn-default pull-right" type="button" style="margin-top:15px !important; margin-right:15px;" onclick="CancelarEDICION();">Cancelar</button>&nbsp;
                                                  
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
            </div>
            <a href="javascript:;" class="page-quick-sidebar-toggler">
               
            </a>
        </div>





<div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="mdAgrega">
    <div class="modal-dialog modal-full">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span></button>
                <h4 class="modal-title" >Modificar Dirección</h4>
            </div>
            <div class="modal-body" >
                <div class="row" style="margin: 15px;">
                    <div class="row" >
                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                            <label >Zona</label>                          
                            <input type="text" id="ZONA"  class="form-control" />  
                        </div>
                            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                            <label >Estado</label>                              
                            <input id="ESTADO" class="form-control" type="text" />                                                      
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                            <label >Ciudad</label>                          
                            <input id="CIUDAD" class="form-control" type="text" />                                                                       
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                            <label >Colonia</label>                          
                            <input id="COLONIA" class="form-control" type="text" />                                                                       
                        </div>
                    </div>
                    <div class="row" style="margin-top: 20px;">      
                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                            <label >Calle</label>
                            <input id="CALLE" class="form-control" type="text" />
                        </div>                        
                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                            <label >Número Exterior</label>
                            <input id="NoExt" class="form-control" type="text" />
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                            <label >Número Interior</label>
                            <input id="NoInt" class="form-control" type="text" />
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                            <label >Código Postal</label>
                            <input id="CODIGOP" class="form-control" type="text" />
                        </div>
                   
                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                           <center><label >Activo</label></center>
                            <center><input id="checkss3" name="checkss" type="checkbox"  class="icheck" style="margin-top:5px;"></center>
                        </div>
                                                        
                    </div>  
                    <div class="row"  style="margin-top: 20px;">      
                        
                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                            <label >Cercano a:</label>
                            <input id="REFE" class="form-control" type="text" />
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                            <label >Observaciones</label>
                            <input id="OBSERVA" class="form-control" type="text" />
                        </div>
                    </div>
                    

                </div>
            </div>
            <div class="modal-footer" >
                <button class="btn btn-default" type="button"  data-dismiss="modal">Cancelar</button>
                <button  id="bts" type="button" class="btn btn-success"  onclick="actualizarDire();">Guardar</button ">
            </div>        
        </div>
    </div>
</div>



<div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="mdAgregaT">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span></button>
                <h4 class="modal-title" >Modificar No. Telefónico</h4>
            </div>
            <div class="modal-body" >
                <div class="row">
                    <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
                        <center><label style="margin-top: 5px;">No. Telefónico</label></center>
                        <input id="NoTel10" class="form-control" type="text" />
                    </div>
                    <div class="col-md-4 col-sm-12" style="padding-left: 0px;">
                        <center><label style="margin-top: 5px;">Tipo</label></center>
                        <select class="js-example-basic-single form-control col-md-12 col-sm-12 col-xs-12" id="Sel10">
                        
                        </select>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                        <center><label style="margin-top: 5px;">Activo</label></center>
                        <center><input id="checkss2" name="checkss2" type="checkbox"  class="icheck" style="margin-top:5px;"></center>
                    </div>
                    
                </div>
            </div>
            <div class="modal-footer" >
                <button class="btn btn-default" type="button"  data-dismiss="modal">Cancelar</button>
                <button  id="bt" type="button" class="btn btn-success"  onclick="actualizarTel();">Guardar</button>
            </div>        
        </div>
    </div>
</div>













    <script type="text/javascript">
      
        var inicio = true;
        var inicio2 = true;
        var inicio3 = true;
        var GBLID = -1;
        var GBLIDT = -1;
        var GBLIDD = -1;
        var zones = [];
        var states = [];
        var cities = [];
        var cols = [];
        var streets = [];
        var cp = [];
        var IDZONE = 0;
        var IDSTATE = 0;
        var IDCITY = 0;
        var IDCOL = 0;
        var IDSTREETS = 0;
        var IDENT1 = 0; var IDENT2 = 0; var IDENT3 = 0;
        var IDCP = 0;
       
        actualizaTabla();
        LLenaTIPO();
        //cargaServ(); 

        function actualizaTabla() {
            if (!inicio) $("#tab").dataTable().fnDestroy();
            $("#tab tbody").html("");
            //Tabla
            $.ajax({
                type: "POST",
                url: "ListaClientes.aspx/CargarDatos",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) { 
                    if (response.d.Result) {
                        var parsedTest = JSON.parse(response.d.Data);             
                        var metodo = "";

                        for (var i = 0; i < parsedTest.length; i++) {
                            if(parsedTest[i]['estado']){
                                metodo='<span class="label label-success">Activo</span>';
                            }else {
                                metodo='<span class="label label-danger">Inactivo</span>';
                            }
                            $('#tab tbody').append('<tr>' + '<td>' + parsedTest[i]['nombre'] + '</td><td style="text-align: center;">' + parsedTest[i]['tipo'] + '</td><td style="text-align: center;">' +
                                metodo + '</td><td style="text-align: center;"><button type="button" class="btn btn-default btn-xs" onclick="cargaD(' +
                                parsedTest[i]['id'] + ')"><i class="fa fa-eye"></i></button></td>'+ '</td><td style="text-align: center;"><button type="button" class="btn btn-default btn-xs" onclick="cargaT(' +
                                parsedTest[i]['id'] + ')"><i class="fa fa-eye"></i></button></td>' + '</td><td style="text-align: center;"><button type="button" class="btn btn-default btn-xs" onclick="carga(' +
                                parsedTest[i]['id'] + ')"><i class="fa fa-edit"></i></button></td> </tr>');

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
                }
            });
           
        }

        function LLenaTIPO() {
            $('#Sel2').html('<option value="-1"></option>');
            $.ajax({
                type: "POST",
                url: "Tipocliente.aspx/CargarDatos",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d.Result) {
                        var parsedTest = JSON.parse(response.d.Data);

                        for (var i = 0; i < parsedTest.length; i++) {
                            if (parsedTest[i]['estado']) {
                                $('#Sel2').append('<option value="' + parsedTest[i]['id'] + '">' + parsedTest[i]['nombre'] + '</option>"');
                            }

                        }

                    }
                }
            });
        }

        llenarTM();
        function llenarTM(){
            $('#Sel10').html('<option value="CASA">CASA</option><option value="CELULAR">CELULAR</option><option value="OFICINA">OFICINA</option><option value="OTROS">OTROS</option>');
        }

        function CancelarEDICION() {
            document.getElementById('MuestaDir').style.display = 'none';
            document.getElementById('MuestaTel').style.display = 'none';
            document.getElementById('MuestaDAT').style.display = 'none';
            limpiarED();
        }

        function limpiarED() {
            $("#Nombres").val('');
            $("#Apellido1s").val('');
            $("#Apellido2s").val('');
            $("#USERNAME").val('');
            $("#PASS").val('');
            $('#Sel2 option:contains("")').attr('selected', 'selected');
            $("#checkss").iCheck('uncheck');
            $("#NoTel10").val('');
            llenarTM();
            $('#ZONA').val('');
            $('#ESTADO').val('');
            $('#CIUDAD').val('');
            $('#COLONIA').val('');
            $('#CALLE').val('');
            $('#NoInt').val('');
            $('#NoExt').val('');
            $('#CODIGOP').val('');
            
            $('#REFE').val('');
            $('#OBSERVA').val('');
            zones = [];
            states = [];
            cities = [];
            cols = [];
            streets = [];
            cp = [];
            IDZONE = 0;
            IDSTATE = 0;
            IDCITY = 0;
            IDCOL = 0;
            IDSTREETS = 0;
            IDCP = 0;
            IDENT1 = 0;
            IDENT2 = 0;
            IDENT3 = 0;
            llenarSelectZONA();
            document.getElementById('MuestaDir').style.display = 'none';
            document.getElementById('MuestaTel').style.display = 'none';
            document.getElementById('MuestaDAT').style.display = 'none';
            actualizaTabla();
            document.getElementById('bt').disabled = false;
            document.getElementById('bts').disabled = false;
        }

        function cargaD(ID) {
            document.getElementById('MuestaTel').style.display = 'none';
            document.getElementById('MuestaDAT').style.display = 'none';
            if (!inicio2) $("#tab2").dataTable().fnDestroy();
            $("#tab2 tbody").html("");
            $.ajax({
                type: "POST",
                url: "ListaClientes.aspx/DirCli",
                data: '{ Id:"' + ID + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d.Result) {
                        var parsedTest = JSON.parse(response.d.Data);
                        var metodo = "";

                        for (var i = 0; i < parsedTest.length; i++) {
                            if (parsedTest[i]['estado']) {
                                metodo = '<span class="label label-success">Activo</span>';
                            } else {
                                metodo = '<span class="label label-danger">Inactivo</span>';
                            }

                            var dir = "";
                            var num=";"
                            
                          
                            if (parsedTest[i]['no_exterior']!=null) {
                                num = parsedTest[i]['no_exterior'];
                            } else {
                                num = parsedTest[i]['no_interior'];
                            }

                            dir = parsedTest[i]['calle'] + " #" + num + ", " + parsedTest[i]['colonia'] + ", " + parsedTest[i]['cd'] + ", " + parsedTest[i]['edo'] + ", " +
                            parsedTest[i]['codigo'] + ".";


                            $('#tab2 tbody').append('<tr>' + '<td>' + dir + '</td><td style="text-align: center;">'+metodo + '</td><td style="text-align: center;"><button type="button" class="btn btn-default btn-xs" onclick="cargaDIRE(' +
                                parsedTest[i]['id'] + ')"><i class="fa fa-edit"></i></button></td> </tr>');

                        }
                        $("#tab2").trigger("update").trigger("appendCache");
                        $("#tab2").dataTable({
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

                        inicio2 = false;
                    } else {
                    }
                },
                error: function (error) {
                    console.log("ERROR: " + error);
                }
            });
            document.getElementById('MuestaDir').style.display = 'block';
           
        }

        function cargaT(ID) {
            document.getElementById('MuestaDir').style.display = 'none';
            document.getElementById('MuestaDAT').style.display = 'none';
            if (!inicio3) $("#tab3").dataTable().fnDestroy();
            $("#tab3 tbody").html("");
            $.ajax({
                type: "POST",
                url: "ListaClientes.aspx/TelCli",
                data: '{ Id:"' + ID + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d.Result) {
                        var parsedTest = JSON.parse(response.d.Data);
                        var metodo = "";

                        for (var i = 0; i < parsedTest.length; i++) {
                            if (parsedTest[i]['estado']) {
                                metodo = '<span class="label label-success">Activo</span>';
                            } else {
                                metodo = '<span class="label label-danger">Inactivo</span>';
                            }
                            $('#tab3 tbody').append('<tr>' + '<td>' + parsedTest[i]['numero'] + '</td><td style="text-align: center;">' + parsedTest[i]['tipo']
                                + '</td><td style="text-align: center;">' + metodo +
                                '</td><td style="text-align: center;"><button type="button" class="btn btn-default btn-xs" onclick="cargaTELE(' +
                                parsedTest[i]['id'] + ')"><i class="fa fa-edit"></i></button></td> </tr>');

                        }
                        $("#tab3").trigger("update").trigger("appendCache");
                        $("#tab3").dataTable({
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

                        inicio3 = false;
                    } else {
                    }
                },
                error: function (error) {
                    console.log("ERROR: " + error);
                }
            });
            document.getElementById('MuestaTel').style.display = 'block';
        }
        
        function carga(ID) {
            document.getElementById('MuestaDir').style.display = 'none';
            document.getElementById('MuestaTel').style.display = 'none';
            
            GBLID = ID;
          
            $.ajax({
                type: "POST",
                url: "ListaClientes.aspx/UnCli",
                data: '{ Id:"' + ID + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var parsedTest = JSON.parse(response.d.Data);
                    var metodo = "";
                    for (var i = 0; i < parsedTest.length; i++) {
                        $("#Nombres").val(parsedTest[i]['nombre']);
                        $("#Apellido1s").val(parsedTest[i]['ap']);
                        $("#Apellido2s").val(parsedTest[i]['ap2']);
                        $("#USERNAME").val(parsedTest[i]['uss']);
                        $("#PASS").val(parsedTest[i]['pass']);
                        var zn = parsedTest[i]['tipo'];
                        $('#Sel2 option:contains("' + zn + '")').attr('selected', 'selected');
                        if (parsedTest[i]['estado']) {
                            $("#checkss").iCheck('check');
                        } else {
                            $("#checkss").iCheck('uncheck');
                        }
                        $("#USERNAME").focus();
                       
                    }
                },
                error: function (error) {
                    console.log("ERROR: " + error);
                }
            });
            document.getElementById('MuestaDAT').style.display = 'block';
            
        }

        $("#btnEditar").click(function () {
            if (GBLID == -1) {

            } else {
                var res = $("#Nombres").val();
                var nombres1 = res.toUpperCase();
                res=$("#Apellido1s").val();
                var a1 = res.toUpperCase();
                res =$("#Apellido2s").val();
                var a2 = res.toUpperCase();
                var usern = $("#USERNAME").val();
                var passs = $("#PASS").val();
                var tips = $("#Sel2").val();
                var GBactivo = $("#checkss").prop("checked") ? true : false;

                if (nombres1 == "" || a1 == "" || a2 == "" || tips <= 0) {
                    toastr.error("Faltan Campos.", "Advertencia");

                } else {

                    $.ajax({
                        type: "POST",
                        url: "ListaClientes.aspx/Actualizar",
                        data: '{ Id:' + GBLID + ', nombres:"' + nombres1 + '", a1:"' + a1 + '", a2:"' + a2 + '", usern:"' + usern + '", passs:"' + passs + '", tips:"' + tips + '", Activo:' + GBactivo + ' }',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {

                            
                            limpiarED();
                            toastr.success("La unidad ha sido actualizada correctamente", "Éxito");
                        },
                        error: function (error) {
                            console.log("ERROR: " + error);
                        }
                    });
                }

            }
        });

        function cargaTELE(ID) {
            GBLIDT = ID;
            llenarTM();
            $.ajax({
                type: "POST",
                url: "ListaClientes.aspx/UnTELEF",
                data: '{ Id:"' + ID + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var parsedTest = JSON.parse(response.d.Data);
                    var metodo = "";
                    var zn = "";
                    for (var i = 0; i < parsedTest.length; i++) {
                        $("#NoTel10").val(parsedTest[i]['numero']);
                        zn = parsedTest[i]['tipo'];
                        $('#Sel10 option:contains("' + zn + '")').attr('selected', 'selected');
                        if (parsedTest[i]['estado']) {
                            $("#checkss2").iCheck('check');
                        } else {
                            $("#checkss2").iCheck('uncheck');
                        }
                        
                    }
                    $('#mdAgregaT').modal('show');
                    
                },
                error: function (error) {
                    console.log("ERROR: " + error);
                }
            });
            
        }

        function actualizarTel() {
            document.getElementById('bt').disabled = true;
            if (GBLIDT == -1) {

            } else {
                
                var No_t = $("#NoTel10").val();
                var tipos = $("#Sel10").val();
                var GBactivo = $("#checkss2").prop("checked") ? true : false;

                if (No_t == "" || tipos <= 0) {
                    toastr.error("Faltan Campos.", "Advertencia");

                } else {

                    $.ajax({
                        type: "POST",
                        url: "ListaClientes.aspx/ActualizarTEL",
                        data: '{ Id:' + GBLIDT + ', no:"' + No_t + '", tipos:"' + tipos  + '", Activo:' + GBactivo + ' }',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {

                            $('#mdAgregaT').modal('hide');
                            limpiarED();
                            toastr.success("El número telefónico ha sido actualizado correctamente", "Éxito");
                        },
                        error: function (error) {
                            console.log("ERROR: " + error);
                        }
                    });
                }

            }
        }

        function cargaDIRE(ID) {
            GBLIDD = ID;
            $.ajax({
                type: "POST",
                url: "ListaClientes.aspx/UnaDirec",
                data: '{ Id:"' + ID + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var parsedTest = JSON.parse(response.d.Data);
                    var metodo = "";
                    var zn = "";
                    for (var i = 0; i < parsedTest.length; i++) {


                        $('#ZONA').val(parsedTest[i]['id_zona']+"-"+parsedTest[i]['zona']);
                        $('#ESTADO').val(parsedTest[i]['id_estado']+"-"+parsedTest[i]['edo']);
                        $('#CIUDAD').val(parsedTest[i]['id_ciudad']+"-"+parsedTest[i]['cd']);
                        $('#COLONIA').val(parsedTest[i]['id_colonia']+"-"+parsedTest[i]['colonia']);
                        $('#CALLE').val(parsedTest[i]['id_calle']+"-"+parsedTest[i]['calle']);
                        $('#NoInt').val(parsedTest[i]['no_interior']);
                        $('#NoExt').val(parsedTest[i]['no_exterior']);
                        $('#CODIGOP').val(parsedTest[i]['id_cp']+"-"+parsedTest[i]['codigo']);
                       
                        $('#REFE').val(parsedTest[i]['Ref']);
                        $('#OBSERVA').val(parsedTest[i]['Obs']);

                        if (parsedTest[i]['estado']) {
                            $("#checkss3").iCheck('check');
                        } else {
                            $("#checkss3").iCheck('uncheck');
                        }
                       IDZONE = parsedTest[i]['id_zona'];
                       IDSTATE = parsedTest[i]['id_estado'];
                       IDCITY = parsedTest[i]['id_ciudad'];
                       IDCOL = parsedTest[i]['id_colonia'];
                       IDSTREETS = parsedTest[i]['id_calle'];
                       IDCP = parsedTest[i]['id_cp'];


                    }
                    $('#mdAgrega').modal('show');

                },
                error: function (error) {
                    console.log("ERROR: " + error);
                }
            });
           
        }

        function actualizarDire() {
            document.getElementById('bts').disabled = true;
            if (GBLIDD == -1) {

            } else {

          
                var ZONA = IDZONE;
                //ESTADO
                var ESTADO = IDSTATE;
                //CIUDAD
                var CIUDAD = IDCITY;
                //COLONIA
                var COLONIA = IDCOL;
                //CALLE
                var CALLE = IDSTREETS;
                // NO INTERIOR
                var noInt = $("#NoInt").val();
                //NO EXTERIOR
                var noExt = $("#NoExt").val();
                // CP
                var CPL = IDCP;
           
                //CERCANO A
                var Ref = $("#REFE").val();
                //Observaciones
                var OB = $('#OBSERVA').val();
                
                var GBactivo = $("#checkss3").prop("checked") ? true : false;

                if (ZONA == 0 || ESTADO == 0 || CIUDAD == 0 || COLONIA == 0 || CALLE == 0) {
                    toastr.error("Faltan Campos.", "Advertencia");

                } else {

                    $.ajax({
                        type: "POST",
                        url: "ListaClientes.aspx/ActualizarDir",
                        data: JSON.stringify({Id:GBLIDD,
                            ZONA: ZONA, ESTADO: ESTADO,
                            CIUDAD: CIUDAD, COLONIA: COLONIA, CALLE: CALLE, noInt: noInt, noExt: noExt, CPL: CPL, Ref: Ref, OB: OB, Activo: GBactivo
                        }),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            if (response.d.Result) {
                                limpiarED();
                                toastr.success("El cliente ha sido agregado correctamente", "Éxito");
                                $('#mdAgrega').modal('hide');
                            } else {
                                toastr.error("No es posible agregar.", "Advertencia");
                                limpiarED();
                            }
                        },
                        error: function (error) {
                            console.log("ERROR: " + error);
                        }
                    });
                }

            }
        }


       
        //**********************************************************************************************************************************************************DIRECCION

        llenarSelectZONA();
        function llenarSelectZONA() {
           
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
                                
                                zones[i] = parsedTest[i]['idz'] + "-" + parsedTest[i]['nombre'];
                            }
                        }

                    }
                }, error: function (error) {
                    console.log("ERROR: " + error);
                }
            });

        }
        //*****************************************************************************************************Busqeda
        var substringMatcher = function (strs) {
            return function findMatches(q, cb) {
                var matches, substringRegex;
                // an array that will be populated with substring matches
                matches = [];
                // regex used to determine if a string contains the substring `q`
                substrRegex = new RegExp(q, 'i');
                // iterate through the pool of strings and for any string that
                // contains the substring `q`, add it to the `matches` array
                $.each(strs, function (i, str) {
                    if (substrRegex.test(str)) {
                        matches.push(str);
                    }
                });
                cb(matches);
            };
        };
        //*****************************************************************************************************Busqeda
        //******************************************************************************************************ZONAS
        $('#ZONA').typeahead({
            hint: true,
            highlight: true,
            minLength: 1
        },
        {
            name: 'zones',
            source: substringMatcher(zones)
        }).on('typeahead:selected', function (obj, datum) {
            var fields = datum.split("-");
            IDZONE = fields[0];
            //LLamar Carga estado por zona
            llenarEDO(IDZONE);
        });
        //******************************************************************************************************ZONAS
        //******************************************************************************************************ESTADO
        function llenarEDO(VALOR) {
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
                                    //$('#ZNSELEC2').append('<option value="' + parsedTest[i]['idz'] + '">' + parsedTest[i]['nombre'] + '</option>');
                                    states[i] = parsedTest[i]['idz'] + "-" + parsedTest[i]['nombre'];
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
        }
        $('#ESTADO').typeahead({
            hint: true,
            highlight: true,
            minLength: 1
        },
        {
            name: 'states',
            source: substringMatcher(states)
        }).on('typeahead:selected', function (obj, datum) {
            var fields = datum.split("-");
            IDSTATE = fields[0];

            //LLamar Carga estado por zona
            llenarCD(IDSTATE);
        });
        //******************************************************************************************************ESTADO
        //******************************************************************************************************CIUDAD
        function llenarCD(VALOR) {
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
                                    // $('#ZNSELEC3').append('<option value="' + parsedTest[i]['idz'] + '">' + parsedTest[i]['nombre'] + '</option>');
                                    cities[i] = parsedTest[i]['idz'] + "-" + parsedTest[i]['nombre'];
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
        }
        $('#CIUDAD').typeahead({
            hint: true,
            highlight: true,
            minLength: 1
        },
        {
            name: 'cities',
            source: substringMatcher(cities)
        }).on('typeahead:selected', function (obj, datum) {
            var fields = datum.split("-");
            IDCITY = fields[0];

            //LLamar Carga estado por zona
            llenarCOL(IDCITY);
        });
        //******************************************************************************************************CIUDAD
        //******************************************************************************************************COL
        function llenarCOL(VALOR) {
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
                                    //$('#ZNSELEC4').append('<option value="' + parsedTest[i]['idz'] + '">' + parsedTest[i]['nombre'] + '</option>');
                                    cols[i] = parsedTest[i]['idz'] + "-" + parsedTest[i]['nombre'];
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
        }
        $('#COLONIA').typeahead({
            hint: true,
            highlight: true,
            minLength: 1
        },
        {
            name: 'cols',
            source: substringMatcher(cols)
        }).on('typeahead:selected', function (obj, datum) {
            var fields = datum.split("-");
            IDCOL = fields[0];

            //LLamar Carga estado por zona
            llenarCA(IDCOL);
        });
        //******************************************************************************************************COL
        //******************************************************************************************************CALLE
        function llenarCA(VALOR) {
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
                                    //$('#ZNSELEC4').append('<option value="' + parsedTest[i]['idz'] + '">' + parsedTest[i]['nombre'] + '</option>');
                                    streets[i] = parsedTest[i]['idz'] + "-" + parsedTest[i]['nombre'];
                                }
                            }
                        }
                    },
                    error: function (error) {
                        console.log("ERROR: " + error);
                    }
                });

            }
        }
        $('#CALLE').typeahead({
            hint: true,
            highlight: true,
            minLength: 1
        },
           {
               name: 'streets',
               source: substringMatcher(streets)
           }).on('typeahead:selected', function (obj, datum) {
               var fields = datum.split("-");
               IDSTREETS = fields[0];

               //LLamar Carga estado por zona
               //llenarCA(IDCOL);
           });
        $('#ENTCALLE1').typeahead({
            hint: true,
            highlight: true,
            minLength: 1
        },
           {
               name: 'streets',
               source: substringMatcher(streets)
           }).on('typeahead:selected', function (obj, datum) {
               var fields = datum.split("-");
               IDENT1 = fields[0];

               //LLamar Carga estado por zona
               //llenarCA(IDCOL);
           });
        $('#ENTCALLE2').typeahead({
            hint: true,
            highlight: true,
            minLength: 1
        },
           {
               name: 'streets',
               source: substringMatcher(streets)
           }).on('typeahead:selected', function (obj, datum) {
               var fields = datum.split("-");
               IDENT2 = fields[0];
               //LLamar Carga estado por zona
               //llenarCA(IDCOL);
           });
        $('#ENTCALLE3').typeahead({
            hint: true,
            highlight: true,
            minLength: 1
        },
          {
              name: 'streets',
              source: substringMatcher(streets)
          }).on('typeahead:selected', function (obj, datum) {
              var fields = datum.split("-");
              IDENT3 = fields[0];

              //LLamar Carga estado por zona
              //llenarCA(IDCOL);
          });
        //******************************************************************************************************CALLE
        //******************************************************************************************************CP
        llenaCP();
        function llenaCP() {

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
                                cp[i] = parsedTest[i]['idz'] + "-" + parsedTest[i]['nombre'];
                            }
                        }

                    }
                }, error: function (error) {
                    console.log("ERROR: " + error);
                }
            });

        }
        $('#CODIGOP').typeahead({
            hint: true,
            highlight: true,
            minLength: 1
        },
         {
             name: 'cp',
             source: substringMatcher(cp)
         }).on('typeahead:selected', function (obj, datum) {
             var fields = datum.split("-");
             IDCP = fields[0];

             //LLamar Carga estado por zona
             //llenarCA(IDCOL);
         });
        //******************************************************************************************************CP
</script>
</asp:Content>
