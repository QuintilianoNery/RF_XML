*** Settings ***
Resource    ../../base.resource


*** Keywords ***
Post TempConverter
    [Arguments]
    ...  ${celsius_value}=${None}
    ...  ${fahrenheit_value}=${None}
    ...  ${expected_status}=200

    ${headers}  Create Dictionary  Content-Type=text/xml; charset=utf-8
    
    IF    ${celsius_value}
        ${data}  Build Xml TempConvert  celsius_value=${celsius_value}
    ELSE IF    ${fahrenheit_value}
        ${data}  Build Xml TempConvert  fahrenheit_value=${fahrenheit_value}
    END

    ${response}  POST  
    ...  url=${W3SCHOOLS_URL_BASE}/${W3SCHOOLS_URI_TEMPCONVERTER}
    ...  headers=${headers}
    ...  data=${data}
    ...  expected_status=${expected_status}

    Set Test Variable    ${response}

Assert TempConverter
    [Arguments]
    ...  ${celsius_result}=${None}
    ...  ${fahrenheit_result}=${None}

    ${root}  Parse Xml    ${response.content}

    IF    ${celsius_result}
        Element Text Should Be    ${root}  ${celsius_result}  xpath=.//FahrenheitToCelsiusResult
    ELSE IF    ${fahrenheit_result}
        Element Text Should Be    ${root}  ${fahrenheit_result}    xpath=.//CelsiusToFahrenheitResult
    END