# A Basic Flutter App (CRUD and Login/Register) using MVP design pattern
This is a simple android app with basic function like crud and login - register<br>
with Model-View-Presenter Peresentation Pattern

## For the API you can use our api at https://resep-mau.herokuapp.com/api/ <br>
## thanks to <a href="https://github.com/royhan31">royhan31</a> for api
url :
https://resep-mau.herokuapp.com/api/login [POST] <br>
https://resep-mau.herokuapp.com/api/register [POST] <br>
https://resep-mau.herokuapp.com/api/post [GET] <br>
https://resep-mau.herokuapp.com/api/post [POST] <br>
https://resep-mau.herokuapp.com/api/post/{id} [GET] <br>
https://resep-mau.herokuapp.com/api/post/{id} [PUT] <br>
https://resep-mau.herokuapp.com/api/post/{id} [DELETE] <br>

You can always see my sample at this project 

header:
Authorization : Bearer <your_api_token_from registering_or_login_user>

## Note
Im using retrofit library for flutter. I dont know why @PUT method not work<br>
when im using @FormUrlEncoded().<br>

So, i change it and send parameters as json. :)<br>

YOU DONT NEED TO WRITE CODE WITH XX.G.DART<br>
file with g.dart is generated automtically with syntax:<br>

flutter pub run build_runner build

for more please visit retrofit flutter page.

## Screenshot
Here are some sample images

<img src="https://github.com/ydhnwb/resepmau_mvp_flutter/blob/master/screenshots/Screenshot_20190819-224643.png" width="200" height="400">
<img src="https://github.com/ydhnwb/resepmau_mvp_flutter/blob/master/screenshots/Screenshot_20190819-224649.png" width="200" height="400">
<img src="https://github.com/ydhnwb/resepmau_mvp_flutter/blob/master/screenshots/Screenshot_20190819-224655.png" width="200" height="400">
<img src="https://github.com/ydhnwb/resepmau_mvp_flutter/blob/master/screenshots/Screenshot_20190819-224703.png" width="200" height="400">
<img src="https://github.com/ydhnwb/resepmau_mvp_flutter/blob/master/screenshots/Screenshot_20190819-224710.png" width="200" height="400">
<img src="https://github.com/ydhnwb/resepmau_mvp_flutter/blob/master/screenshots/Screenshot_20190819-224714.png" width="200" height="400">

