<?php
/**
*@package pXP
*@file gen-ACTTipoDoc.php
*@author  (admin)
*@date 31-01-2017 09:39:28
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTTipoDoc extends ACTbase{    
			
	function listarTipoDoc(){
		$this->objParam->defecto('ordenacion','id_tipo_doc');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODTipoDoc','listarTipoDoc');
		} else{
			$this->objFunc=$this->create('MODTipoDoc');
			
			$this->res=$this->objFunc->listarTipoDoc($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarTipoDoc(){
		$this->objFunc=$this->create('MODTipoDoc');	
		if($this->objParam->insertar('id_tipo_doc')){
			$this->res=$this->objFunc->insertarTipoDoc($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarTipoDoc($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarTipoDoc(){
			$this->objFunc=$this->create('MODTipoDoc');	
		$this->res=$this->objFunc->eliminarTipoDoc($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>