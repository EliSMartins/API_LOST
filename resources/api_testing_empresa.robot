*** Settings ***

Library    RequestsLibrary
Library    String
Library    Collections

*** Variables ***
${URL}                 https://lost.qacoders-academy.com.br
${MAIL_ADMIN}          sysadmin@qacoders.com
${PASSWORD_ADMIN}      1234@Test
${TOKEN}
${headers}             Create Dictionary    Accept=application/json
${endpoint}            /api/company

*** Keywords ***

Criar massa de dados de uma empresa
    ${body}    Create Dictionary
    ...        corporateName=Teste do Teste
    ...        registerCompany=12126456000155
    ...        mail=test@test.com
    ...        matriz=Teste
    ...        responsibleContact=Marcio
    ...        telephone=99999999999999
    ...        serviceDescription=Testes

    



  

    

    
  
  
  