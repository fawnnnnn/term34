class Slide {
constructor() {
this.slideBoxDOM = document.querySelector('.slide-box');
this.slideLeftBtnDOM = document.querySelector(".slide-left-btn");
this.slideRightBtnDOM = document.querySelector(".slide-right-btn");
this.bannerBoxDOM = document.querySelector(".banner-box");
this.paginationBoxDOM = document.querySelector(".pagination-box");
// 计数器
this._currentIndex = 0;
this._bannerItemDOMs = null;
this._bannerItemDOMsLen = 0;
// 图片数据
this.banners = [
{
imageName: 'welcome.jpg',
},
{
imageName: 'car1.jpg',
},
{
imageName: 'car2.jpg',
},
{
imageName: 'car3.jpg',
},
];
this.imageUrl = 'image/';
this.timer = null;
}
get currentIndex() {
return this._currentIndex;
}
// 监听器，根据变化来改变当前的横幅
set currentIndex(num) {
Object.values(this.bannerItemDOMs).forEach((item, i) => {
item.classList.remove('left', 'middle', 'right');
item.onclick = null;
if (this.paginationBoxDOM && this.paginationBoxDOM.children[i]) {
this.paginationBoxDOM.children[i].classList.remove('chose');
} else {
console.error(`Invalid or missing child element at index ${i}`);
}
});
if (num < 0) {
this._currentIndex = this.bannerItemDOMsLen - 1;
} else if (num >= this.bannerItemDOMsLen) {
this._currentIndex = 0;
} else {
this._currentIndex = num;
}
this.paginationBoxDOM.children[this._currentIndex].classList.add('chose');
if (this._currentIndex === 0) {
this.showCurrentBanner(this.bannerItemDOMsLen - 1, this._currentIndex, this._currentIndex + 1)
} else if (this._currentIndex === this._bannerItemDOMsLen - 1) {
this.showCurrentBanner(this._currentIndex - 1, this._currentIndex, 0)
} else {
this.showCurrentBanner(this._currentIndex - 1, this._currentIndex, this._currentIndex + 1)
}
}
showCurrentBanner(leftIndex, mindleIndex, rightIndex) {
this.bannerItemDOMs[leftIndex].classList.add('left');
this.bannerItemDOMs[mindleIndex].classList.add('middle');
this.bannerItemDOMs[rightIndex].classList.add('right');
this.bannerItemDOMs[leftIndex].onclick = () => {
this._currentIndex--;
}
this.bannerItemDOMs[rightIndex].onclick = () => {
this._currentIndex++;
}
}
getBannerItemDOMs() {
return this.slideBoxDOM.querySelectorAll('.banner-item');
}
getBannerHTML(imageName) {
return `<div class="banner-item"><img src="${this.imageUrl + imageName}"></div>`;
}
drawDOM(banners) {
this.bannerBoxDOM.innerHTML = ''; // 清空 bannerBoxDOM，避免重复添加
banners.forEach((item, i) => {
const bannerItem = document.createElement('div');
bannerItem.classList.add('banner-item'); // 添加 banner-item 类
const img = document.createElement('img');
img.src = `${this.imageUrl + item.imageName}`;
bannerItem.appendChild(img);
this.bannerBoxDOM.appendChild(bannerItem); // 将 bannerItem 添加到 bannerBoxDOM 中
});
// 添加这个代码来创建子元素
const paginationBox = document.querySelector('.pagination-box');
paginationBox.innerHTML = ''; // 清空 paginationBox，避免重复添加
for (let i = 0; i < banners.length; i++) {
const paginationItem = document.createElement('div');
paginationItem.classList.add('pagination-item'); // 添加 pagination-item 类
paginationBox.appendChild(paginationItem); // 将 paginationItem 添加到 paginationBox 中
}
this.bannerItemDOMs = this.getBannerItemDOMs(); // 更新 bannerItemDOMs
this.bannerItemDOMsLen = this.bannerItemDOMs.length;
this.currentIndex = 0;
// 其他逻辑...
}
// 启动定时器
openTimer() {
this.timer = setInterval(() => {
this.currentIndex++;
}, 3000);
}
stopTimer() {
clearInterval(this.timer);
}
init() {
// 初始化
this.drawDOM(this.banners);
this._bannerItemDOMs = this.getBannerItemDOMs();
this._bannerItemDOMsLen = this._bannerItemDOMs.length;
this._currentIndex = 0;
// 监听
this.slideLeftBtnDOM.addEventListener('click', () => {
this.currentIndex--;
});
this.slideRightBtnDOM.addEventListener('click', () => {
this.currentIndex++;
});
// 自动轮播
this.slideBoxDOM.addEventListener('mouseover', () => {
this.stopTimer();
});
this.slideBoxDOM.addEventListener('mouseout', () => {
this.openTimer();
});
// 启动自动轮播
this.openTimer();
}
}
new Slide().init();
const openbtn = document.getElementById('openbtn');

        const changebtn = document.getElementById('changebtn');
        const overlay = document.getElementById('overlay');
        const overlay1 = document.getElementById('overlay1');
        const overlay2 = document.getElementById('overlay2');
        const popup = document.getElementById('popup');
        const popup1 = document.getElementById('popup1');
        const popup2 = document.getElementById('popup2');

// 打开弹窗事件
        openbtn.addEventListener('click', function () {
            overlay.style.display = 'block';
            popup.style.display = 'block';
        });


        changebtn.addEventListener('click', function () {
            overlay2.style.display = 'block';
            popup2.style.display = 'block';
        });

        // 关闭弹窗事件
        function closePopup() {
			event.preventDefault();
            overlay.style.display = 'none';
            popup.style.display = 'none';
        }



        function closePopup2() {
			event.preventDefault();
            overlay2.style.display = 'none';
            popup2.style.display = 'none';
        }



// 关闭按钮事件
document.getElementById('closebtn').addEventListener('click', closePopup);
document.getElementById('closebtn2').addEventListener('click', closePopup2);

function showEditForm(id, name, weight, size) {

	// 将机器人信息回显到表单中
	document.getElementById('robotID1').value = id;
	document.getElementById('robotname1').value = name;
	document.getElementById('robotweight1').value = weight;
	document.getElementById('robotsize1').value = size;

	// 显示修改表单的弹出窗口
	document.getElementById('overlay2').style.display = 'block';
	document.getElementById('popup2').style.display = 'block';
}