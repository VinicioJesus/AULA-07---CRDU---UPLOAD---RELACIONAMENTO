<?php

  /*
  * $request -> Recebe dados do corpo da requisição (JSON, FORM/DATA, XML, etc)
  * $response -> Envia dados de retorno da API
  * $args -> Permite receber dados de atributos na API
  *
  */


  //import do arquivo autoload, que fará as instancias do slim
  require_once('vendor/autoload.php');  

  //Criando um objeto do slim chamado app, para coonfigurar os endpoints(rotas)
  $app = new \Slim\App();
  //Endpoint Requisiçã para listar todos os contatos
  $app->get('/contatos', function($request, $response, $args){
    //import da controller de contatos, que fará a busca de dados
    require_once('../modulo/config.php');
    require_once('../controller/controllerContatos.php');
    //solicita os dados para a controller
    if($dados = listarContato())
    {
      //realiza a conversão do array de dados para json
      if ($dadosJSON = createJSON($dados))
      {   
          // Caso exista dados a serem retornados, informamos o statusCode 200 e
          // enviamos um JSON com todos os dados encontrados
          $response   ->withStatus(200)
                      ->withHeader('Content-Type', 'application/json')
                      ->write($dadosJSON);
      }
  
    }else{

      //retorna os statusCode que significa que a requisição foi aceita, porém 
      //sem conteudo de retorno
      $response   ->withStatus(204)
                  ->withHeader('Content-Type', 'application/json')
                  ->write('{"message":"Nenhum contato encontrado"}');
    }
    
  });
  //Endpoint Requisiçã para listar contatos pelo id
  $app->get('/contatos/{id}', function($request, $response, $args){
    
    //Recebe o id do registro que devera ser retornado pela api
    //Esse ID está chegando pela varável criada no endpoint
    $id = $args['id'];
     
     //import da controller de contatos, que fará a busca de dados
    require_once('../modulo/config.php');
    require_once('../controller/controllerContatos.php');
    //solicita os dados para a controller
    if($dados = buscarContato(id))
    {
      if (!isset($dados['idErro'])) {
        
        //realiza a conversão do array de dados para json
      if ($dadosJSON = createJSON($dados))
        {   
            // Caso exista dados a serem retornados, informamos o statusCode 200 e
            // enviamos um JSON com todos os dados encontrados
           return $response   ->withStatus(200)
                              ->withHeader('Content-Type', 'application/json')
                              ->write($dadosJSON);
        }

      }else {
        $dadosJSON = createJSON($dados);

        return $response  ->withStatus(404)
                          ->withHeader('Content-Type', 'application/json')
                          ->write('{"message": "Dados inválidos",
                          "Erro": '.$dadosJSON.' }');
                          
      }
    }else{

      //retorna os statusCode que significa que a requisição foi aceita, porém 
      //sem conteudo de retorno
      return $response   ->withStatus(204);
                  
    }

  });
  //Endpoint Requisiçã para inserir um novo contato
  $app->post('/contatos', function($request, $response, $args){

  });
  //Executa todos os Endpoint
  $app->run();
  

  //Endpoit: Requisição para deletar um contato
  $app->delete('/contatos/{id}', function($request, $response, $args){

    //Recebe o id do registro que devera ser retornado pela api
    //Esse ID está chegando pela varável criada no endpoint

    if(!is_numeric($args['id'])){
      $id = $args['id'];
      //import da controller de contatos, que fará a busca de dados
    require_once('../modulo/config.php');
    require_once('../controller/controllerContatos.php');
    }else {
        $dadosJSON = createJSON($dados);

        return $response  ->withStatus(404)
                          ->withHeader('Content-Type', 'application/json')
                          ->write('{"message": "Dados inválidos ",}');
                          
      }

      die;
    
     
     
    //solicita os dados para a controller
    if($dados = excluirContato(id))
    {
      if (!isset($dados['idErro'])) {
        
        //realiza a conversão do array de dados para json
      if ($dadosJSON = createJSON($dados))
        {   
            // Caso exista dados a serem retornados, informamos o statusCode 200 e
            // enviamos um JSON com todos os dados encontrados
           return $response   ->withStatus(200)
                              ->withHeader('Content-Type', 'application/json')
                              ->write($dadosJSON);
        }

      }
    }else{

      //retorna os statusCode que significa que a requisição foi aceita, porém 
      //sem conteudo de retorno
      return $response   ->withStatus(204);
                  
    }

  });


?>