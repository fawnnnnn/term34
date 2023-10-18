<!-- !Templates.jsp20xhtmlxml.content! -->
<%@ page import="java.util.*" %>
<%@ page import="testWeb.vo.RobotInfo" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>Welcome to Robot World!</title>
    <link rel="stylesheet" href="users.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" 
          integrity="sha512-SfTiTlX6kk+qitfevl/7LibUOeJWlt9rbyDn92a1DqWOw9vWG2MFoays0sgObmWazO5BQPiFucnnEAjpAB+/Sw==" 
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <style>
.my{
weight:800px;

}

img{
weight:80px;
height:80px
}

.slk{
 
}
</style>

</head>
<body>
 <div class="container">
 <div class="wrapper">
    <nav>
        <input type="radio" name="tab" id="home" checked>
        <input type="radio" name="tab" id="automobile">
        <input type="radio" name="tab" id="rout">
        <a href="#" onclick="showContent('page1')" class="home">
        <label for="home">
            <i class="fa fa-home" aria-hidden="true"></i>
           home
        </label>
        </a>
        <a href="#" onclick="showContent('page2')" class="automobile"> 
        <label for="automobile">  
                
            <i class="fa fa-automobile" aria-hidden="true"></i>
               information 
        </label>
        </a>
        <a href="#" onclick="showContent('page3')"  class="rout">  
        <label for="rout" >   
            <i class="fa fa-arrows" aria-hidden="true"></i>
           rout
        </label>
        </a>
        
        <div class="tab">
        </div>
    </nav>
   </div>
 <div class="slide-box">
      <div class="banner-box"></div>
      <button class="slide-left-btn material-icons">&lt;</button>
      <button class="slide-right-btn material-icons">&gt;</button>
      <div class="pagination-box"></div>
