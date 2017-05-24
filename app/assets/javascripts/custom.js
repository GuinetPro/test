$(function() {
    $('.date').datepicker({
        
        language: "es",
        
        calendarWeeks: true,
        
        autoclose: true,
        
        todayHighlight: true,

        format: "dd-mm-yyyy"
    });



    $('#tipovehiculo_id').change(function(){

        console.log( $('#tipovehiculo_id').val()  );

        if( $('#tipovehiculo_id').val() != '' ){
            $('#destacado_id').prop('disabled', false);
        }else{
            $('#destacado_id').prop('disabled', true);
        }
    })




});


function agregarAtributo(e,p){
    e.preventDefault();	
    var contador = $('.'+p).length;
    console.log(contador);
    var html = ' <div class="row '+p+' '+p+'-row'+contador+'"><div class="col-md-3"><input type="text"  class="form-control" placeholder="condicion" name="producto['+p+'][llave]['+contador+']"></div><div class="col-md-4"><input type="text" class="form-control" placeholder="valor" name="producto['+p+'][valor]['+contador+']"></div> <div class="col-md-4"><button onclick="eliminarAtributo(event,\''+p+'\','+contador+')"  class="btn btn-danger"><i class="fa fa fa-times" aria-hidden="true"></i></button>&nbsp&nbsp (microdatos SEO en el atributo html) </div> </div>';            
    $('#'+p).append(html);
     $('[data-toggle="tooltip"]').tooltip();
}

function eliminarAtributo(e,p,n){
	e.preventDefault();	
	$('.'+p+'-row'+n).remove();
}


   function guardarArchivo(e){
        e.preventDefault(); 
        
        var formData = new FormData(),
        
        $input = $('#image');

        formData.append('archivo[image]', $input[0].files[0]);
        formData.append('archivo[pagina]', $('input[name=pagina]:checked').val() );
        formData.append('archivo[aseguradoras_id]', $('#aseguradora').val() );

        $.ajax({
          url: Base+'backoffice/archivos',
          data: formData,
          cache: false,
          contentType: false,
          processData: false,
          type: 'POST',
          success:function(data) {
             window.location = Base+ '/backoffice/aseguradoras/'+$('#aseguradora').val()+'/edit'
          }
        });
   }