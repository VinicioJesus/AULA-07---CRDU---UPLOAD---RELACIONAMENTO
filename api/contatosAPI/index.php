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
    if($dados = buscarContato($id))
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
    
    //Recebe do header da requisição qual será o content type
    $contentTypeHeader = $request->getHeaderLine('Content-Type');
    //Cria um array ois dependendo do content-type temos mais informações separadas
    $contentType = explode(';', $contentTypeHeader);

    
    echo ($contentTypeHeader);
   

    switch ($contentType[0]) {
      case 'multipart/form-data':

        //Recebe os dados enviado pelo corpo da requisição
        $dadosBody = $request->getParsedBody();

        //Recebe uma imagem enviada pelo corpo da requisição
        $uploadFiles = $request->getUploadedFiles();
        //Cria um array com toos os dados que chegaram pela requisição, devido aos dados serem protegidos
        //criamos um array e recuperamos os dados pelos metodos do objeto
      $arrayFoto = array( "name"     => $uploadFiles['foto']->getClientFileName(),
                          "type"     => $uploadFiles['foto']->getClientMediaType(),                          
                          "size"     => $uploadFiles['foto']->getSize(),
                          "tmp_name" => $uploadFiles['foto']->file
                          
                        
      );
      //Cria uma chave chamada  "foto" para coloca todos os dados do objeto, conforme é gerado em form
      $file = array("foto" => $arrayFoto);
      //Cria um array com toods os dados couns e do do arquivo que será enviado para o servidor
      $arrayDados = array( $dadosBody, 
                          "file" => $file
                        
      );
      //import da controller de contatos, que fará a busca de dados
      require_once('../modulo/config.php');
      require_once('../controller/controllerContatos.php');
      
      $resposta = inserirContato($arrayDados);

      if (is_bool($resposta) && $resposta == true) {

        return $response   ->withStatus(201)
                            ->withHeader('Content-Type', 'application/json')
                            ->write('{"message":"Contato inserido com sucesso"}');

      } elseif (is_array($resposta) && $resposta['idErro'])        
      {
        $dadosJSON = createJSON($resposta);

        return $response   ->withStatus(400)
                            ->withHeader('Content-Type', 'application/json')
                            ->write('{"message":"Erro ao inserir contato."},
                            "Erro": '.$dadosJSON.' }');
      }
        
        return $response   ->withStatus(200)
                           ->withHeader('Content-Type', 'application/json')
                           ->write('{"message":"Formato selecionado foi o multipart/form-data"}');
        break;      
      case 'application/json':
        return $response   ->withStatus(200)
                           ->withHeader('Content-Type', 'application/json')
                           ->write('{"message":"Formato selecionado foi o application/json"}');
        break;      
        default:
        return $response  ->withStatus(400)
                          ->withHeader('Content-Type', 'application/json')
                          ->write('{"message": "Formato do content type não suportado"}');
        break;
    }

  });
  //Executa todos os Endpoint
  $app->run();
  

  //Endpoit: Requisição para deletar um contato
  $app->delete('/contatos/{id}', function($request, $response, $args){

    if(is_numeric($args['id']))
    {
      require_once('../modulo/config.php');
      require_once('../Controller/controllerContatos.php');

      //Recebe o id enviado no Endpoint atraves da vareavel ID
      $id = $args['id'];

      //Busca o nome da foto para ser excluida na coontroller
      if($dados = buscarContato($id))
      {
        //Recebe o nome da foto que a controller retornou
        $foto = $dados['foto'];

        //Cria um arra com o nome da foto e do id para que a controller possa excluir o contato
        $arrayDados = array (
            "id"    => $id,
            "foto"  => $foto
        );

        //Chama a funtion de excluir contato, encaminhando o array com o ID e a FOTO
        $resposta = excluirContato($arrayDados);
        if(is_bool($resposta) && $resposta == true)
        {
          return  $response   ->withStatus(200)
                              ->withHeader('Content-Type', 'application/json')
                              ->write('{"message" : "Registro excluido com sucesso"}');
        }elseif(is_array($resposta) && isset($resposta['idErro']))
        {
          if($resposta['idErro'] == 5)
          {
            return  $response   ->withStatus(200)
                                ->withHeader('Content-Type', 'application/json')
                                ->write('{"message" : "Resgistro excluido com sucesso, porém houve um problema na exclusão da foto"}');
          }else{

          
            $dadosJSON=createJSON($resposta);

            return  $response ->withStatus(404)
                              ->withHeader('Content-Type', 'application/json')
                              ->write('{"message" : "Ouve um problema no processo de excluir",
                                      "Erro" : '.$dadosJSON.'}');
          }                          
        }
      }else
      {
        return  $response   ->withStatus(404)
                            ->withHeader('Content-Type', 'application/json')
                            ->write('{"message" : "O ID informado não existe na base de dados"}');
      }
    }else
    {
      return  $response   ->withStatus(404)
                          ->withHeader('Content-Type', 'application/json')
                          ->write('{"message" : "É obrigatorio informar um ID com formato valido (número)"}');
    }
    

  });


?>