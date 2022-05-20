<?php

  //import do arquivo autoload, que fará as instancias do slim
  require_once('vendor/autoload.php'); 
  

  //Criando um objeto do slim chamado app, para coonfigurar os endpoints(rotas)
  $app = new \Slim\App();
  //Endpoint Requisiçã para listar todos os contatos
  $app->get('/contatos', function($request, $response, $args){
    //import da controller de contatos, que fará a busca de dados
    require_once('../modulo/config.php');
    require_once('../controller/controllerContatos.php');

    if($dados = listarContato())
    {
      if ($dadosJSON = createJSON($dados))
        {
            $response->write($dadosJSON);
        }
      
    }
    
  });
  //Endpoint Requisiçã para listar contatos pelo id
  $app->get('/contatos/{id}', function($request, $response, $args){

  });
  //Endpoint Requisiçã para inserir um novo contato
  $app->post('/contatos', function($request, $response, $args){

  });
  //Executa todos os Endpoint
  $app->run();
  

?>