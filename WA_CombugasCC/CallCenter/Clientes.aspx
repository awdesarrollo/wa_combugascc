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
                                                      <h4 style="margin-top: 5px;">Tipo de cliente</h4>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                        
                                                        <select class="js-example-basic-single form-control col-md-12 col-sm-12 col-xs-12" id="Sel2">
                                                            <option value="-1" ></option>
                                                           
                                                          </select>
                                                    </div>
                                                </div>

                                                <div class="row" style="margin-top: 20px;">
                                                      <h4 style="margin-top: 5px;">Dirección del cliente</h4>
                                                </div>
                                                <div class="row">      
                                                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                         <label >Zona</label>


                                                        <div class="input-group">
                                                            
                                                            <input type="text" id="ZONA"  class="form-control" /> 

                                                        </div>

                                                    </div>
                                                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                        <label >Estado</label>
                                                        <div class="input-group">
                                                            
                                                           <input id="ESTADO" class="form-control" type="text" />

                                                        </div>
                                                        
                                                    </div>
                                                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                         <label >Ciudad</label>
                                                        <div class="input-group">
                                                            
                                                           <input id="CIUDAD" class="form-control" type="text" />

                                                        </div>
                                                        
                                                    </div>
                                                     <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                          <label >Colonia</label>
                                                         <div class="input-group">
                                                            
                                                          <input id="COLONIA" class="form-control" type="text" />

                                                        </div>
                                                        
                                                    </div>
                                                 </div>
                                                <div class="row"  style="margin-top: 20px;">      
                                                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                        <label >Calle</label>
                                                         <div class="input-group">
                                                            
                                                           <input id="CALLE" class="form-control" type="text" />

                                                        </div>
                                                        
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
                                                         <div class="input-group">
                                                           
                                                           <input id="CODIGOP" class="form-control" type="text" />

                                                        </div>
                                                        
                                                    </div>
                                                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                        <label >Entre Calle</label>
                                                        <div class="input-group">
                                                           
                                                            <input id="ENTCALLE1" class="form-control" type="text" />

                                                        </div>
                                                        
                                                    </div>
                                                 </div>
                                                <div class="row"  style="margin-top: 20px;">      
                                                    
                                                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                        <label >Entre Calle</label>
                                                        <div class="input-group">
                                                           
                                                            <input id="ENTCALLE2" class="form-control" type="text" />

                                                        </div>
                                                        
                                                    </div>
                                                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                        <label >Entre Calle</label>
                                                        <div class="input-group">
                                                           
                                                            <input id="ENTCALLE3" class="form-control" type="text"/>

                                                        </div>
                                                        
                                                    </div>
                                                     <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                          <label >Cercano a:</label>
                                                        <input id="REFE" class="form-control" type="text" />
                                                    </div>
                                                 </div>
                                                <div class="row"  style="margin-top: 20px;">      
                                                    <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
                                                        <label >Observaciones</label>
                                                        <input id="OBSERVA" class="form-control" type="text" />
                                                    </div>
                                                 </div>
                                                 <div class="row" style="margin-top: 20px;">
                                                      <h4 style="margin-top: 5px;">Teléfono del cliente</h4>
                                                </div>
                                                <div class="row" style="margin-top: 1px;">
                                                    <div class="col-md-12 col-sm-12">
                                                        <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
                                                            <input id="NoTel10" class="form-control" type="text" />
                                                       </div>
                                                       <div class="col-md-3 col-sm-12" style="padding-left: 0px;">
                                                          <select class="js-example-basic-single form-control col-md-12 col-sm-12 col-xs-12" id="Sel10">
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
                                                   <button id="btnAgregar" class="btn btn-default pull-right" type="button" style="display:none;margin-top:15px !important; margin-right:15px;" onclick="AgregarElemento();">Agregar Elemento</button>&nbsp;
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








    <%--Busqueda a los 4 caracteres en laguneros (escribir publicacion)--%>

     <script type="text/javascript">
         var more = 1;
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

         //****************************************************************************************************LLENA TIPO CLIENTE
         LLenaTIPO();
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
         //****************************************************************************************************LLENA TIPO CLIENTE
         function AgregarElemento() {
             $('#mdAgrega').modal('show');
         }
         llenarSelectZONA();
         function llenarSelectZONA() {
             //$('#ZNSELEC').html('"<option value="-1"></option>"');
             //$('#ZNSELEC option:contains("")').attr('selected', 'selected');
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
                                 //$('#ZNSELEC').append('<option value="' + parsedTest[i]['idz'] + '">' + parsedTest[i]['nombre'] + '</option>');
                                 zones[i] =parsedTest[i]['idz']+"-"+ parsedTest[i]['nombre'];
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

         function Limpiar() {
             LLenaTIPO();
             $('#Nombre').val('');
             $('#Apellido1').val('');
             $('#Apellido2').val('');
             $('#ZONA').val('');
             $('#ESTADO').val('');
             $('#CIUDAD').val('');
             $('#COLONIA').val('');
             $('#CALLE').val('');
             $('#NoInt').val('');
             $('#noExt').val('');
             $('#CODIGOP').val('');
             $('#ENTCALLE1').val('');
             $('#ENTCALLE2').val('');
             $('#ENTCALLE3').val('');
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
            
         }

        function b1() {
            var linea = '<div class="col-lg-5 col-md-5 col-sm-12 col-xs-12" style="margin-top:20px;"><input id="NoTel1' + more + '" class="form-control" type="text" placeholder="No. Telefónico."/></div><div class="col-md-3 col-sm-12" style="padding-left: 0px;margin-top:20px;"><select class="js-example-basic-single form-control col-md-12 col-sm-12 col-xs-12" id="Sel1' + more + '"><option value="CASA" selected>CASA</option> <option value="CELULAR">CELULAR</option><option value="OFICINA">OFICINA</option><option value="OTROS">OTROS</option></select></div>';
            $('#addmore').append(linea);
            more = more + 1;                                       
        }

        //region transacciones
        function Guardar() {
            //Obtener datos
            
            //Nombre
            var res = $.trim($("#Nombre").val());
            var Nombre = res.toUpperCase();
            //Apellido1
            res = $.trim($("#Apellido1").val());
            var Apellido1 = res.toUpperCase();
            //Apellido2
            res = $.trim($("#Apellido2").val());
            var Apellido2 = res.toUpperCase();
            //TIPO
            var IDTIPO = $("#Sel2").val();
            //ZONA
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
            //ENT1
            var ENTRE1 = IDENT1;
            //ENT2
            var ENTRE2 = IDENT2;
            //ENT3
            var ENTRE3 = IDENT3;
            //CERCANO A
            var Ref = $("#REFE").val();
            //Observaciones
            var OB = $('#OBSERVA').val();
            //SACAR TELEFONOS
            var NOTEL = [];
            var TIPNOTEL = [];
            for (var i = 0; i < more; i++) {
                NOTEL[i] = $("#NoTel1" + i).val();
                TIPNOTEL[i] = $("#Sel1" + i).val();
            }
           

            
           
            if (Nombre == "" || Apellido1 == "" || Apellido2 == "" || IDTIPO <= 0 || ZONA == 0 || ESTADO == 0 || CIUDAD == 0 || COLONIA == 0 || CALLE == 0 || NOTEL[0]==null) {
                toastr.error("Faltan Datos.", "Advertencia");
            }else{
                //Guardar
                $.ajax({
                    type: "POST",
                    url: "Clientes.aspx/Guardar",
                    data: JSON.stringify({
                        nombre: Nombre, Apellido1: Apellido1, Apellido2: Apellido2, IDTIPO: IDTIPO, ZONA: ZONA, ESTADO: ESTADO,
                        CIUDAD: CIUDAD, COLONIA: COLONIA, CALLE: CALLE, noInt: noInt, noExt: noExt, CPL: CPL, ENTRE1: ENTRE1,
                        ENTRE2: ENTRE2, ENTRE3, ENTRE3, Ref: Ref, OB: OB, NOTEL: NOTEL, TIPNOTEL: TIPNOTEL
                    }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d.Result) {
                            Limpiar();
                            toastr.success("El cliente ha sido agregado correctamente", "Éxito");
                        } else {
                            toastr.error("No es posible agregar.", "Advertencia");
                            Limpiar();
                        }
                    },
                    error: function (error) {
                        console.log("ERROR: " + error);
                    }
                });
            }
        }
     </script>

</asp:Content>
