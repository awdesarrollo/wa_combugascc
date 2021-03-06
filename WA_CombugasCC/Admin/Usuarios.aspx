﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="WA_CombugasCC.Admin.Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-container" >
            <div class="page-content-wrapper">
                <div class="page-head">
                    <div class="container">
                        <div class="page-title">
                            <h1>Usuarios</h1>
                        </div>
                    </div>
                </div>
                <div class="page-content">
                    <div class="container">
                       
                        <div class="page-content-inner" style="min-height: 400px;">
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                    <div class="portlet light ">
                                        <div class="portlet-title">
                                            <div class="caption caption-md">
                                                Datos de Usuarios
                                            </div>
                                        </div>
                                        <div class="portlet-body">
                                            <input type="hidden" id="hdidusuario" value="0" />
                                          <div class="row">
                                              <div class="col-md-3">
                                                  <label>Usuario</label>
                                                  <input type="text" class="form-control" id="txtUsuario" />
                                              </div>
                                              <div class="col-md-3">
                                                  <label>Contraseña</label>
                                                  <input type="password" class="form-control" id="txtPassword" />
                                              </div>
                                               <div class="col-md-6">
                                                  <label>Nombre de Usuario</label>
                                                  <input type="text" class="form-control" id="txtNombre" />
                                              </div>
                                          </div>
                                            <div class="row" style="margin-top: 20px;">
                                                <div class="col-md-3">
                                                  <label>Rol</label>
                                                  <select id="cbRoles" class="form-control">
                                                  </select>
                                              </div>
                                                <div class="col-md-3" style="margin-top: 20px;">
                                                    <label><input type="checkbox" id="ckActivo" class="icheck" checked> Activo</label>
                                                </div>
                                                <div class="col-md-6" style="margin-top: 10px;">
                                                    <button type="button" class="btn btn-danger" id="btnGuardar">Guardar</button>&nbsp;
                                                    <button type="button" class="btn btn-danger" id="btnEditar" style="display: none;">Editar</button>
                                                    <button type="button" class="btn btn-default" id="btnLimpiar">Limpiar</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                           
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                    <div class="portlet light ">
                                        <div class="portlet-title">
                                            <div class="caption caption-md">
                                                Lista de Usuarios
                                            </div>
                                        </div>
                                        <div class="portlet-body">
                                            <table class="table table-striped table-bordered table-hover dt-responsive" width="100%" id="tablaUsuarios" cellspacing="0" width="100%">
                                                <thead>
                                                    <tr>
                                                        <th class="all">Usuario</th>
                                                        <th class="all">Nombre de usuario</th>
                                                        <th class="all">Rol</th>
                                                        <th class="all">Estatus</th>
                                                        <th class="all">Ultimo Acceso</th>
                                                        <th class="all">Acciones</th>
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

    <script type="text/javascript">
        var tablaUsuarios = $('#tablaUsuarios').dataTable({
            "language": {
                "url": '//cdn.datatables.net/plug-ins/3cfcc339e89/i18n/Spanish.json'
            },
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

        cargaUsuarios();

        function cargaUsuarios() {
            $.ajax({
                type: "POST",
                url: "Usuarios.aspx/CargaUsuarios",
                data: '{ }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (response) {
                    if(response.d.Result) {
                        var datos = JSON.parse(response.d.Data);
                        tablaUsuarios.fnClearTable();
                        for (var i = 0; i < datos.length; i++) {
                            var estatus = "";
                            if (datos[i].estatus) {
                                estatus = '<label class="label label-success label-sm">Activo</label>';
                            } else {
                                estatus = '<label class="label label-danger label-sm">Inactivo</label>';
                            }
                            tablaUsuarios.fnAddData([datos[i].usuario, datos[i].nombre, datos[i].rol, estatus, datos[i].ultimoacceso, '<button type="button" onclick="editarUsuario(' + datos[i].idusuario + ')" class="btn btn-default"><span class="fa fa-edit"></span></button>']);
                        }
                    }
                },
                error: function (error) {
                    console.log(error);
                }
            });
        }

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

                    var options = "<option value='-1'>Seleccione un Rol</option>";
                    for (var i = 0; i < datos.length; i++) {
                        options += "<option value='" + datos[i].idRol + "'>" + datos[i].nombreRol + "</option>";
                    }
                    $("#cbRoles").html(options);
                },
                error: function (error) {
                    console.log(error);
                }
            });
        }

        function editarUsuario(idusuario) {
            $("#hdidusuario").val(idusuario);
            $.ajax({
                type: "POST",
                url: "Usuarios.aspx/ObtieneUsuarioId",
                data: JSON.stringify({ idusuario: idusuario }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                //async: false,
                success: function (response) {
                    if (response.d.Result) {
                        var datos = JSON.parse(response.d.Data);
                        $("#txtUsuario").val($.trim(datos.usuario));
                        $("#txtPassword").val($.trim(datos.password));
                        $("#txtNombre").val($.trim(datos.nombre));
                        $("#cbRoles").val(datos.idrol);

                        if (datos.estatus) {
                            $('#ckActivo').iCheck('check');
                        } else {
                            $('#ckActivo').iCheck('uncheck');
                        }

                        $("#txtUsuario").focus();

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
            $("#hdidusuario").val(0);
            $("#txtUsuario").val("");
            $("#txtPassword").val("");
            $("#txtNombre").val("");
            $("#cbRoles").val(-1);
            $('#ckActivo').iCheck('check');

            $("#btnGuardar").show("fast");
            $("#btnEditar").hide("fast");
            cargaUsuarios();
        }

        $("#btnLimpiar").click(function () {
            limpiar();
        });

        $("#btnEditar").click(function () {
            if($.trim($("#txtUsuario").val()) == "" || $.trim($("#txtPassword").val()) == "" || $.trim($("#txtNombre").val()) == "" || 
                $("#cbRoles").val() == -1 ) {
                toastr.error("Todos los datos del usuario son requeridos, verifique por favor.", "Datos requeridos");
            } else {
                var usuario = $("#txtUsuario").val();
                var password = $("#txtPassword").val();
                var nombre = $("#txtNombre").val();
                var estatus = ($('#ckActivo').parent('[class*="icheckbox"]').hasClass("checked") ? true : false);
                var idrol = $("#cbRoles").val();

                $.ajax({
                    type: "POST",
                    url: "Usuarios.aspx/EditaUsuarios",
                    data: JSON.stringify({ usuario: usuario, password: password, nombre: nombre, estatus: estatus, idrol: idrol, idusuario: $("#hdidusuario").val() }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    success: function (response) {
                        if (response.d.Result) {
                            toastr.success("El Usuario ha sido editado correctamente", "Éxito");
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

        $("#btnGuardar").click(function () {
            if ($.trim($("#txtUsuario").val()) == "" || $.trim($("#txtPassword").val()) == "" || $.trim($("#txtNombre").val()) == "" ||
                   $("#cbRoles").val() == -1) {
                toastr.error("Todos los datos del usuario son requeridos, verifique por favor.", "Datos requeridos");
            } else {
                var usuario = $("#txtUsuario").val();
                var password = $("#txtPassword").val();
                var nombre = $("#txtNombre").val();
                var estatus = ($('#ckActivo').parent('[class*="icheckbox"]').hasClass("checked") ? true : false);
                var idrol = $("#cbRoles").val();

                $.ajax({
                    type: "POST",
                    url: "Usuarios.aspx/AgregaUsuarios",
                    data: JSON.stringify({ usuario: usuario, password: password, nombre: nombre, estatus: estatus, idrol: idrol }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    success: function (response) {
                        if (response.d.Result) {
                            toastr.success("El Usuario ha sido agregado correctamente", "Éxito");
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

    </script>

</asp:Content>
