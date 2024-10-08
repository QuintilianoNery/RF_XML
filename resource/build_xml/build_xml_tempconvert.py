def build_xml_tempConvert(celsius_value=None, fahrenheit_value=None):

    # Template XML base
    xml_template = """<?xml version="1.0" encoding="utf-8"?>
    <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
        <soap:Body>
            {conversion}
        </soap:Body>
    </soap:Envelope>"""

    # Define o nó de conversão baseado no valor fornecido
    if celsius_value is not None:
        conversion = f"""<CelsiusToFahrenheit xmlns="https://www.w3schools.com/xml/">
                             <Celsius>{celsius_value}</Celsius>
                         </CelsiusToFahrenheit>"""
    elif fahrenheit_value is not None:
        conversion = f"""<FahrenheitToCelsius xmlns="https://www.w3schools.com/xml/">
                             <Fahrenheit>{fahrenheit_value}</Fahrenheit>
                         </FahrenheitToCelsius>"""
    else:
        return "Please provide either a Celsius or Fahrenheit value."

    # Formata o XML final
    return xml_template.format(conversion=conversion)