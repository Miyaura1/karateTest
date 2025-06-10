Feature: Consultas PATCH y DELETE

Scenario: Actualizar el firstname de un booking existente (PATCH)

  #Obtenemos un token de autorización a la API
  Given url 'https://restful-booker.herokuapp.com/auth'
  And header Content-Type = 'application/json'
  And request { username: 'admin', password: 'password123' }
  When method POST
  Then status 200
  And def token = response.token
  
  #Mostramos el booking con id = 777
  Given url 'https://restful-booker.herokuapp.com/booking/777'
  And header Accept = 'application/json'
  When method GET
  Then status 200
  And print response
  

  #Modificamos el registro con id = 777
  Given url 'https://restful-booker.herokuapp.com/booking/777'
  And header Content-Type = 'application/json'
  And header Accept = 'application/json'
  And header Cookie = 'token=' + token
  And request { firstname: 'Miyaura', lastname: 'Tello' }
  When method PATCH
  Then status 200
  And print response
  
Scenario: Eliminar un booking existente (DELETE)

  # Eliminamos el registro con id = 777
  Given url 'https://restful-booker.herokuapp.com/booking/777'
  And header Content-Type = 'application/json'
  And header Accept = 'application/json'
  And header Authorization = 'Basic YWRtaW46cGFzc3dvcmQxMjM='
  When method DELETE 
  Then status 201