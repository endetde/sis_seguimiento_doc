<?php
/**
*@package pXP
*@file gen-ACTInforme.php
*@author  (admin)
*@date 31-01-2017 10:17:46
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTInforme extends ACTbase{    
			
	function listarInforme(){
		$this->objParam->defecto('ordenacion','id_informe');
		$this->objParam->defecto('dir_ordenacion','asc');
		$this->objParam->addParametro('id_funcionario_usu',$_SESSION["ss_id_funcionario"]); 
		
		
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODInforme','listarInforme');
		} else{
			$this->objFunc=$this->create('MODInforme');
			
			$this->res=$this->objFunc->listarInforme($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
	
	function listarInformeReg(){
		$this->objParam->defecto('ordenacion','id_informe');

		$this->objParam->defecto('dir_ordenacion','asc');
		
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODInforme','listarInformeReg');
		} else{
			$this->objFunc=$this->create('MODInforme');			
			$this->res=$this->objFunc->listarInformeReg($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarInforme(){
		$this->objFunc=$this->create('MODInforme');	
		if($this->objParam->insertar('id_informe')){
			$this->res=$this->objFunc->insertarInforme($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarInforme($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarInforme(){
			$this->objFunc=$this->create('MODInforme');	
		$this->res=$this->objFunc->eliminarInforme($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
	
	
	function siguienteEstado(){
        $this->objFunc=$this->create('MODInforme');  
        
        $this->objParam->addParametro('id_funcionario_usu',$_SESSION["ss_id_funcionario"]); 
        
        $this->res=$this->objFunc->siguienteEstado($this->objParam);
        $this->res->imprimirRespuesta($this->res->generarJson());
    }
    
    function anteriorEstado(){
        $this->objFunc=$this->create('MODInforme');  
        $this->objParam->addParametro('id_funcionario_usu',$_SESSION["ss_id_funcionario"]); 
        $this->res=$this->objFunc->anteriorEstado($this->objParam);
        $this->res->imprimirRespuesta($this->res->generarJson());
    }
	
			
}

?>