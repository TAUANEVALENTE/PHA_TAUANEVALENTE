*** Settings ***
Documentation      Nesse arquivo ficar os exercicio do PHA 2022 de Tauane Valentw


*** Variables ***
# Indice             0        1      2       3
@{LISTA_FRUTA}    Maçã    Pera    Uva    Limão

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

&{PESSOA}
...    idade=29
...    ano_atual=2022



*** Test Cases ***

Cenario 01 Exercicio dicionario

        Log To Console   Nome:${DICIONARIO.nome}
        Log To Console   Sobrenome:${DICIONARIO.sobrenome}
        Log To Console   E-mail:${DICIONARIO.email}
        Log To Console   Idade:${DICIONARIO.idade}
        Log To Console   Rua:${DICIONARIO.numero}
        Log To Console   CEP:${DICIONARIO.cep}
        Log To Console   Bairro:${DICIONARIO.bairro}
        Log To Console   Cidade:${DICIONARIO.cidade}
        Log To Console   Estado:${DICIONARIO.estado}

Cenario 02 Exercício Argumentos e Retornos + If Simples
   Dados de acesso

Cenario 03 Exercício For Simples + Lista
    Contando a lista de frutas 

Cenario 04 Exercício If Inline + For in Range
    numeros par entre 0 e 10

*** Keywords ***
Dados de acesso
    Ano de nascimento    ${PESSOA.ano_atual}    ${PESSOA.idade}  
    nasceu antes de 2000      ${PESSOA.ano_atual}    ${PESSOA.idade}
nasceu antes de 2000
    [Arguments]   ${ANO_ATUAL}    ${IDADE}
    ${ANO_NACS}        Evaluate    ${ANO_ATUAL}-${IDADE}
    ${MENSAGEM}    Set Variable If    ${ANO_NACS}<2000    Você nasceu no século passado  
    Log To Console   ${MENSAGEM}
    IF    ${ANO_NACS}< 2000
            Set Variable    Você nasceu no século passado
    END
Ano de nascimento
    [Arguments]        ${ANO_ATUAL}    ${IDADE}
    ${ANO_NACS}        Evaluate    ${ANO_ATUAL}-${IDADE}
    [Return]            \n${ANO_NACS}
   

Contando a lista de frutas
    Log To Console    ${\n}
    FOR    ${FRUTA}    IN     @{LISTA_FRUTA} 
    Log To Console     Minha fruta é:${FRUTA}!
    END

numeros par entre 0 e 10
     Log To Console    ${\n}
    FOR  ${NUM_PAR}  IN RANGE    0    11
        IF  ${NUM_PAR}%2==0 
        Log To Console  Esse número é par:${NUM_PAR}
        END
    END

#Exit For Loop If    '${FRUTA}'=='banana'


