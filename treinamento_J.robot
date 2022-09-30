*** Settings ***
Test Teardown  fechar Browser
Library    SeleniumLibrary
Documentation     "robot -d ./results variables.robot" 

*** Test Cases ***

validar abertura do Browser
    [Tags]    TC0001
    [Documentation]    teste que valida pesquisa no google
    Dado que estou na pagina do google 
    Quando pesquiso por "Prime Control"
    Entao valido o resultado da pesquisa

***Keywords***
Dado que estou na pagina do google 
    [Documentation]    keyword responsável por abrir o navegador e acessar a pagina home do google
    Open Browser  https://www.google.com/  edge
    Maximize Browser Window

Quando pesquiso por "${texto}"
    [Documentation]    keyword responsável por preencher o campo de busca e dar enter
    Input Text    XPATH=//input[@class="gLFyf gsfi"]     ${texto}
    Press Keys    None   ENTER
    Set Test Variable    ${texto}

Entao valido o resultado da pesquisa
    [Documentation]     keyword responsável por validar resultado da pesquisa
    Page Should Contain Textfield   ${texto}
    Capture Page Screenshot      validacao.png
    
fechar Browser
    [Documentation]     keyword responsável por fechar o browser
    Close Browser
 