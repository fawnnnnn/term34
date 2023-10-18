<%@ page language="java" contentType="textml; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>Welcome to Robot World!</title>
    <link rel="stylesheet" href="users.css">
</head>

<body>
<div class="box">
    <div class="carousel">
        <div class="container">
            <img src="welcome.jpg" style="height=300px;width=100%">
            <img src="car1.jpg" style="height=300px;width=100%">
            <img src="car2.jpg" style="height=300px;width=100%">
        </div> 
        <div class="shift">
           <div class="btn left" onclick="leftShift()">&lt;</div>
           <div class="btn right" onclick="rightShift()">&gt;</div>
        </div>
        <div class="bottom">
           <div class="indicator" onclick="setIndex(0)"></div>
           <div class="indicator" onclick="setIndex(1)"></div>
           <div class="indicator" onclick="setIndex(2)"></div>
        </div>
    </div>
    
     <div id="page1" class="page open" style="--b:rgba(255,0,0,0.2)"></div>
     <div id="page2" class="page close" style="--b:rgba(0,102,255,0.2)"></div>
     <div id="page3" class="page close" style="--b:rgba(85,0,255,0.2)"></div>
     <div id="nav">
            <ul>
                <li class="checked" style="--b:rgba(255,0,0,0.2)">
                    <ion-icon name="home-outline"></ion-icon>
                    <span>My homepage</span>
                </li>
                <li class="no-checked" style="--b:rgba(0,102,255,0.2)">
                    <ion-icon name="chatbox-ellipses-outline"></ion-icon>
                    <span>Vehicle Information</span>
                </li>
                <li class="no-checked" style="--b:rgba(85,0,255,0.2)">
                    <ion-icon name="extension-puzzle-outline"></ion-icon>
                    <span>Vehicle Routing</span>
                </li>
            </ul>
    </div>
</div>
   <%-- <%String username = (String)session.getAttribute("username"); %>
   <%String NAME = (String)session.getAttribute("1"); %>
   <%String WEIGHT = (String)session.getAttribute("2"); %>
   <%String IMAGE = (String)session.getAttribute("3"); %>
    welcome   <%= username %>
    welcome   <%= NAME %>
    welcome   <%= WEIGHT %>
    welcome   <%= IMAGE %>
    <h1>Welcome to Robot World!</h1>
    
    <h2>Robot Information</h2>
    <div class="name">
        <label>Name: </label>
        <span id="robotName"><%= NAME %></span>
    </div>
    <div class="size">
        <label>Size: </label>
        <span id="robotSize">Medium</span>
    </div>
    <div>
        <label>Weight: </label>
        <span id="robotWeight"><%= WEIGHT %> kg</span>
    </div>
    
<button id="openbtn">Add a new robot </button>
<div class="overlay" id="overlay"></div>
<div class="popup" id="popup">
<form method="post" action="./wy">
    <input type="hidden" name="action" value="addRobot">
    <label>NAME:</label>
    <input type="text" value="" name ="robotname" placeholder="please input NAME"/><br><br>
    <label>WEIGHT:</label>
    <input type="text" value="" name ="robotweight" placeholder="please input WEIGHT" /><br><br>
    <label>SIZE:</label>
    <input type="text" value="" name="robotsize"  placeholder="please input SIZE" /><br><br>
    <button id="closebtn()">CLOSE</button>
    <button type="submit">Submit</button>
</form>
</div>


<button id="Deletebtn">Delete the robot </button>
<div class="overlay" id="overlay1"></div>
<div class="popup" id="popup1">
<form method="post" action="./wy">
<input type="hidden" name="action" value="deleteRobot">
<label>ID:</label>
<input type="text" value="" name ="robotID" placeholder="please input ID you want delete"/><br><br>
<button id="closebtn()">CLOSE</button>
<button type="submit">Submit</button>
</form>
</div>

<button id="changebtn">change the robot for ID </button>
<div class="overlay" id="overlay2"></div>
<div class="popup" id="popup2">
<form method="post" action="./wy">
    <input type="hidden" name="action" value="changeRobot">
    <label>ID:</label>
    <input type="text" value="" name ="robotID1" placeholder="please input ID you want change"/><br><br>
    <label>NAME:</label>
    <input type="text" value="" name ="robotname1" placeholder="please input NAME"/><br><br>
    <label>WEIGHT:</label>
    <input type="text" value="" name ="robotweight1" placeholder="please input WEIGHT" /><br><br>
    <label>SIZE:</label>
    <input type="text" value="" name="robotsize1"  placeholder="please input SIZE" /><br><br>
    <button id="closebtn()">CLOSE</button>
    <button type="submit">Submit</button>
</form> 
</div>--%>
<script>
   let lis = document.getElementById("nav").children[0].children;
        for (let i = 0 ; i < lis.length ; i ++) {
            lis[i].setAttribute("onclick","openPage(" + i + ")")
        }

        function openPage(index) {
            for (let i = 0 ; i < lis.length ; i ++) {
                if (lis[i] === lis[index]) {
                    document.getElementById("page" + (i + 1)).classList.replace("close","open");
                    lis[i].classList.replace("no-checked","checked");
                } else {
                    document.getElementById("page" + (i + 1)).classList.replace("open","close");
                    lis[i].classList.replace("checked","no-checked");
                }
            }
        }
   
   
   
   let index = 0;
   let imageCount = document.querySelectorAll(
       ".carousel.container img"
   ).length
   
   const bottom = document.querySelect(".carousel.bottom")
   for(let i = 0; i < imageCount; i++){
        const indicator = document.createElement("div")
        indicator.classList.add("indicator")
        indi.onclick= ()=> setIndex(i)
        bottom.append(indicator);
   }
   function refresh(){
      if(index < 0){
          index=imageCount - 1
      }
      else if(index >= imageCount){
          index=0
      }
      let carousel = document.querySelector(".carousel")
      let width = parseInt(getComputedStyle(carousel).width, 10);
      width = Number(width.slice(0,-2))
      console.log(width)
      carousel.querySelector(".container").style.left=
        index*width*-1+"px"
   }
   let refreshWrapper = (func) =>{
      return function(...args){
         let result =func(...args)
         refresh()
         return result
      }
   
   }
   let leftShift() = refreshWrapper(() => {
       index--
   })
   let leftRight() = refreshWrapper(() => {
       index++
   })
   let setIndex(idx) = refreshWrapper(() => {
       index = idx
   })
   refresh()
setInterval(nextSlide, 3000);


/*界面弹出菜单*/
    const openbtn=document.getElementById('openbtn');
    const closebtn=document.getElementById('closebtn');
    const popup=document.getElementById('popup');
    const overlay=document.getElementById('overlay');
    openbtn.addEventListener('click',function(){
        popup.style.display='block';
        overlay.style.display='block';
    })
    const popup1=document.getElementById('popup1');
    const overlay1=document.getElementById('overlay1');
    const closebtn1=document.getElementById('closebtn1');
    const deletebtn=document.getElementById('Deletebtn');
    deletebtn.addEventListener('click',function(){
         popup1.style.display='block';
         overlay1.style.display='block';
    })
    const popup2=document.getElementById('popup2');
    const overlay2=document.getElementById('overlay2');
    const closebtn2=document.getElementById('closebtn2');
    const changebtn=document.getElementById('changebtn');
    changebtn.addEventListener('click',function(){
         popup2.style.display='block';
         overlay2.style.display='block';
    })
</script>
</body>
</html>