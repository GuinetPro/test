
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
         { name: 'precio' ,displayName: 'Precio', enableCellEdit: false,enableFiltering: false},
         { name: 'activado',displayName: 'activado', enableCellEdit: false,enableFiltering: false },
         { name: 'tipovehiculo',displayName: 'Vehiculo', enableCellEdit: false},
         { name: 'tipoproducto',displayName: 'Producto', enableCellEdit: false,},
         { name: 'aseguradora',displayName: 'Aseguradora', enableCellEdit: false, },
         { name: 'campana',displayName: 'Campaña', enableCellEdit: false, },
         { name: 'vigencia',displayName: 'Vigencia', enableCellEdit: false, },
         { name: 'Opciones',
            enableFiltering: false,
            enableCellEdit: false,
            width: '20%',
             cellTemplate:'<a href="#" ng-click="grid.appScope.buttonEdit(row.entity.id)">Editar</a>  <a data-confirm="Realmente deseas eliminar este dato?" rel="nofollow" data-method="delete" href="/backoffice/productos/9">Eliminar</a>  <a  href="#" ng-click="grid.appScope.buttonClonar(row.entity.id)">Clonar</a>' 
         },
       ];



    $scope.buttonEdit = function(value) {
        //alert('Name: ' + value);
        window.location = "productos/"+value+"/edit";

    };

    $scope.buttonClonar = function(value) {
        //alert('Name: ' + value);
        window.location = "productos/duplicate/"+value;

    };


     // buscamos los resultados
     $http.get('http://localhost:3000/backoffice/productos.json')
        .success(function(response) {


           for(i = 0; i < response.length; i++){

     		   response[i].activado= (response[i].activado)?"Si":"No";	
               response[i].campana= response[i].vigencia[0].campana  ;
               response[i].vigencia= response[i].vigencia[0].vigencia  ;

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