</div>

 
 <div class="content" id="page1">
    <h2></h2>
       <p>robot world</p>
        <div class="box">
        <div class="side front"></div>
        <div class="side back"></div>
        <div class="side left"></div>
        <div class="side right"></div>
        <div class="side top">
            <div class="tl"></div>
            <div class="tr"></div>
        </div>
        <div class="side bottom"></div>
        <div class="text"> welcome to robot world!! </div>
        </div>
 </div>

 <div class="content" id="page2">
    <h2></h2>
   <%String username = (String) session.getAttribute("username"); %>
        <%int userId = (int) session.getAttribute("userId"); %>

        <%String NAME = (String) session.getAttribute("name"); %>
        <%String WEIGHT = (String) session.getAttribute("weight"); %>
        <%String IMAGE = (String) session.getAttribute("image"); %>
        <%String SIZE = (String) session.getAttribute("size"); %>
        <%

            List<RobotInfo> list = (List<RobotInfo>) session.getAttribute("r");
            List<RobotInfo> list1 = (List<RobotInfo>) request.getAttribute("list");
        %>
        <h2>User Information</h2>

        <table class="custom-table my">
            <tr>
                <td>User Name</td>
            </tr>
            <tr>
                <td><%= username %>
                </td>
            </tr>
            <tr>
                <td>userId</td>
            </tr>
            <tr>
                <td><%= userId %>
                </td>
            </tr>
        </table>

        <h2>Robot Information</h2>
       <span> <button id="openbtn" class="custom-button" onclick="showContent1()">Add</button></span>
        <table class="custom-table my">
            <tr>
                <th>ID</th>
                <th>Robot Name</th>
                <th>Weight</th>
                <th>Size</th>
                <th>Image</th>
                <th >Delete</th>
                <th >Change</th>
            </tr>
            <%
                for (RobotInfo e : list) {
            %>
            <tr>
                <td><%= e.getID() %></td>
                <td><%= e.getNAME() %></td>
                <td><%= e.getweight() %></td>
                <td><%= e.getsize() %></td>
                <td><img alt="" src="<%=request.getContextPath() %>/users/image/<%=e.getiamge() %>"></td>
                <td>
                    <form method="post" action="/testWeb/user">
                        <input type="hidden" name="action" value="deleteRobot">
                        <input type="hidden" name="robotID" value="<%= e.getID() %>">
                        <button type="submit" class="custom-button">Delete</button>
                    </form>
                </td>
               <td>  <button id="changebtn" class="custom-button" onclick="showEditForm('<%= e.getID() %>', '<%= e.getNAME() %>', '<%= e.getweight() %>', '<%= e.getsize() %>')">Change</button></td>
            </tr>
            <%
                }
            %>
        </table>


    </div>


    <div class="button-container">
        <div class="overlay" id="overlay"></div>
        <div class="popup" id="popup">
            <form method="post" action="/testWeb/user" class="myform">
                <input type="hidden" name="action" value="addRobot">
                <label>NAME:</label>
                <input type="text" value="" name="robotname" placeholder="please input NAME"/><br><br>
                <label>WEIGHT:</label>
                <input type="text" value="" name="robotweight" placeholder="please input WEIGHT"/><br><br>
                <label>SIZE:</label>
                <input type="text" value="" name="robotsize" placeholder="please input SIZE"/><br><br>
                <div class=btn id="closebtn">CLOSE</div>
                <button class=btn type="submit">Submit</button>
            </form>
        </div>

        <div class="overlay" id="overlay2"></div>
        <div class="popup" id="popup2">
            <form method="post" action="/testWeb/user">
                <input type="hidden" name="action" value="changeRobot">
                <label>ID:</label>
                <input type="text" value="" id="robotID1"  name="robotID1" placeholder="please input ID you want to change"/><br><br>
                <label>NAME:</label>
                <input type="text" value="" id="robotname1" name="robotname1" placeholder="please input NAME"/><br><br>
                <label>WEIGHT:</label>
                <input type="text" value="" id="robotweight1"  name="robotweight1"placeholder="please input WEIGHT"/><br><br>
                <label>SIZE:</label>
                <input type="text" value="" id="robotsize1"  name="robotsize1" placeholder="please input SIZE"/><br><br>
                <div class=btn type="button" id="closebtn2">CLOSE</div>
                <button class=btn type="submit">Submit</button>
            </form>
        </div>
    </div>

 <div class="content" id="page3">
    <div id="buttonContainer" style="position: absolute;margin-top:30px;margin-left:50px;z-index=2;width=50px;height=30px">
    <button id="movecar" class="custom-button">run</button>
    <button id="start" class="custom-button">start</button>
    <button id="stop" class="custom-button">stop</button>
    </div>
    <input type="button" id="but" style="position: absolute; margin-top: 380px; margin-left: 100px; z-index: 2; font-size: 36px;" value="Time:0" />
    <canvas id="myCanvas" width="1000" height="500" style="border:10px solid red;color:white"></canvas>
    
	</div> 
</div>
 <script src="../users/users.js"></script>
 <script> 
   function showContent(contentId) {
            // 隐藏所有内容
            var contents = document.querySelectorAll('.content');
            for (var i = 0; i < contents.length; i++) {
                contents[i].style.display = 'none';
            }

            // 显示选定的内容
            var selectedContent = document.getElementById(contentId);
            if (selectedContent) {
                selectedContent.style.display = 'block';
            }
        }
</script>
<script>
var buttonContainer = document.getElementById("buttonContainer");
buttonContainer.addEventListener('click', function () {
    // 处理按钮点击事件的代码
});


