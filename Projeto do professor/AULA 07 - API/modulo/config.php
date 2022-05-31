<?php
    /**************************************************************************************
     * Objetivo: Arquivo responsavel pela criação de variaveis e constantes do projeto
     * Autor: Marcel
     * Data: 25/04/2022
     * Versão: 1.0
    ****************************************************************************************/

    /******************** VARIAVEIS E CONSTANTES GLOBAIS DO PROJETO   ****************************************/
    //Limitação de 5mb para upload de imagens
    const MAX_FILE_UPLOAD = 5120;
    const EXT_FILE_UPLOAD = array("image/jpeg", "image/jpg", "image/gif", "image/png");
    const DIRETORIO_FILE_UPLOAD = "arquivos/";


    define('SRC',  $_SERVER['DOCUMENT_ROOT'].'/marcel/20221/php20221/AULA07/');


    /*************** FUNÇÕES GLOBAIS PARA O PROJETO ************ */

    //função para converter um array em um formato JSON
    function createJSON ($arrayDados)
    {
        //Validação para tratar array sem dados
        if (!empty($arrayDados))
        {
            //configura o padrão da conversão para o formato JSON
            header('Content-Type: application/json');
            $dadosJSON = json_encode($arrayDados);
            
            //json_encode(); - converte um array para JSON
            //json_decode(); - converte um JSON para array

            return $dadosJSON;
        }else
        {
            return false;
        }
        

    }
   


?>