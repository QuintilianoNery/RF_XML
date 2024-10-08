*** Settings ***
# Bibliotecas
Library    RequestsLibrary
Library    XML

# Build XML
Library   resource/build_xml/build_xml_tempconvert.py

# Rotas
Resource    resource/routes/tempConvert.resource

*** Variables ***
# URL
${W3SCHOOLS_URL_BASE}    https://www.w3schools.com

# EndPoints
${W3SCHOOLS_URI_TEMPCONVERTER}    xml/tempconvert.asmx