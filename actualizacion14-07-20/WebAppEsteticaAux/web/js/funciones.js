
$(document).ready(function(){
   $("#btnDelete").click(function(){
      // alert("ok");
       var id_servicio=$(this).parent().find("#id_servicio").val();
       eliminar(id_servicio);
      //alert("eliminar:"+id_servicio);
   });
   function eliminar(id_servicio){
       var vlUrl="Controlador?accion=Delete";
       $.ajax({
           type:'POST',
           url=vlUrl,
           data:"id_servicio="+id_servicio,
           success:function (data,textStatus,jqXHR){
               alert("exito eliminacion");
           }
       });
       
   }
});


