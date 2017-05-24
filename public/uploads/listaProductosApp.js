
var app = angular.module("MyApp",['ui.grid', 'ui.grid.edit', 'ui.grid.cellNav', 'ui.grid.pagination']);

app.run(['i18nService', function (i18nService) {
  i18nService.setCurrentLang('es');
}]);



app.controller('ListadoCtrl', function ($scope,$http) {
 

    $scope.myData =  [];

   //configuramos al grilla

    $scope.gridOptions = {};
    $scope.gridOptions.paginationPageSizes = [20, 25, 100],
    $scope.gridOptions.paginationPageSize = 20,

     //$scope.gridOptions.data =   $scope.myData ;

    $scope.gridOptions.enableFiltering= true;

    $scope.gridOptions.enableCellEditOnFocus = true ;

    $scope.gridOptions.columnDefs = [
         { name: 'precio', width: '8%' ,displayName: 'Precio', enableCellEdit: false,enableFiltering: false},
         { name: 'activado',displayName: 'Act', 
         enableCellEdit: false,
         enableFiltering: false
         , width: '5%' },
             { name: 'proximo',displayName: 'Proximo', 
         enableCellEdit: false,
         enableFiltering: false
         , width: '5%' },
         { name: 'tipovehiculo', width: '15%',displayName: 'Vehiculo', enableCellEdit: false},
         { name: 'tipoproducto' , width: '7%',displayName: 'Producto', enableCellEdit: false,},
         { name: 'aseguradora'
         , width: '16%' ,displayName: 'Aseguradora', enableCellEdit: false, },
         { name: 'campana', width: '11%' ,displayName: 'Campaña', enableCellEdit: false, },
         { name: 'vigencia', width: '22%' ,displayName: 'Vigencia', enableCellEdit: false, },
         { name: 'Opciones',
            enableFiltering: false,
            enableCellEdit: false,
            width: '16%',
            cellTemplate:( Perfil == "admin" )?'<a  href="/backoffice/productos/{{row.entity.id}}/edit">Editar</a>  <a data-confirm="Realmente deseas eliminar este dato?" rel="nofollow" data-method="delete" href="/backoffice/productos/{{row.entity.id}}">Eliminar</a>  <a  href="/backoffice/productos/duplicate/{{row.entity.id}}">Clonar</a>':'<a ng-show="'+isEditor+'" href="/backoffice/productos/{{row.entity.id}}/edit">Editar</a>' 
         },
       ];



     // buscamos los resultados
    $http.get('/backoffice/productos.json')
        .success(function(response) {

        for(i = 0; i < response.length; i++){
           response[i].activado = (response[i].activado)?"Si":"No"; 
           response[i].proximo = (response[i].proximo)?"Si":"No"; 
           response[i].campana  = response[i].vigencia[0].campana;
           response[i].vigencia = response[i].vigencia[0].vigencia;
        }

       $scope.gridOptions.data = response;          
    });

    $scope.gridOptions.onRegisterApi = function(gridApi) {

        $scope.gridApi = gridApi;

        gridApi.edit.on.afterCellEdit($scope, function(rowEntity, colDef, newValue, oldValue) {

         // $scope.msg.lastCellEdited = 'ID: ' + rowEntity.id + ', Column: ' + colDef.name + ', New Value: ' + newValue + ', Old Value: ' + oldValue;

        });

      };

    $scope.buttonClick = function(value) {
        //alert('Name: ' + value);
        window.location = Base+"app/editPaso1/"+value;

    };

});





app.controller('ListadoTipoVehiculoCtrl', function ($scope,$http) {
 

    $scope.myData =  [];

   //configuramos al grilla

    $scope.gridOptions = {};
    $scope.gridOptions.paginationPageSizes = [20, 25, 100],
    $scope.gridOptions.paginationPageSize = 20,

     //$scope.gridOptions.data =   $scope.myData ;

    $scope.gridOptions.enableFiltering= true;

    $scope.gridOptions.enableCellEditOnFocus = true ;

    $scope.gridOptions.columnDefs = [
         { name: 'id' ,displayName: 'Id', enableCellEdit: false},
         { name: 'nombre',displayName: 'Nombre', enableCellEdit: false,},
         { name: 'Opciones',
            enableFiltering: false,
            enableCellEdit: false,
            cellTemplate:( Perfil == "admin" )?'<a  href="/backoffice/tipovehiculos/{{row.entity.id}}/edit">Editar</a>  <a data-confirm="Realmente deseas eliminar este dato?" rel="nofollow" data-method="delete" href="/backoffice/tipovehiculos/{{row.entity.id}}">Eliminar</a>  ' :'<a  href="/backoffice/tipovehiculos/{{row.entity.id}}/edit">Editar</a>',
         },
       ];



     // buscamos los resultados
    $http.get('/backoffice/tipovehiculos.json')
        .success(function(response) {

       $scope.gridOptions.data = response;          
    });

    $scope.gridOptions.onRegisterApi = function(gridApi) {

        $scope.gridApi = gridApi;

        gridApi.edit.on.afterCellEdit($scope, function(rowEntity, colDef, newValue, oldValue) {

    
        });

      };



});



function editorMasivo(){

    var  aseguradora_id = $('#aseguradora_id').val();
    var  campana_id     = $('#campana_id').val();
    var  url_compra     = $('#url_compra').val();
    var  url_poliza     = $('#url_poliza').val();
    var  precio         = $('#precio').val();
    var  tipovehiculo_id = $('#tipovehiculo_id').val();
    var  destacado_id    = $('#destacado_id').val();

    if( aseguradora_id == "" || campana_id == ""){
        alert('Debes elegir una Aseguradora y una Campa;a');
        return;
    }

       $.ajax({
           type: "POST",
           url: Base+"backoffice/productos/editor_masivo/"+aseguradora_id+'/'+campana_id,
           data: { aseguradora_id:aseguradora_id,
                   campana_id:campana_id,
                   url_compra : url_compra,
                   url_poliza : url_poliza ,
                   precio : precio,
                   tipovehiculo_id : tipovehiculo_id,
                   destacado_id : destacado_id

           }, // serializes the form's elements.
           success: function(data)
           {
               window.location = Base +"backoffice/productos/" ;// show response from the php script.
           }
         });

}