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
                                        </div>
                                    </div>
                                </div>


                                <div class="col-md-12 col-sm-12" id="MuestaDAT" style="display:block;">
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
                                                        <h4 style="margin-top: 5px;">Nombre completo del cliente </h4>
                                                    </div>
                                                </div>
                                                <div class="col-md-12 col-sm-12">
                                                    <div class="row">      
                                                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                                            <center><label style="margin-top: 5px;">Nombre(s)</label></center>
                                                            <input id="Nombre" class="form-control" type="text" placeholder=""/>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                                            <center><label style="margin-top: 5px;">Apellido Paterno</label></center>
                                                            <input id="Apellido1" class="form-control" type="text" placeholder=""/>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                                            <center><label style="margin-top: 5px;">Apellido Materno</label></center>
                                                            <input id="Apellido2" class="form-control" type="text" placeholder=""/>
                                                        </div>
                                                     </div>
                                                    <div class="row" style="margin-top:20px;">      
                                                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                                            <center><label style="margin-top: 5px;">Usuario</label></center>
                                                            <input id="USERNAME" class="form-control" type="text" placeholder=""/>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">

                                                            <center><label style="margin-top: 5px;">Contraseña</label></center>
                                                            <input id="PASS" class="form-control" type="text" placeholder="."/>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                                            <center><label style="margin-top: 5px;">Activo</label></center>
                                                            <center><input id="checkss" name="checkss" type="checkbox"  class="icheck" style="margin-top:5px;"></center>
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
    <script type="text/javascript">
        var inicio = true;
        var inicio2 = true;
        var inicio3 = true;
        var GBLID = -1;
       
       
        actualizaTabla();
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

        function cargaD(ID) {
            document.getElementById('MuestaTel').style.display = 'none';
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
                        $("#numero").val(parsedTest[i]['numero']);
                        
                        if (parsedTest[i]['estado']) {
                            $("#checkss").iCheck('check');
                        } else {
                            $("#checkss").iCheck('uncheck');
                        }
                       
                    }
                },
                error: function (error) {
                    console.log("ERROR: " + error);
                }
            });
            
        }

       

</script>
</asp:Content>
