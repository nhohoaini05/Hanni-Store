var app = angular.module("shopping-app",[]);
app.controller("shopping-ctrl", function($scope, $http){
	
	$scope.cart = {
		items: [],
		add(id){//kiểm tra sp có ch
			var item = this.items.find(item => item.id == id);
			if(item){
				item.qty++;//tăng slsp
				this.saveToLocalStorage();
			}else{
				$http.get(`/rest/products/${id}`).then(resp => {//gửi yc lấy tt từ sv
					resp.data.qty = 1;
					this.items.push(resp.data);
					this.saveToLocalStorage();
				})
			}
		},
		minus(id){// ktr slsp
			var index = this.items.findIndex(item => item.id == id);//x
			if(this.items[index].qty == 1){
				this.remove(id);//gọi để xóa sp
			}else{
				this.items[index].qty -= 1;//giảm sl và lưu
				this.saveToLocalStorage();
			}
		},
		remove(id){//xóa sp,tìm sp trong gh
			var index = this.items.findIndex(item => item.id == id);//xóa sp  khỏi mảng
			this.items.splice(index, 1);
			this.saveToLocalStorage();
		},
		get count(){
			return this.items
				.map(item => item.qty)
				.reduce((total, qty) => total += qty,0);
		},
		priceItem(id) {
		    var index = this.items.findIndex(item => item.id === id);
		    if (index !== -1) {
		        const item = this.items[index]; // lấy phần tử tương ứng với index
		        return item.qty * item.price * (1 - item.discount / 100);
		    } else {
		        // Xử lý trường hợp không tìm thấy id
		        return 0; // hoặc bất kỳ giá trị mặc định nào phù hợp
		    }
		},

		discountItem(id){
			var index = this.items.findIndex(item => item.id == id);
			return this.items[index].qty * this.items[index].discount ;
		},
		get amount() {
		    return this.items
		        .map(item => item.qty * (item.price * (1 - item.discount / 100)))
		        .reduce((total, price) => total + price, 0);
		},

		saveToLocalStorage(){//lưu mảng ,dưới dạng
			var json = JSON.stringify(angular.copy(this.items));
			localStorage.setItem("cart",json);
		},
		clear(){//xóa toàn bộ sp
			this.items = [];
			this.saveToLocalStorage();
		},
		loadFromLocalStorage(){//tải từ giỏ hàng khi khởi động ud
			var json = localStorage.getItem("cart");
			this.items = json ? JSON.parse(json):[];
		}
	}
	$scope.convertImage = function(json){
		var lstImage = JSON.parse(json);
		return lstImage[0];
	}
	$scope.cart.loadFromLocalStorage();
	
	$scope.order = {
		createDate: new Date(),
		address: "",
		account: {username: $("#username").text()},
		get orderDetails(){
			return $scope.cart.items.map(item => {
				return {
					product: {id: item.id},
					price: item.price,
					quantity: item.qty
				}
			});
		}, 
		purchase(){
			var order = angular.copy(this);
			console.log(order);
			$http.post('/rest/order', order).then(resp => {
				alert("Đặt hàng thành công");
				$scope.cart.clear();
				location.href = "/order/detail/"+resp.data.id;
			}).catch(error => {
				alert("Đặt hàng thất bại");
				console.log(error);
			});
		}
	}
});
app.controller("register",function($scope, Shttp){
	
});