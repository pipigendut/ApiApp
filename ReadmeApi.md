# API Documentation

#### Create User [POST]
+ Endpoint
[/api/v1/users]

+ cURL
```
curl -X POST \
  http://localhost:3000/api/v1/users \
  -H 'cache-control: no-cache' \
  -H 'content-type: multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW' \
  -F email=userone@gmail.com \
  -F username=userone \
  -F password=123456 \
  -F password_confirmation=123456
```
+ Screenshoot
![Imgur](https://i.imgur.com/Fg8H7JF.png)


#### Login [POST]
+ Endpoint
[/api/v1/auth/login]

+ cURL
```
curl -X POST \
  http://localhost:3000/api/v1/auth/login \
  -F email=userone@gmail.com \
  -F password=123456
```
+ Screenshoot
![Imgur](https://i.imgur.com/pRvWh3I.png)

Note: use auth tokens obtained at login
#### Profile [GET]
+ Endpoint
[/api/v1/users/{username}]

+ cURL
```
curl -X GET \
  http://localhost:3000/api/v1/users/userone \
  -H 'Authorization: a2f38a55b67310e3e2becb90c7046704' \
  -H 'Postman-Token: 1db4ba81-2b6c-4a69-8b1a-e7601eddeea5' \
  -H 'cache-control: no-cache'
```
+ Screenshoot
![Imgur](https://i.imgur.com/3SBb0Gt.png)

#### Product [GET]
+ Endpoint
[/api/v1/products]

+ cURL
```
curl -X GET \
  http://localhost:3000/api/v1/products \
  -H 'Authorization: a2f38a55b67310e3e2becb90c7046704' \
```
+ Screenshoot
![Imgur](https://i.imgur.com/8ginzE3.png)


#### Purchasing [POST]
+ Endpoint
[/api/v1/purchases]

Note: use registered user id
+ cURL
```
curl -X POST \
  http://localhost:3000/api/v1/purchases \
  -H 'Authorization: a2f38a55b67310e3e2becb90c7046704' \
  -d '{
	"purchases_attributes": [{
			"user_id": "13",
			"product_id": "1",
			"quantity": "3",
			"info": "jangan jatuh",
			"purchase_date": "2018-01-30 10:26:2 -0500"
		},
		{
			"user_id": "13",
			"product_id": "1",
			"quantity": "1",
			"info": "jangan pecah",
			"purchase_date": "2018-01-30 10:26:2 -0500"
		}
	]
}'
```
+ Screenshoot
![Imgur](https://i.imgur.com/Xm19N7b.png)


#### See History [GET]
+ Endpoint
[/api/v1/{username}/history]

+ cURL
```
curl -X GET \
  http://localhost:3000/api/v1/userone/history \
  -H 'Authorization: a2f38a55b67310e3e2becb90c7046704' \
```
+ Screenshoot
![Imgur](https://i.imgur.com/3wf8MFI.png)


#### Search Products [GET]
+ Endpoint
[/api/v1/products/search?name_product=p&type_product=p]

+ cURL
```
curl -X GET \
  'http://localhost:3000/api/v1/products/search?name_product=p&type_product=p' \
  -H 'Authorization: a2f38a55b67310e3e2becb90c7046704' \
```
+ Screenshoot
![Imgur](https://i.imgur.com/arrAPsb.png)
