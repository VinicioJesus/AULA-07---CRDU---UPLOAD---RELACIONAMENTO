<?php 
    /***********************************************************************
     * Objetivo: Arquivo responsavel por manipular os dados dentro do BD 
     *      (select)
     * Autor: Marcel
     * Data: 10/05/2022
     * Versão: 1.0
    ************************************************************************/

    // import do arquivo que estavbece a conexão com o BD
    require_once('conexaoMysql.php');


    //Função para listar todos os estados do BD
    function selectAllEstados()
    {
        //Abre a conexão com o BD
        $conexao = conexaoMysql();

        //script para listar todos os dados do BD
        $sql = "select * from tblestado order by nome asc";
        
        //Executa o scrip sql no BD e guarda o retorno dos dados, se houver
        $result = mysqli_query($conexao, $sql);

        //Valida se o BD retornou registros
        if($result)
        {
            //mysqli_fetch_assoc() - permite converter os dados do BD 
            //em um array para manipulação no PHP
            //Nesta repetição estamos, convertendo os dados do BD em um array ($rsDados), além de
            //o próprio while conseguir gerenciar a qtde de vezes que deverá ser feita a repetição
            $cont = 0;
            while ($rsDados = mysqli_fetch_assoc($result))
            {
                //Cria um array com os dados do BD
                $arrayDados[$cont] = array (
                    "idestado"  =>  $rsDados['idestado'],
                    "nome"      =>  $rsDados['nome'],
                    "sigla"     =>  $rsDados['sigla'],
                );
                $cont++;
            }

            //Solicta o fechamento da conexão com o BD
            fecharConexaoMysql($conexao);

            
            //select id from tblproduto order by id desc limit 1

            return $arrayDados;
        }

    }

?>