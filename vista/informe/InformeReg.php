<?php
/**
*@package pXP
*@file gen-SistemaDist.php
*@author  (rarteaga)
*@date 20-09-2011 10:22:05
*@description Archivo con la interfaz de usuario que permite la ejecucion de todas las funcionalidades del sistema
*/
header("content-type: text/javascript; charset=UTF-8");
?>
<script>
Phx.vista.InformeReg = {    
    bsave:false,    
    require:'../../../sis_seguimiento_doc/vista/informe/Informe.php',
    requireclase:'Phx.vista.Informe',
    title:'Informe',
    nombreVista: 'InformeReg',    
	ActList:'../../sis_seguimiento_doc/control/Informe/listarInformeReg',
    constructor: function(config) {
        this.maestro=config.maestro;  
        Phx.vista.InformeReg.superclass.constructor.call(this,config);
        this.init();
		this.load({params:{start:0, limit:this.tam_pag}})  
		
		this.addButton('sig_estado',{text:'Siguiente',iconCls: 'badelante',disabled:true,handler:this.sigEstado,tooltip: '<b>Pasar al Siguiente Estado</b>'});
        this.addButton('diagrama_gantt',{text:'Gant',iconCls: 'bgantt',disabled:true,handler:this.diagramGantt,tooltip: '<b>Diagrama Gantt de la venta</b>'});
        
		this.addButton('btnChequeoDocumentosWf',
            {
                text: 'Documentos',
                grupo:[0,1,2],
                iconCls: 'bchecklist',
                disabled: true,
                handler: this.loadCheckDocumentosSolWf,
                tooltip: '<b>Documentos de la Solicitud</b><br/>Subir los documetos requeridos en la solicitud seleccionada.'
            }
        );
        
        this.addButton('btnObs',{
                    text :'Obs Wf',
                    grupo:[0,1,2],
                    iconCls : 'bchecklist',
                    disabled: true,
                    handler : this.onOpenObs,
                    tooltip : '<b>Observaciones</b><br/><b>Observaciones del WF</b>'
         });
             
        
    } ,
    
    preparaMenu:function(n){
    
       var data = this.getSelectedData();
       var tb =this.tbar;
       
       Phx.vista.Informe.superclass.preparaMenu.call(this,n);
       
       console.log('...', data)
       if(data.estado == 'borrador'){
       	
       	    this.getBoton('sig_estado').enable();
       	    this.getBoton('edit').enable();
       	    this.getBoton('del').enable();
       	
       	
       }
       else{
       		this.getBoton('sig_estado').disable();
       		this.getBoton('edit').disable();
       	    this.getBoton('del').disable();
       }
      
       
       
       this.getBoton('btnChequeoDocumentosWf').enable();
       this.getBoton('diagrama_gantt').enable();  
       this.getBoton('btnObs').enable(); 
              
        
        
        
        
        return tb 
     }, 
     liberaMenu:function(){
        var tb = Phx.vista.Informe.superclass.liberaMenu.call(this);
        if(tb){
           
            this.getBoton('sig_estado').setDisabled(true);
            
            this.getBoton('btnChequeoDocumentosWf').setDisabled(true);
            this.getBoton('diagrama_gantt').disable();  
            this.getBoton('btnObs').disable(); 
              
                    
        }
       return tb
    },  
    
    
};
</script>
