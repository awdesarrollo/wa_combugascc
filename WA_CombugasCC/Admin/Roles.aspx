<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Roles.aspx.cs" Inherits="WA_CombugasCC.Admin.Roles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-container" >
            <div class="page-content-wrapper">
                <div class="page-head">
                    <div class="container">
                        <div class="page-title">
                            <h1>Roles</h1>
                        </div>
                    </div>
                </div>
                <div class="page-content">
                    <div class="container">
                        <ul class="page-breadcrumb breadcrumb">
                            <li>
                                <a href="index.html">Home</a>
                                <i class="fa fa-circle"></i>
                            </li>
                            <li>
                                <span>Roles</span>
                            </li>
                        </ul>
                        <div class="page-content-inner" style="min-height: 400px;">
                            <div class="row">
                                <div class="col-md-6 col-sm-6">
                                    <div class="portlet light ">
                                        <div class="portlet-title">
                                            <div class="caption caption-md">
                                                Datos de Rol
                                            </div>
                                        </div>
                                        <div class="portlet-body">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <input type="hidden" id="hdRolID" value="0" />
                                                    <label>Nombre de Rol:</label>
                                                    <input type="text" class="form-control" id="txtNombreRol" />
                                                </div>
                                                <div class="col-md-6" style="margin-top: 20px;">
                                                    <button class="btn btn-danger" id="btnGuardar" type="button">Guardar</button>
                                                    <button class="btn btn-danger" id="btnEditar" type="button" style="display: none;">Editar</button>&nbsp;
                                                    <button class="btn btn-default" id="btnLimpiar" type="button">Limpiar</button>
                                                </div>
                                            </div>                                          
                                        </div>
                                    </div>
                                </div>

                                 <div class="col-md-6 col-sm-6">
                                    <div class="portlet light ">
                                        <div class="portlet-title">
                                            <div class="caption caption-md">
                                                Lista de Roles
                                            </div>
                                        </div>
                                        <div class="portlet-body">
                                          <table class="table table-striped table-bordered table-hover dt-responsive" width="100%" id="tablaRoles" cellspacing="0" width="100%">
                                                <thead>
                                                    <tr>
                                                        <th class="all">Nombre del Rol</th>
                                                        <th class="desktop">Acciones</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>

                            </div>
                           
                        </div>
                    </div>
                </div>
            </div>
            <a href="javascript:;" class="page-quick-sidebar-toggler">
                <i class="icon-login"></i>
            </a>
        </div>
<script>
    var tablaRoles = $('#tablaRoles').dataTable({
        "language": {
            "url": '//cdn.datatables.net/plug-ins/3cfcc339e89/i18n/Spanish.json'
        },
        buttons: [
            //{ extend: 'print', className: 'btn dark btn-outline' },
            //{ extend: 'pdf', className: 'btn green btn-outline' },
            //{ extend: 'csv', className: 'btn purple btn-outline ' }
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


    cargarRoles();

    function cargarRoles() {
        $.ajax({
            type: "POST",
            url: "Roles.aspx/CargarRoles",
            data: '{ }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (response) {
                var datos = JSON.parse(response.d.Data);
                tablaRoles.fnClearTable();
                for (var i = 0; i < datos.length; i++) {
                    tablaRoles.fnAddData([datos[i].nombreRol, '<a href="#" onclick="editarRol(' + datos[i].idRol + ')" class="btn btn-default"><span class="fa fa-edit"></span> </a>']);
                }
            },
            error: function (error) {
                console.log(error);
            }
        });
    }

    $("#btnLimpiar").click(function () {
        limpiar();
    });

    $("#btnGuardar").click(function () {
        if ($.trim($("#txtNombreRol").val()) == "") {
            toastr.error("Es necesario que capture el Nombre del Rol", "Datos requeridos");
        } else {
            $.ajax({
                type: "POST",
                url: "Roles.aspx/AgregaRoles",
                data: '{ nombre: "' + $("#txtNombreRol").val() + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (response) {
                    if(response.d.Result){
                        toastr.success("El Rol ha sido agregado correctamente", "Éxito");
                       limpiar();
                    } else {
                        toastr.error(response.d.Message, "Problema al agregar");
                    }
                },
                error: function (error) {
                    console.log(error);
                }
            });
        }
    });

    $("#btnEditar").click(function () {
        if ($.trim($("#txtNombreRol").val()) == "") {
            toastr.error("Es necesario que capture el Nombre del Rol", "Datos requeridos");
        } else {
            $.ajax({
                type: "POST",
                url: "Roles.aspx/EditaRoles",
                data: '{ nombre: "' + $("#txtNombreRol").val() + '", idRol: "' + $("#hdRolID").val() + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (response) {
                    if (response.d.Result) {
                        toastr.success("El Rol ha sido editado correctamente", "Éxito");
                        limpiar();
                    } else {
                        toastr.error(response.d.Message, "Problema al agregar");
                    }
                },
                error: function (error) {
                    console.log(error);
                }
            });
        }
    });

    function editarRol(idRol) {
        $.ajax({
            type: "POST",
            url: "Roles.aspx/ObtieneRolId",
            data: '{ idRol: "' + idRol + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (response) {
                if (response.d.Result) {
                    var datos = JSON.parse(response.d.Data);
                    $("#hdRolID").val(datos.idRol);
                    $("#txtNombreRol").val(datos.nombreRol);

                    $("#btnGuardar").hide("fast");
                    $("#btnEditar").show("show");

                } else {
                    toastr.error(response.d.Message, "Problema al agregar");
                }
            },
            error: function (error) {
                console.log(error);
            }
        });
    }

    function limpiar() {
        $("#idRol").val(0);
        $("#txtNombreRol").val("");
        $("#btnGuardar").show("fast");
        $("#btnEditar").hide("fast");
        cargarRoles();
    }


</script>
</asp:Content>