var movecar =document.getElementById("movecar");
movecar.addEventListener('click',function (){
    var c = document.getElementById("myCanvas");
    var context = c.getContext("2d");


    // 直接定义路径数据,环形
    /* var carPath = [
    { x: 150, y: 170, value: "" },
    { x: 300, y: 170, value: "" },
    { x: 300, y: 50, value: "" },
    { x: 330, y: 55, value: "" },
    { x: 340, y: 50, value: "" },
    { x: 400, y: 60, value: "" },
    { x: 465, y: 50, value: "" },
    { x: 490, y: 50, value: "" },
    { x: 500, y: 45, value: "" },
    { x: 510, y: 50, value: "" },
    { x: 520, y: 46, value: "" },
    { x: 600, y: 50, value: "" },
    { x: 613, y: 52, value: "" },
    { x: 640, y: 50, value: "" },
    { x: 648, y: 53, value: "" },
    { x: 700, y: 50, value: "" },
    { x: 710, y:100 , value: "" },
    { x: 712, y: 107, value: "" },
    { x: 710, y: 150, value: "" },
    { x: 714, y: 158, value: "" },
    { x: 706, y: 190, value: "" },
    { x: 703, y: 240, value: "" },
    { x: 700, y: 250, value: "" },
    { x: 700, y: 340, value: "" },
    { x: 705, y: 345, value: "" },
    { x: 700, y: 370, value: "" },
    { x: 702, y: 380, value: "" },
    { x: 700, y: 400, value: "" },
    { x: 700, y: 410, value: "" },
    { x: 700, y: 440, value: "" },
    { x: 705, y: 445, value: "" },
    { x: 700, y: 470, value: "" },
    { x: 702, y: 474, value: "" },
    { x: 693, y: 470, value: "" },
    { x: 640, y: 466, value: "" },
    { x: 585, y: 470, value: "" },
    { x: 555, y: 474, value: "" },
    { x: 540, y: 470, value: "" },
    { x: 550, y: 473, value: "" },
    { x: 535, y: 467, value: "" },
    { x: 520, y: 476, value: "" },
    { x: 480, y: 477, value: "" },
    { x: 460, y: 471, value: "" },
    { x: 320, y: 464, value: "" },
    { x: 300, y: 467, value: "" },
    { x: 200, y: 477, value: "" },
    { x: 180, y: 473, value: "" },
    { x: 160, y: 475, value: "" },
    { x: 155, y: 470, value: "" },
    { x: 150, y: 468, value: "image/good.jpg" },
    { x: 155, y: 470, value: "image/good.jpg" },
    { x: 150, y: 473, value: "image/good.jpg" },
    { x: 155, y: 467, value: "image/good.jpg" },
    { x: 200, y: 472, value: "image/good.jpg" },
    { x: 280, y: 477, value: "image/good.jpg" },
    { x: 290, y: 471, value: "image/good.jpg" },
    { x: 320, y: 464, value: "image/good.jpg" },
    { x: 330, y: 467, value: "" },
    { x: 350, y: 477, value: "" },
    { x: 380, y: 473, value: "" },
    { x: 460, y: 475, value: "" },
    { x: 555, y: 470, value: "" },
    { x: 560, y: 470, value: "" },
    { x: 582, y: 474, value: "" },
    { x: 600, y: 471, value: "" },
    { x: 650, y: 466, value: "" },
    { x: 700, y: 470, value: "" },
    { x: 705, y: 475, value: "" },
    { x: 700, y: 470, value: "" },
    { x: 702, y: 464, value: "" },
    { x: 693, y: 460, value: "" },
    { x: 700, y: 456, value: "" },
    { x: 695, y: 410, value: "" },
    { x: 703, y: 370, value: "" },
    { x: 700, y: 330, value: "" },
    { x: 702, y: 264, value: "" },
    { x: 693, y: 260, value: "" },
    { x: 700, y: 216, value: "" },
    { x: 695, y: 210, value: "" },
    { x: 703, y: 170, value: "" },
    { x: 700, y: 150, value: "" },
    { x: 702, y: 124, value: "" },
    { x: 693, y: 80, value: "" },
    { x: 700, y: 56, value: "" },
    { x: 695, y: 50, value: "" },
    { x: 680, y: 70, value: "" },
    { x: 602, y: 42, value: "" },
    { x: 593, y: 48, value: "" },
    { x: 500, y: 56, value: "" },
    { x: 485, y: 50, value: "" },
    { x: 380, y: 50, value: "" },
    { x: 280, y: 45, value: "" },
    { x: 260, y: 42, value: "" },
    { x: 243, y: 48, value: "" },
    { x: 200, y: 54, value: "" },
    { x: 185, y: 50, value: "" },
    { x: 180, y: 50, value: "" },
    { x: 160, y: 55, value: "" },
    { x: 158, y: 70, value: "" },
    { x: 152, y: 90, value: "" },
    { x: 149, y: 158, value: "" },
    { x: 140, y: 165, value: "" }
];  */
    
    
    
    
    
 // 直接定义路径数据,s形
    var carPath = [
    { x: 150, y: 50, value: "" },
    { x: 280, y: 50, value: "" },
    { x: 300, y: 45, value: "" },
    { x: 300, y: 55, value: "" },
    { x: 304, y: 70, value: "" },
    { x: 300, y: 100, value: "" },
    { x: 310, y: 170, value: "" },
    { x: 310, y: 180, value: "" },
    { x: 300, y: 210, value: "" },
    { x: 300, y: 250, value: "" },
    { x: 306, y: 290, value: "" },
    { x: 300, y: 340, value: "" },
    { x: 300, y: 400, value: "" },
    { x: 344, y: 450, value: "" },
    { x: 348, y: 470, value: "" },
    { x: 340, y: 450, value: "" },
    { x: 350, y: 460 , value: "" },
    { x: 400, y: 467, value: "" },
    { x: 420, y: 464, value: "" },
    { x: 464, y: 468, value: "" },
    { x: 480, y: 470, value: "" },
    { x: 500, y: 470, value: "" },
    { x: 495, y: 410, value: "" },
    { x: 503, y: 370, value: "" },
    { x: 500, y: 330, value: "" },
    { x: 502, y: 264, value: "" },
    { x: 493, y: 260, value: "" },
    { x: 500, y: 216, value: "" },
    { x: 495, y: 210, value: "" },
    { x: 503, y: 170, value: "" },
    { x: 500, y: 150, value: "" },
    { x: 502, y: 124, value: "" },
    { x: 493, y: 80, value: "" },
    { x: 500, y: 56, value: "" },
    { x: 495, y: 50, value: "" },
    { x: 480, y: 70, value: "" },
    { x: 502, y: 42, value: "" },
    { x: 493, y: 48, value: "" },
    { x: 500, y: 56, value: "" },
    { x: 495, y: 50, value: "" },
    { x: 520, y: 50, value: "" },
    { x: 580, y: 45, value: "" },
    { x: 660, y: 48, value: "" },
    { x: 683, y: 48, value: "" },
    { x: 700, y: 54, value: "" },
    { x: 705, y: 50, value: "" },
    { x: 700, y: 45, value: "" },
    { x: 700, y: 55, value: "" },
    { x: 704, y: 70, value: "" },
    { x: 700, y: 100, value: "" },
    { x: 710, y: 170, value: "" },
    { x: 710, y: 180, value: "" },
    { x: 700, y: 210, value: "" },
    { x: 700, y: 250, value: "" },
    { x: 706, y: 290, value: "" },
    { x: 700, y: 340, value: "" },
    { x: 700, y: 400, value: "" },
    { x: 704, y: 450, value: "" },
    { x: 698, y: 470, value: "" },
    { x: 690, y: 450, value: "" },
    { x: 705, y: 460 , value: "" },
    { x: 700, y: 467, value: "" },
    { x: 690, y: 464, value: "" },
    { x: 694, y: 468, value: "" },
    { x: 680, y: 470, value: "" },
    { x: 700, y: 470, value: "image/good.jpg" },
    { x: 700, y: 468, value: "image/good.jpg" },
    { x: 707, y: 440, value: "image/good.jpg" },
    { x: 702, y: 433, value: "image/good.jpg" },
    { x: 695, y: 407, value: "image/good.jpg" },
    { x: 700, y: 372, value: "image/good.jpg" },
    { x: 689, y: 357, value: "image/good.jpg" },
    { x: 690, y: 311, value: "image/good.jpg" },
    { x: 693, y: 264, value: "image/good.jpg" },
    { x: 693, y: 260, value: "" },
    { x: 700, y: 216, value: "" },
    { x: 695, y: 210, value: "" },
    { x: 703, y: 170, value: "" },
    { x: 700, y: 150, value: "" },
    { x: 702, y: 124, value: "" },
    { x: 693, y: 80, value: "" },
    { x: 700, y: 56, value: "" },
    { x: 695, y: 50, value: "" },
    { x: 693, y: 48, value: "" },
    { x: 640, y: 56, value: "" },
    { x: 595, y: 50, value: "" },
    { x: 520, y: 50, value: "" },
    { x: 493, y: 45, value: "" },
    { x: 500, y: 55, value: "" },
    { x: 504, y: 70, value: "" },
    { x: 500, y: 100, value: "" },
    { x: 510, y: 170, value: "" },
    { x: 510, y: 180, value: "" },
    { x: 500, y: 210, value: "" },
    { x: 500, y: 250, value: "" },
    { x: 506, y: 290, value: "" },
    { x: 500, y: 340, value: "" },
    { x: 500, y: 400, value: "" },
    { x: 500, y: 467, value: "" },
    { x: 490, y: 464, value: "" },
    { x: 494, y: 468, value: "" },
    { x: 500, y: 470, value: "" },
    { x: 460, y: 467, value: "" },
    { x: 440, y: 464, value: "" },
    { x: 404, y: 468, value: "" },
    { x: 350, y: 470, value: "" },
    { x: 304, y: 468, value: "" },
    { x: 300, y: 470, value: "" },
    { x: 300, y: 440, value: "" },
    { x: 300, y: 400, value: "" },
    { x: 300, y: 367, value: "" },
    { x: 290, y: 364, value: "" },
    { x: 294, y: 338, value: "" },
    { x: 300, y: 280, value: "" },
    { x: 290, y: 247, value: "" },
    { x: 304, y: 214, value: "" },
    { x: 302, y: 168, value: "" },
    { x: 300, y: 120, value: "" },
    { x: 304, y: 88, value: "" },
    { x: 300, y: 70, value: "" },
    { x: 286, y: 50, value: "" },
    { x: 250, y: 50, value: "" },
    { x: 210, y: 50, value: "" },
    { x: 180, y: 45, value: "" },
    { x: 170, y: 55, value: "" },
    { x: 150, y: 55, value: "" }
]; 

    var carIndex = 0; // 当前路径点索引
    var carSpeed = 2; // 移动速度
    var carX, carY; // 当前小车的位置

    function drawCar(x, y, imageUrl) {
        // 清空画布
        context.clearRect(0, 0, c.width, c.height);

        // 绘制车身
        context.fillStyle = "pink";
        context.fillRect(x, y - 20, 100, 20);

        // 绘制车轮
        context.fillStyle = "black";
        context.fillRect(x + 10, y - 10, 20, 10);
        context.fillRect(x + 70, y - 10, 20, 10);

        // 如果imageUrl不为空，则绘制图片
        if (imageUrl) {
            var img = new Image();
            img.src = imageUrl;
            img.onload = function () {
                context.drawImage(img, x + 50, y, 100, 50);
                context.fillText("there have goods",x + 50,y-10)
            };
        }
    }

    function moveCar() {
        if (carIndex < carPath.length - 1) {
            var targetX = carPath[carIndex + 1].x;
            var targetY = carPath[carIndex + 1].y;
            var imageUrl = carPath[carIndex + 1].value;

            // 计算小车移动方向
            var deltaX = targetX - carX;
            var deltaY = targetY - carY;
            var distance = Math.sqrt(deltaX * deltaX + deltaY * deltaY);

            if (distance > carSpeed) {
                // 计算小车新的位置
                var ratio = carSpeed / distance;
                carX += ratio * deltaX;
                carY += ratio * deltaY;
            } else {
                // 小车到达目标点，更新索引
                carIndex++;
            }

            drawCar(carX, carY, imageUrl);
        } else {
            // 小车到达路径的最后一个点，停止移动
            clearInterval(carInterval);
        }
    }

    // 初始位置
    carX = carPath[0].x;
    carY = carPath[0].y;

    // 启动小车移动
    var carInterval = setInterval(moveCar, 16);
})

</script>
<script>

var start =document.getElementById("start");
start.addEventListener('click', function () {
	var timecount =document.getElementById("but");
	var time = 1;
	var timer=setInterval(function(){
				timecount.value="time:"+time+"";
				time++;
	        },1000)
	        
	var stop =document.getElementById("stop");
	stop.addEventListener('click', function () {
	    clearInterval(timer)
	});
})

</script>
</body>
</html>



