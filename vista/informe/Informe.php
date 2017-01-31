<?php
/**
*@package pXP
*@file gen-Informe.php
*@author  (admin)
*@date 31-01-2017 10:17:46
*@description Archivo con la interfaz de usuario que permite la ejecucion de todas las funcionalidades del sistema
*/

header("content-type: text/javascript; charset=UTF-8");
?>
<script>
Phx.vista.Informe=Ext.extend(Phx.gridInterfaz,{

	constructor:function(config){
		this.maestro=config.maestro;
    	//llama al constructor de la clase padre
		Phx.vista.Informe.superclass.constructor.call(this,config);
		
		
		
		
	},
			
	Atributos:[
		{
			//configuracion del componente
			config:{
					labelSeparator:'',
					inputType:'hidden',
					name: 'id_informe'
			},
			type:'Field',
			form:true 
		},
		
		{
				config:{
					name:'id_funcionario',
					hiddenName: 'id_funcionario',
					origen: 'FUNCIONARIO',
					fieldLabel:'Funcionario Solicitante',
					allowBlank: false,
					valueField: 'id_funcionario',
					gdisplayField: 'desc_funcionario1',
					
					width: '80%',
					baseParams: { es_combo_solicitud : 'si' }
				},
				type: 'ComboRec',//ComboRec
				id_grupo: 1,
				form: true
		},
		
		{
			config: {
				name: 'id_tipo_doc',
				fieldLabel: 'Tipo Doc',
				allowBlank: false,
				emptyText: 'Elija una opción',
				store: new Ext.data.JsonStore({
					url: '../../sis_seguimiento_doc/control/TipoDoc/ListarTipoDoc',
					id: 'id_tipo_doc',
					root: 'datos',
					sortInfo: {
						field: 'codigo',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_tipo_doc', 'codigo', 'descripcion'],
					remoteSort: true,
					baseParams: {par_filtro: 'tdo.codigo#tdo.descripcion'}
				}),
				valueField: 'id_tipo_doc',
				displayField: 'descripcion',
				gdisplayField: 'desc_tipo_doc',
				hiddenName: 'id_tipo_doc',
				forceSelection: true,
				typeAhead: false,
				triggerAction: 'all',
				lazyRender: true,
				mode: 'remote',
				pageSize: 15,
				queryDelay: 1000,
				anchor: '100%',
				gwidth: 150,
				minChars: 2,
				renderer : function(value, p, record) {
					return String.format('{0}', record.data['desc_tipo_doc']);
				}
			},
			type: 'ComboBox',
			id_grupo: 0,
			filters: {pfiltro: 'movtip.nombre',type: 'string'},
			grid: true,
			form: true
		},
		
		{
			config:{
				name: 'num_doc',
				fieldLabel: 'Número Doc',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:300
			},
				type:'TextField',
				filters:{pfiltro:'inf.num_doc',type:'string'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'fecha_doc',
				fieldLabel: 'Fecha Documento',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:300
			},
				type:'DateField',
				filters:{pfiltro:'inf.fecha_doc',type:'date'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'obs',
				fieldLabel: 'Obs',
				allowBlank: true,
				anchor: '80%',
				gwidth: 300,
				maxLength:1000
			},
				type:'TextArea',
				filters:{pfiltro:'inf.obs',type:'string'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'estado',
				fieldLabel: 'estado',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:200
			},
				type:'TextField',
				filters:{pfiltro:'inf.estado',type:'string'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'estado_reg',
				fieldLabel: 'Estado Reg.',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:10
			},
				type:'TextField',
				filters:{pfiltro:'inf.estado_reg',type:'string'},
				id_grupo:1,
				grid:true,
				form:false
		},
		
		
		
		
		{
			config:{
				name: 'usr_reg',
				fieldLabel: 'Creado por',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:4
			},
				type:'Field',
				filters:{pfiltro:'usu1.cuenta',type:'string'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'fecha_reg',
				fieldLabel: 'Fecha creación',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
							format: 'd/m/Y', 
							renderer:function (value,p,record){return value?value.dateFormat('d/m/Y H:i:s'):''}
			},
				type:'DateField',
				filters:{pfiltro:'inf.fecha_reg',type:'date'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'usuario_ai',
				fieldLabel: 'Funcionaro AI',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:300
			},
				type:'TextField',
				filters:{pfiltro:'inf.usuario_ai',type:'string'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'id_usuario_ai',
				fieldLabel: 'Funcionaro AI',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:4
			},
				type:'Field',
				filters:{pfiltro:'inf.id_usuario_ai',type:'numeric'},
				id_grupo:1,
				grid:false,
				form:false
		},
		{
			config:{
				name: 'usr_mod',
				fieldLabel: 'Modificado por',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:4
			},
				type:'Field',
				filters:{pfiltro:'usu2.cuenta',type:'string'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'fecha_mod',
				fieldLabel: 'Fecha Modif.',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
							format: 'd/m/Y', 
							renderer:function (value,p,record){return value?value.dateFormat('d/m/Y H:i:s'):''}
			},
				type:'DateField',
				filters:{pfiltro:'inf.fecha_mod',type:'date'},
				id_grupo:1,
				grid:true,
				form:false
		}
	],
	tam_pag:50,	
	title:'Informe',
	ActSave:'../../sis_seguimiento_doc/control/Informe/insertarInforme',
	ActDel:'../../sis_seguimiento_doc/control/Informe/eliminarInforme',
	ActList:'../../sis_seguimiento_doc/control/Informe/listarInforme',
	id_store:'id_informe',
	fields: [
		{name:'id_informe', type: 'numeric'},
		{name:'obs', type: 'string'},
		{name:'estado', type: 'string'},
		{name:'estado_reg', type: 'string'},
		{name:'id_estado_wf', type: 'numeric'},
		{name:'id_proceso_wf', type: 'numeric'},
		{name:'id_funcionario', type: 'numeric'},
		{name:'num_doc', type: 'string'},
		{name:'id_tipo_doc', type: 'numeric'},
		{name:'id_usuario_reg', type: 'numeric'},
		{name:'fecha_reg', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'usuario_ai', type: 'string'},
		{name:'id_usuario_ai', type: 'numeric'},
		{name:'id_usuario_mod', type: 'numeric'},
		{name:'fecha_mod', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'usr_reg', type: 'string'},
		{name:'usr_mod', type: 'string'},
		'desc_tipo_doc','desc_funcionario1','nro_tramite'
		
	],
	sortInfo:{
		field: 'id_informe',
		direction: 'ASC'
	},
	
	diagramGantt : function (){            
            var data=this.sm.getSelected().data.id_proceso_wf;
            Phx.CP.loadingShow();
            Ext.Ajax.request({
                url:'../../sis_workflow/control/ProcesoWf/diagramaGanttTramite',
                params:{'id_proceso_wf':data},
                success:this.successExport,
                failure: this.conexionFailure,
                timeout:this.timeout,
                scope:this
            });        
	},
	
	sigEstado:function(){                   
      var rec=this.sm.getSelected();
      this.objWizard = Phx.CP.loadWindows('../../../sis_workflow/vista/estado_wf/FormEstadoWf.php',
                                'Estado de Wf',
                                {
                                    modal:true,
                                    width:700,
                                    height:450
                                }, {data:{
                                       id_estado_wf:rec.data.id_estado_wf,
                                       id_proceso_wf:rec.data.id_proceso_wf
                                    }}, this.idContenedor,'FormEstadoWf',
                                {
                                    config:[{
                                              event:'beforesave',
                                              delegate: this.onSaveWizard,
                                              
                                            }],
                                    
                                    scope:this
                                 });        
               
     },
       
     onSaveWizard:function(wizard,resp){
        Phx.CP.loadingShow();
        
        Ext.Ajax.request({
            url:'../../sis_seguimiento_doc/control/Informe/siguienteEstado',
            params:{
                    
                id_proceso_wf_act:  resp.id_proceso_wf_act,
                id_estado_wf_act:   resp.id_estado_wf_act,
                id_tipo_estado:     resp.id_tipo_estado,
                id_funcionario_wf:  resp.id_funcionario_wf,
                id_depto_wf:        resp.id_depto_wf,
                obs:                resp.obs,
                json_procesos:      Ext.util.JSON.encode(resp.procesos)
                },
            success:this.successWizard,
            failure: this.failureWizard,
            argument:{wizard:wizard},
            timeout:this.timeout,
            scope:this
        });
    },
    
    antEstado:function(){
         var rec=this.sm.getSelected();
            Phx.CP.loadWindows('../../../sis_workflow/vista/estado_wf/AntFormEstadoWf.php',
            'Estado de Wf',
            {
                modal:true,
                width:450,
                height:250
            }, {data:rec.data}, this.idContenedor,'AntFormEstadoWf',
            {
                config:[{
                          event:'beforesave',
                          delegate: this.onAntEstado,
                        }
                        ],
               scope:this
             })
   },
   
   onAntEstado:function(wizard,resp){
            Phx.CP.loadingShow(); 
            Ext.Ajax.request({ 
                url:'../../sis_seguimiento_doc/control/Informe/anteriorEstado',
                params:{
                        id_proceso_wf:resp.id_proceso_wf,
                        id_estado_wf:resp.id_estado_wf,  
                        obs:resp.obs
                 },
                argument:{wizard:wizard},  
                success:this.successEstadoSinc,
                failure: this.conexionFailure,
                timeout:this.timeout,
                scope:this
            });
           
     },
     
   
	successEstadoSinc:function(resp){
        Phx.CP.loadingHide();
        resp.argument.wizard.panel.destroy()
        this.reload();
     },
	
	loadCheckDocumentosSolWf:function() {
            var rec=this.sm.getSelected();
            rec.data.nombreVista = this.nombreVista;
            Phx.CP.loadWindows('../../../sis_workflow/vista/documento_wf/DocumentoWf.php',
                    'Documentos del Proceso',
                    {
                        width:'90%',
                        height:500
                    },
                    rec.data,
                    this.idContenedor,
                    'DocumentoWf'
        )
    },
    
    onOpenObs:function() {
            var rec=this.sm.getSelected();
            
            var data = {
            	id_proceso_wf: rec.data.id_proceso_wf,
            	id_estado_wf: rec.data.id_estado_wf,
            	num_tramite: rec.data.num_tramite
            }
            
            Phx.CP.loadWindows('../../../sis_workflow/vista/obs/Obs.php',
                    'Observaciones del WF',
                    {
                        width:'80%',
                        height:'70%'
                    },
                    data,
                    this.idContenedor,
                    'Obs'
        )
    },
    
    
     
    
     failureWizard:function(resp1,resp2,resp3,resp4,resp5){ 
        var resp = resp1;// error conexion
        var reg = Ext.util.JSON.decode(Ext.util.Format.trim(resp.responseText));
        if (reg.ROOT.detalle.mensaje.indexOf('insuficientes')!=-1) {
            var mensaje = reg.ROOT.detalle.mensaje;
            mensaje = mensaje.replace(/#/g, "");
            mensaje = mensaje.replace("*", "");            
            mensaje = mensaje.replace("*", "");
            mensaje = mensaje.replace("{", "");
            mensaje = mensaje.replace("}", "");
            alert(mensaje);
            Phx.CP.loadingHide();
            
        } else {
            Phx.vista.Informe.superclass.conexionFailure.call(this,resp1,resp2,resp3,resp4,resp5);
        }
        
    }, 
    successWizard:function(resp){
        var rec=this.sm.getSelected();
        
       
        Phx.CP.loadingHide();
        resp.argument.wizard.panel.destroy()
        this.reload();
     }, 
	
	
	bdel:true,
	bsave:true
	}
)
</script>
		
		