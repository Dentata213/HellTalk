
    //var mainForm = document.querySelector("body > section > div > div:nth-child(2) > div > div > form");
    //var mainId = mainForm.id;
    //var mainPwd = mainForm.pwd;
    var form = document.forms[0];
    var id = form.id;
    var pwd = form.pwd;
    var gender = form.gender;
    var date = form.date;
    var nickName = form.nickName;
    var email = form.email;
    var phoneNo = form.phoneNo;
    var height = form.height;
    var weight = form.weight;
    var kind = form.kind;
    var button = document.querySelector(".btn");
    //var loginbutton = 

    /*
    loginbutton.onclick = function(){
        
        if(mainId.value.trim() === ""){
            alert("아이디를 입력 해주세요.");
            mainId.focus();
            return false;
            
        }else if(mainPwd.value.trim() === ""){
			alert("비밀번호를 입력 해주세요.");
            mainPwd.focus();
            return false;
		}
    }/////////
*/
    


    button.onclick = function(){
        //아이디 체크
        var regExp = /(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,}$/
        var regExpEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
        var regExpPhone = /^\d{3}-\d{3,4}-\d{4}$/;

        //성별 체크
        isGender = false;
        gender.forEach(function(item){
            //console.log("item:",item)
            if(item.checked)isGender = true; 
            console.log(isGender)
        });

        if(!isGender){
            //console.log(!isGender)
                alert("성별을 선택하여 주십시요")
                gender[0].focus();
                return false;
            }

        if(date.value.trim() === ""){
            alert("출생년도를 선택하여 주십시요");
            date.focus();
            return false;
        }

        if(id.value.trim() === ""){
            alert("아이디를 입력 해주세요.");
            id.focus();
            return false;
        }
        if(!regExp.test(id.value)){
            alert("아이디는 영문자와 숫자 그리고 특수문자가 포함되어야 하며 8자 이상 이어야합니다.");
            id.focus();
            return false;
        }

        //비밀번호 체크
        if(pwd.value.trim() === ""){
            alert("비밀번호를 입력 해주세요.");
            pwd.focus();
            return false;
        }

        if(nickName.value.trim() === ""){
            alert("닉네임을 입력 해주세요.");
            nickName.focus();
            return false;
        }
        if(email.value.trim() === ""){
            alert("이메일을 입력 해주세요.");
            email.focus();
            return false;
        }
        if(!regExpEmail.test(email.value)){
            alert("이메일형식에 맞지 않습니다.");
            email.focus();
            return false;
        }


        if(phoneNo.value.trim() === ""){
            alert("전화번호를 입력 해주세요.");
            phoneNo.focus();
            return false;
        }
        if(!regExpPhone.test(phoneNo.value)){
            alert("휴대전화 형식에 맞지 않습니다.");
            phoneNo.focus();
            return false;
        }

        if(height.value.trim() === ""){
            alert("키를 입력 해주세요.");
            height.focus();
            return false;
        }

        if(weight.value.trim() === ""){
            alert("몸무게를 입력 해주세요.");
            weight.focus();
            return false;
        }

        kind = false;
        kind.forEach(function(item){
            //console.log("item:",item)
            if(item.checked)kind = true; 
            console.log(kind)
        });

        if(!kind){
            //console.log(!kind)
                alert("가입유형을 선택하여 주십시요")
                kind[0].focus();
                return false;
            }


        return true;

    };





