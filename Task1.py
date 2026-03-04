#Hexadecimal Encoding
text = "Hello=!"
hex_encoded = text.encode("utf-8").hex()
print("Original:", text)
print("Hex Encoded:", hex_encoded)

#Url Encodingfrom urllib.parse import quote

text = "Hello, How are you?"

url_encoded = quote(text)

print("Original:", text)
print("URL Encoded:", url_encoded)
