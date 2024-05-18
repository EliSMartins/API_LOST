*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections

*** Variables ***
${URL}                 https://lost.qacoders-academy.com.br
${MAIL_ADMIN}          sysadmin@qacoders.com
${PASSWORD_ADMIN}      1234@Test
${TOKEN}


*** Keywords ***
Criar sessão
    ${headers}    Create Dictionary    Accept=application/json    Content-Type=application/json   Authorization=${TOKEN} 
    Create Session    alias=ApiLost    url=${URL}    headers=${headers}
    Set Global Variable    ${headers}
Fazer login com usuário sysadmin
    ${body}    Create Dictionary    mail=${MAIL_ADMIN}   password=${PASSWORD_ADMIN}
    Log    ${body}
    Criar Sessão
    ${resposta}    POST On Session    alias=ApiLost    url=/api/login/    json=${body}
    Log    ${resposta.json()}
    Set Global Variable  ${TOKEN}     ${resposta.json()['token']}
    Set Global Variable    ${RESPOSTA}           ${resposta.json()}
    Log    ${TOKEN}
Validar o token e gravar em um header de autorização
    ${headers}     Create Dictionary    Authorization=Bearer ${TOKEN}
    ${resposta}    GET On Session       alias=ApiLost   url=/api/validateToken    headers=${headers}
    Log    ${resposta.content}
    Log    ${TOKEN}
Criar massa de dados de usuário
    ${palavra_randomica}  Generate Random String   length=8  chars=[LETTERS]
    ${palavra_randomica}  Convert To Lower Case    ${palavra_randomica}
    Set Test Variable     ${EMAIL_TESTE}           ${palavra_randomica}@qacoders.com
    Log    ${EMAIL_TESTE}
    ${palavra_rondomica_cpf}  Generate Random String  length=11  chars=[NUMBERS]
    Set Test Variable    ${CPF}                       ${palavra_rondomica_cpf}
    Log                  ${CPF}
Criar um novo usuário
    ${palavra_randomica}  Generate Random String   length=8  chars=[LETTERS]
    ${palavra_randomica}  Convert To Lower Case    ${palavra_randomica}
    Set Test Variable    ${EMAIL_TESTE}            ${palavra_randomica}@qacoders.com.br
    Log                  ${EMAIL_TESTE}
Cadastrar um novo usuário 
     Criar um novo usuário
    ${body}    Create Dictionary
    ...    fullName=Eliene Sousa
    ...    mail=${EMAIL_TESTE}
    ...    password=1234@Teste
    ...    accessProfile=ADMIN
    ...    cpf=${CPF}
    ...    confirmPassword=1234@Teste   
     Log    ${body}

    Criar sessão
    ${resposta}  POST On Session
    ...    alias=ApiLost
    ...    url=/api/user/
    ...    json=${body}
    
    Log    ${resposta.json()}
    Set Test Variable    ${ID_USER}      ${resposta.json()["user"]["_id"]}
    Set Test Variable    ${RESPOSTA}     ${resposta.json()}
Conferir se o usuário foi cadastrado corretamente
    Log    ${RESPOSTA}
    Dictionary Should Contain Item    ${RESPOSTA}   msg     Olá Eliene Sousa, cadastro realizado com sucesso.
    Dictionary Should Contain Key     ${RESPOSTA}   user    _id
Consultar os dados do usuário
    ${resposta_consulta}    GET On Session    alias=ApiLost   url=/api/user/${ID_USER}
    Set Test Variable    ${RESPOSTA_CONSULTA}    ${resposta_consulta.json()}
Conferir os dados retornados
    Log    ${RESPOSTA_CONSULTA}
    Dictionary Should Contain Item    ${RESPOSTA_CONSULTA}    fullName        Eliene Sousa
    Dictionary Should Contain Item    ${RESPOSTA_CONSULTA}    mail            ${EMAIL_TESTE}       
    Dictionary Should Contain Item    ${RESPOSTA_CONSULTA}    accessProfile   ADMIN
    Dictionary Should Contain Item    ${RESPOSTA_CONSULTA}    cpf             ${CPF}
    Dictionary Should Contain Item    ${RESPOSTA_CONSULTA}    _id             ${ID_USER}


     

    

    


    
