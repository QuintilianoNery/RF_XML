*** Settings ***
Resource    ../base.resource

*** Test Cases ***
Cenário: Converter Temperatura de Celsius para Fahrenheit

    Post TempConverter
    ...  celsius_value=100

    Assert TempConverter
    ...  fahrenheit_result=212

Cenário: Converter Temperatura de Fahrenheit para Celsius

    Post TempConverter
    ...  fahrenheit_value=212

    Assert TempConverter
    ...  celsius_result=100