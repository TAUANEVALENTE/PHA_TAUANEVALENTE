*** Settings ***
Documentation      nesse arquivo ficar teste 

Library              SeleniumLibrary

Test Setup           Abrir o meu navegador
Test Teardown        Fechar navegador

*** Variables ***
${NOME}        TAUANE SANCHES WEBER BRANDÃO VALENTE

@{LISTA}        Pera        Uva        Melão        Cacau

&{DICIONARIO} 
...         nome=Tauane
...        sobrenome=Valente
...        email=tauanevalente@gmail.com
...        idade=29
...         rua=Maranhão
...        numero=461
...        cep=41830260
...        bairro=Pituba
...        cidade=Salvador
...        estado=Bahia

${URL}         http://automationpractice.com/index.php
${BROWSER}     chrome


*** Test Cases ***
Cenario 1: Preencher cadastro com email
        Dado que estou na tela de cadastro
        Quando colocar meu email 
        Então deve enviar para pagina de cadastro
Cenario 2: Preencher crie sua conta aqui
        Dado que estou na tela crie sua conta aqui
        Quando colocar minhas informações pessoais
        Então deve me direcionar para seu endereço
Cenario 3: Preencher crie sua conta aqui
        Dado que estou na tela crie sua conta aqui
        Quando colocar meu endreço e complemento
        Então deve registrar minhas informações e criar conta

*** Keywords ***
Abrir o meu navegador
    Open Browser    ${URL}    ${BROWSER}

Dado que eu esteja na tela de cadastro do site
       
        Log To Console informa usuario      ${NOME}
       
Quando pesquisar o produto 
       
    
        Log To Console  Lista de fruta         ${LISTA}[Pera]
        Log To Console  Lista de fruta         ${LISTA}[Uva]
        Log To Console  Lista de fruta         ${LISTA}[Melão]
        Log To Console  Lista de fruta         ${LISTA}[Cacau]
   
Então os dadoscadastras devem ser preenchidos
   
        Log To Console   Nome do cliente:           ${DICIONARIO.nome}
        Log To Console   Sobrenome do cliente:      ${DICIONARIO.sobrenome}
        Log To Console   E-mail do cliente:         ${DICIONARIO.email}
        Log To Console   Idade do cliente:          ${DICIONARIO.idade}
        Log To Console   Rua do cliente:            ${DICIONARIO.RUA}
        Log To Console   Número da rua cliente:     ${DICIONARIO.numero}
        Log To Console   CEP do cliente:            ${DICIONARIO.cep}
        Log To Console   Bairro do cliente:         ${DICIONARIO.bairro}
        Log To Console   Cidade do cliente:         ${DICIONARIO.cidade}
        Log To Console   Estado do cliente:         ${DICIONARIO.estado}

        