*** Settings ***
Resource    ../resources/api_testing.resource

*** Variables ***

*** Test Cases ***
Cenário 01:Logar com usuário administrador
    Criar sessão
    Fazer login com usuário sysadmin
    Validar o token e gravar em um header de autorização
Cenário 02:Cadastrando usuários
    Criar sessão
    Fazer login com usuário sysadmin
    Validar o token e gravar em um header de autorização
    Criar massa de dados de usuário
    Criar um novo usuário
    Cadastrar um novo usuário   
    Conferir se o usuário foi cadastrado corretamente
    Consultar os dados do usuário
    Conferir os dados retornados
    # Alterar perfil de acesso administrador de true para false      
    # Conferir se o usuário foi excluído corretamente
# Cenário 02: Consultar diretorias - GET
#     Criar sessão
#     Fazer login com usuário sysadmin
#     Validar o token e gravar em um header de autorização
#     Consultar diretorias


    



    
   
