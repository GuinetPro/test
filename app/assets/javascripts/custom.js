$(function() {
    $('.date').datepicker({
        
        language: "es",
        
        calendarWeeks: true,
        
        autoclose: true,
        
        todayHighlight: true,

        format: "dd-mm-yyyy"
    });


});


function agregarAtributo(e,p){
    e.preventDefault();	
    var contador = $('.'+p).length;
    console.log(contador);
    var html = ' <div class="row '+p+' '+p+'-row'+contador+'"><div class="col-md-3"><input type="text"  class="form-control" placeholder="llave" name="producto['+p+'][llave]['+contador+']"></div><div class="col-md-4"><input type="text" class="form-control" placeholder="valor" name="producto['+p+'][valor]['+contador+']"></div> <div class="col-md-2"><button onclick="eliminarAtributo(event,\''+p+'\','+contador+')"  class="btn btn-danger"><i class="fa fa fa-times" aria-hidden="true"></i></button></div> </div>';            
    $('#'+p).append(html);

}

function eliminarAtributo(e,p,n){
	e.preventDefault();	
	$('.'+p+'-row'+n).remove();
}