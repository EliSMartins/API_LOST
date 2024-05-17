*** Settings ***
Resource    ../resources/api_testing_empresa.robot
Resource    ../resources/api_testing.resource

*** Variables ***

*** Test Cases ***
Cenário 03:Criar uma nova empresa
    Criar sessão
    Fazer login com usuário sysadmin
    Validar o token e gravar em um header de autorização
    Criar massa de dados de uma empresa
    