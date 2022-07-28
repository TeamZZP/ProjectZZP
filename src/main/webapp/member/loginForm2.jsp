<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZZP</title>
<style type="text/css">
.main {
    width: 250px;
    height: 300px;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    border: 1px solid lightgrey;
    border-radius: 5px;
}

.logo {
    margin-top: 0px;
    margin-bottom: 40px;
}

#login {
    width: 100%;
    background-color: skyblue;
    border-color: transparent;
    color: white;
}

.account {
    display: block;
    margin-bottom: 3px;
    padding: 3px;
    border: 1px solid lightgray;
    border-radius: 3px;
}

#alert {
    border-color: transparent;
}

</style>
</head>
<body>

<div class="form-floating">
      <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" style="size: 40px">
      <label for="floatingInput">Email address</label>
    </div>
    <div class="main">
        <h1 class="logo">Acidgram</h1>
        <div class="container">
            <input type="text" placeholder="ID" id="id" class="account">
            <input type="password" placeholder="Password" id="password" class="account">
            <button id="login" class="account">login</button>
            <p id="alert" class="account"> </p>
        </div>
    </div>
    <script src="script.js">
    const id = document.getElementById('id')
    const password = document.getElementById('password')
    const login = document.getElementById('login')
    let errStack = 0;

    login.addEventListener('click', () => {
        if (id.value == 'acid') {
            if (password.value == '0000') {
                alert('로그인 되었습니다!')
            }
            else {
                alert('아이디와 비밀번호를 다시 한 번 확인해주세요!')
                errStack ++;
            }
        }
        else {
            alert('존재하지 않는 계정입니다.')
        }

        if (errStack >= 5) {
            alert('비밀번호를 5회 이상 틀리셨습니다. 비밀번호 찾기를 권장드립니다.')
        }
    })
    </script>
</body>
</body>
</html>