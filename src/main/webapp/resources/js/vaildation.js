
    //var mainForm = document.querySelector("body > section > div > div:nth-child(2) > div > div > form");
    //var mainId = mainForm.id;
    //var mainPwd = mainForm.pwd;
    var form = document.forms[0];
    var u_pwd = form.u_pwd;
    var u_gender = form.u_gender;
    var u_birth = form.u_birth;
    var u_nickname = form.u_nickname;
    var u_email = form.u_email;
    var u_phoneno = form.u_phoneno;
    var u_height = form.u_height;
    var u_weight = form.u_weight;
    var u_kind = form.u_kind;
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
        var regExpPwd = /(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,}$/
        var regExpEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
        var regExpPhone = /^\d{3}-\d{3,4}-\d{4}$/;
        var regExpHeight = /[0-9]{3}$/;
        var regExpWeight = /[0-9]{2,3}$/;
		
		
		//console.log("u_kind:"+u_kind);
		//console.log("u_gender:"+u_gender);
		
		
        //성별 체크
        isGender = false;
        u_gender.forEach(function(item){
            //console.log("item:",item)
            if(item.checked)isGender = true; 
            //console.log(isGender)
        });

        if(!isGender){
        	//console.log(!isGender)
            alert("성별을 선택하여 주십시요")
            u_gender[0].focus();
            return false;
        }

        if(u_birth.value.trim() === ""){
            alert("출생년도를 선택하여 주십시요");
            u_birth.focus();
            return false;
        }
        
        if(u_email.value.trim() === ""){
            alert("이메일을 입력 해주세요.");
            u_email.focus();
            return false;
        }
        
        if(!regExpEmail.test(u_email.value)){
            alert("이메일형식에 맞지 않습니다.");
            u_email.focus();
            return false;
        }

        //비밀번호 체크
        if(u_pwd.value.trim() === ""){
            alert("비밀번호를 입력 해주세요.");
            u_pwd.focus();
            return false;
        }
         if(!regExpPwd.test(u_pwd.value)){
            alert("비밀번호는 영문자와 숫자 그리고 특수문자가 포함되어야 하며 8자 이상 이어야합니다.");
            u_pwd.focus();
            return false;
        }

        if(u_nickname.value.trim() === ""){
            alert("닉네임을 입력 해주세요.");
            u_nickname.focus();
            return false;
        }
        
        


        if(u_phoneno.value.trim() === ""){
            alert("전화번호를 입력 해주세요.");
            u_phoneno.focus();
            return false;
        }
        if(!regExpPhone.test(u_phoneno.value)){
            alert("전화번호 형식에 맞지 않습니다.");
            u_phoneno.focus();
            return false;
        }

        if(u_height.value.trim() === ""){
            alert("신장을 정보를 입력 해주세요.");
            u_height.focus();
            return false;
        }
        
        if(!regExpHeight.test(u_height.value)){
        	alert("신장정보를 3자리 입력 부탁드립니다.");
        	u_height.focus();
        	return false;
        }

        if(u_weight.value.trim() === ""){
            alert("몸무게를 입력 해주세요.");
            u_weight.focus();
            return false;
        }
        if(!regExpWeight.test(u_weight.value)){
        	alert("몸무게는 최소 2자리에서 최대 3자리까지 입력가능 합니다.");
        	u_weight.focus();
        	return false;
        }

        iskind = false;
        u_kind.forEach(function(item){
            //console.log("item:",item)
            if(item.checked)iskind = true; 
            
        });

        if(!iskind){
                alert("가입유형을 선택하여 주십시요");
                u_kind[0].focus();
                return false;
            }


        return true;

    };





