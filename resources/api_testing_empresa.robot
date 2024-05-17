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
    
    # ${resposta}    POST On Session    url=${URL}${endpoint}    json=${body}    headers=${headers}
    

    # Log    Status Code: ${resposta.status_code}
    # Log    Response Content: ${resposta.content}
    
    # ${resposta}  POST On Session
    # ...    alias=ApiLost
    # ...    url=/api/company/
    # ...    json=${body}
    # Log    ${resposta.json()}

    # Set Test Variable    ${RESPOSTA}     ${resposta.json()}
# Criar dados de Endereço
#     ${address}        Create Dictionary
#     ${zipCode}        Generate Random String     length=8         chars=[NUMBERS]
#     ${city}           Generate Random String     length=40        chars=[LETTERS]
#     ${city}           Convert To Lower Case      ${city}
#     ${state}          Generate Random String     length=2         chars=[LETTERS]
#     ${district}       Generate Random String     length=20        chars=[LETTERS] 
#     ${district}       Convert To Lower Case      ${district}
#     ${street}         Generate Random String     length=20        chars=[LETTERS]  
#     ${number}         Generate Random String     length=8         chars=[NUMBERS]
#     ${complement}     Generate Random String     length=40        chars=\[LETTERS]\[NUMBERS]
#     ${complement}     Convert To Lower Case      ${complement}
#     ${country}        Generate Random String     length=20        chars=[LETTERS]
#     ${country}        Convert To Lower Case      ${country}
#     Set Test Variable    ${address}    ${address.json()}
#     Log    ${address}

    
    



  

    

    
  
  
  