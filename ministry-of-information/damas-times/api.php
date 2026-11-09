<?php
if($_SERVER["REQUEST_METHOD"]=="POST") {
	include "get-db.php";

	$getdb=new GetDb();
	$data=json_decode(file_get_contents("php://input"));
	if($data==NULL) output_input_error();
	
	$operation=$data->operation;

	if(isset($_COOKIE["PHPSESSID"])) 
		session_id($_COOKIE["PHPSESSID"]);
	elseif(isset($data->session_id))  
		session_id($data->session_id);

	session_start();

	header('Cache-Control: no-cache, must-revalidate');
	header('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
	header('Content-type: application/json');

	if(!isset($_SESSION["user_level"]) && $operation!="create-user") output_limit_access();

	function apply_coupon($getdb, $coupon, $products) {
		$coupons=$getdb->read("coupons", array("id", "valid_to", "sold_amount", "is_sold_percent", "is_user_ultimate", "is_global_code", "max_count - purchase_count AS available_count"), array("code"=>$code));
		if(count($coupons)>0) {
			$message="كود الحسم المستخدم على %s يقوم بخصم %s على سعر القطعة الواحدة وصالح لغاية %s";
			$is_global=0;
			$stores=array();
			$subcategories=array();
			$coupon=$couons[0];

			if($coupon["is_user_ultimate"]==1 || $getdb->read_scalar("coupons_users", "count(coupon_id)", array(array("coupon_id"=>$coupon[0]["id"], "user_id"=>$_SESSION["id"])), true)["value"]==0) {
				$is_global=$getdb->read_scalar("coupons_global_view", "count(id)", array("code"=>$code), TRUE)["value"];
				if($is_global) 
					$output_message=sprintf($message, "جميع المتاجر", $coupon[0]["sold_amount"] . ($coupon[0]["is_sold_percent"]?"%":" ليرة"), $coupon[0]["valid_to"]);	
				else {
					$stores_string=$getdb->read_scalar("coupons_stores_view", "stores", array("code"=>$code), false)["value"];
					if($stores_string) { 
						$stores=explode(",", $stores_string);
						$output_message=sprintf($message, count($stores)>1?count($stores) . " متاجر":"المتجر: " . $stores[0], $coupon["sold_amount"] . ($coupon["is_sold_percent"]?"%":" ليرة"), $coupon["valid_to"]);
					}
					else {
						$subcategories_string=$getdb->read_scalar("coupons_subcategories_view", "subcategories", array("code"=>$code), true)["value"];
						if($subcategories_string) {
							$subcategories=explode(',', $subcategories_string);
							$output_message=sprintf($message, count($subcategories)>1?count($subcategories) . " تصنيفات":"التصنيف: " . $subcategories[0], $coupon["sold_amount"] . ($coupon["is_sold_percent"]?"%":" ليرة"), $coupon["valid_to"]);	
						}
						else
							$output_message="كود الحسم غير صالح";
					}
				}

				$user_used_coupon=false;
				$previous_available_count=$coupon["available_count"];
				for($i=0; $i<count($products); $i++) {
					if($is_global || in_array($products[$i]["store"], $stores) || in_array($products[$i]["subcategory"], $subcategories))
					{
						$price=floatval($products[$i]["price"]);
						$count=floatval($products[$i]["count"]);
						$sold=0;

						if($coupon["is_user_ultimate"]==1) {
							$products[$i]["remark"]="coupon: ".$data->code;
							if($count<=$coupon["available_count"]) {
								if($coupon["is_percent"])
									$sold=intval($count * ($price*$coupon["amount"]/100));
								else {
									$sold=$count * $coupon["amount"];
								}
								$coupon["available_count"]-=$count;
							}
							else {
								if($coupon["is_percent"])
									$sold=intval($coupon["available_count"] * ($price*$coupon["amount"]/100));
								else {
									$sold=$coupon["available_count"] * $coupon["amount"];
								}
								$coupon["available_count"]=0;
							}
						}
						else
							if(!$user_used_coupon) {
								$user_used_coupon=true;
								$products[$i]["remark"]="coupon: ".$data->code;
								$coupon["available_count"]--;
								if($coupon["is_percent"])
									$sold=intval($price*$coupon["amount"]/100);
								else 
									$sold=$coupon["amount"];
							}

						$products[$i]["sold"]=$sold;
					}
				}

				if($previous_available_count = $coupon["available_count"]) 
					$output_message .= ", لا يوجد مادة في السلة تنطبق عليها كود الحسم.";
			}
			else
				$output_message="الكود مستخدم مسبقاً";
		}
		else {
			$output_message="كود الحسم غير موجود";
		}

		return array("message"=>$output_message, "products"=>$products, "id"=>$coupon["id"], "used_count"=>$previous_available_count - $coupon["available_count"]);
	}	


	switch($operation) {
	case "create-user":
		$user=$data->user;
		$password=$data->password;
		$phone=$user;
		$province=$data->province??NULL;
		$address=$data->address??NULL;
		$name=$data->name??NULL;

		$role_id=$getdb->read_scalar("roles", "id", array("user_level"=>CLIENT_USER_LEVEL), true)["value"];
		if($province!=NULL) {
			$province_result=$getdb->read_id_by_name("provinces", $province);
			$province_id=$province_result["value"];
		}
		else
			$province_id=NULL;

		$user_result=$getdb->create("users", array("user"=>$user, "code"=>password_hash($password, PASSWORD_DEFAULT), "role_id"=>$role_id, "name"=>$name));
		if($user_result["status"]=="success") {
			$user_id=$user_result["value"];
			output($getdb->create("userinfo", array("user_id"=>$user_id, "phone"=>$phone, "province_id"=>$province_id, "address"=>$address)));
		}
		else
			output($user_result);
		break;
	case "read-stores-count":
		output($getdb->read_scalar("stores_enabled_view", "count(id)", true));
		break;
	case "read-stores":
		$length=$data->length??NULL;
		$offset=$data->offset??NULL;
		$search=$data->search??NULL;
		$export=$data->export??NULL;

		$user_province=$getdb->read_scalar("userinfo", "province_id", array("user_id"=>$_SESSION["id"]), true)["value"];
		
		$conditions=array("is_city_enabled"=>1, "province_id!"=>$user_province);
		
		if($search!=NULL) 
		    $conditions=array(array($conditions, array("name like"=>$search, "comment like"=>$search, "address like"=>$search)));

		output($getdb->read("stores_enabled_view", array("name", "logo"), $conditions, $length, $offset), $export);
		break;
	case "read-categories":
		output($getdb->read("categories", array("name")));
		break;
	case "read-categories-of-store":
		if(isset($data->store))
			output($getdb->read("store_categories_view", array("category"), array("store"=>$data->store)));
		else
			output_missed("store");
		break;
	case "read-subcategories-of-store":
		if(isset($data->store))	
			if(isset($data->category))
				output($getdb->read("store_subcategories_view", array("subcategory"), array(array("store"=>$data->store, "category"=>$data->category))));
			else
				output_missed("category");
		else
			output_missed("store");
		break;
	case "read-subcategories":
		if(isset($data->category)) {
			$category_result=$getdb->read_id_by_name("categories", $data->category);
			if($category_result["status"]=="success")
				output($getdb->read("subcategories", array("name"), array("category_id"=>$category_result["value"])));
			else
				output_missed($data->category);
		}
		else
			output_missed("category");
		break;
	case "read-warehouse-count":
		if(isset($data->product_id)) {
			$color=$data->color??NULL;
			$size=$data->size??NULL;

			if(!isset($data->color) || $data->color==NULL) $color="";
			if(!isset($data->size) || $data->size==NULL) $size="";

			output($getdb->read_scalar("warehouse_view", "count", array(array("product_id"=>$data->product_id, "color"=>$color, "size"=>$size)), true));
		}
		else
			output_missed("product_id");
		break;
	case "read-products":
		$conditions=array();
		$length=$data->length??NULL;
		$offset=$data->offset??NULL;
		
		$user_province=$getdb->read_scalar("userinfo", "province_id", array("user_id"=>$_SESSION["id"]), true)["value"];
		
		$conditions[]=array("is_city_enabled"=>1, "province_id!"=>$user_province);
		if($data->store!=NULL) $conditions["store"]=$data->store;
		if($data->category!=NULL) $conditions["category"]=$data->category;
		if($data->subcategory!=NULL) $conditions["subcategory"]=$data->subcategory;
		if($data->search!=NULL)	$conditions[]=array("name like"=>$data->search, "comment like"=>$data->search);

		$products=$getdb->read("products_enabled_view", array("id", "name", "type", "category", "subcategory", "store", "logo", "price", "comment", "created_at", "is_sold"), array($conditions), $length, $offset);
		for($i=0; $i<count($products); $i++)
			if($getdb->read_scalar("favorites", "added_at", array(array("user_id"=>$_SESSION["id"], "product_id"=>$products[$i]["id"])))["value"]!=NULL)
				$products[$i]["is_favorite"]=1;
			else
				$products[$i]["is_favorite"]=0;

		output($products);
		break;
	case "read-products-offer":
		$conditions=array();
		$length=$data->length??NULL;
		$offset=$data->offset??NULL;
		if($data->store!=NULL) $conditions["store"]=$data->store;
		if($data->search!=NULL)	$conditions[]=array("name like"=>$data->search, "comment like"=>$data->search);
		$products=$getdb->read("offers_view", array("id", "name", "type", "category", "subcategory", "store", "logo", "price", "comment", "created_at", "started_at", "end_at"), array($conditions), $length, $offset);
		for($i=0; $i<count($products); $i++)
			if($getdb->read_scalar("favorites", "added_at", array(array("user_id"=>$_SESSION["id"], "product_id"=>$products[$i]["id"])))["value"]!=NULL)
				$products[$i]["is_favorite"]=1;
			else
				$products[$i]["is_favorite"]=0;
		output($products);

		break;
	case "read-product-details":
		if(isset($data->product_id)) {
			$id=$data->product_id;
			$products=$getdb->read("products_view", array("id", "name", "type", "category", "subcategory", "store", "logo", "price", "comment", "created_at", "is_sold"), array("id"=>$id))[0];
			if(count($products)>0) {
				$product=array();
				$product["product"]=$products;

				if($getdb->read_scalar("favorites", "added_at", array(array("user_id"=>$_SESSION["id"], "product_id"=>$id)))["value"]!=NULL)
					$product["product"]["is_favorite"]=1;
				else
					$product["product"]["is_favorite"]=0;

				$product["images"]=$getdb->read("product_images", array("src", "CONCAT('#', color) AS color"), array("product_id"=>$id));
				$product["warehouse"]=$getdb->read("warehouse_available_view", array("color", "size", "count"), array("product_id"=>$id));
				if($products["is_offer"]=="1")
					$product["offer"]=$getdb->read("offers", array("started_at", "end_at"), array("product_id"=>$id))[0];
				else
					$product["offer"]=NULL;
				if($products["is_sold"]=="1")
					$product["sold"]=$getdb->read("solds_view", array("started_at", "end_at", "old_price", "new_price", "sold_amount_type"), array("id"=>$id))[0];
				else
					$product["sold"]=NULL;
			       output($product);	
			}
			else
				output_missed("no values, product id: $id");
		}
		else
			output_missed("product id");
		break;
	case "read-favorites":
		output($getdb->read("favorites_view", array("product_id", "name", "logo", "price", "added_at"), array("user"=>$_SESSION["user"]), $length, $offset));
		break;
	case "create-favorite":
		if(isset($data->product_id)) {
			output($getdb->create("favorites", array("user_id"=>$_SESSION["id"], "product_id"=>$data->product_id)));
		}
		else
			output_missed("product id");
		break;
	case "drop-favorite":
		if(isset($data->product_id)) 
			output($getdb->drop("favorites", array(array("user_id"=>$_SESSION["id"], "product_id"=>$data->product_id))));
		else
			output_missed("product id");
		break;
	case "read-orders":
		$orders=$getdb->read("orders_view", array("id", "ordered_at", "shipped_at", "transport_cost", "status", "shipmethod", "sum_total_price", "item_count"), array("user"=>$_SESSION["user"]));
		for($i=0; $i<count($orders); $i++)
			if($orders[$i]["shipmethod"]=="شحن")
				$orders[$i]["transport_message"]=$getdb->read_scalar("settings", "value", array(array("name"=>"transport-message", "user_id"=>NULL)))["value"];
			else
				$orders[$i]["transport_message"]="";

		output($orders);
		break;
	case "read-orders-shopping":
		output($getdb->read("orders_shopping_view", array("id", "ordered_at", "shipped_at", "transport_cost", "status", "sum_total_price", "item_count"), array("user"=>$_SESSION["user"])));
		break;
	case "create-order":
		if(isset($data->products) && count($data->products)>0) { 
			$products=$data->products;
			$empty_stock="";
			for($i=0; $i<count($products); $i++) {
				$size=$products[$i]->size??"";
				$color=$products[$i]->color??"";
				$warehouse_result=$getdb->read_scalar("warehouse_view", "id", array(array("product_id"=>$products[$i]->product_id, "size"=>$size, "color"=>$color)), true);
				if($warehouse_result["value"]!=NULL) {
					$count=$getdb->read_scalar("warehouse", "count", array("id"=>$warehouse_result["value"]), true)["value"];
					if($count>=$products[$i]->count)
						$products[$i]->warehouse_id=$warehouse_result["value"];
					else {
						$product_name=$getdb->read_scalar("products", "name", array($products[$i]->$product_id), false)["value"];
						$empty_stock.=$product_name."$".$count.";";
					}
				}
				else { 
					output(array("status"=>"failed", "msg"=>"internal error"));
					die();
				}
			}

			if($empty_stock==="") {
				$order=$getdb->create("orders", array("user_id"=>$_SESSION["id"], "status_id"=>ONHOLD_STATUS));
				$order_id=$order["value"];
				foreach($products as $product) { 
					$getdb->create("ordered_products", array("order_id"=>$order_id, "product_id"=>$product->product_id, "count"=>$product->count, "price"=>$product->price, "size"=>$product->size==""?NULL:$product->size, "color"=>trim($product->color, "#")));
					$getdb->update("warehouse", array("count"=>"`count`-".$product->count), array("id"=>$product->warehouse_id));
				}
				output($order);
			}
			else
				output(array(status=>"failed", msg=>"amount not in stock", value=>$empty_stock));
		}
		else
			output_missed("products");
		break;
	case "create-ordered-product":
		if(isset($data->product_id))
			if(isset($data->price)) {
				$count=$data->count??1;

				$size=NULL;
				if(isset($data->size) && $data->size!=="")
					$size=$data->size;

				$color=NULL;
				if(isset($data->color) && $data->color!=="")
					$color=$data->color;

				$order_id=$getdb->read_scalar("orders", "id", array(array("user_id"=>$_SESSION["id"], "status_id"=>ONSHOPPING_STATUS)), true)["value"];
				if(!$order_id) {
					$transport_cost=$getdb->read_scalar("settings", "value", array("name"=>"transport-cost"), true)["value"];
					$order_id=$getdb->create("orders", array("user_id"=>$_SESSION["id"], "status_id"=>ONSHOPPING_STATUS, "transport_cost"=>$transport_cost))["value"];
				}

				$warehouse_id=$getdb->read_scalar("warehouse_view", "id", array(array("product_id"=>$data->product_id, "size"=>$size!=NULL?$size:"", "color"=>$color!=NULL?$color:"")), true)["value"];
				if($warehouse_id) {
					$warehouse_count=$getdb->read_scalar("warehouse", "count", array("id"=>$warehouse_id), true)["value"];
					if($warehouse_count-$count>=0) {
						$duplicate_id=$getdb->read_scalar("ordered_products", "id", array(array("order_id"=>$order_id, "product_id"=>$data->product_id, "price"=>$data->price, "size"=>$size, "color"=>trim($color, '#'))), true)["value"];
						if(!$duplicate_id)
							$result=$getdb->create("ordered_products", array("order_id"=>$order_id, "product_id"=>$data->product_id, "count"=>$count, "price"=>$data->price, "size"=>$size, "color"=>trim($color, '#')));
						else
							$result=$getdb->update("ordered_products", array("count"=>"`count`+".$count), array("id"=>$duplicate_id));
						$getdb->update("warehouse", array("count"=>"`count`-".$count), array("id"=>$warehouse_id));
					}
					else
						output_error("no enough quantity in warehouse");
				}
				else
					output_error("item not exists in warehouse");

				output($result);
			}
			else
				output_missed("price");
		else
			output_missed("product_id");
		break;
	case "update-ordered-product-decrease":
		if(isset($data->product_id))
			if(isset($data->count)) {
				$size=NULL;
				if(isset($data->size) && $data->size!=="")
					$size=$data->size;

				$color=NULL;
				if(isset($data->color) && $data->color!=="")
					$color=$data->color;

				$order_id=$getdb->read_scalar("orders", "id", array(array("user_id"=>$_SESSION["id"], "status_id"=>ONSHOPPING_STATUS)), true)["value"];
				if($order_id) {
					$warehouse_id=$getdb->read_scalar("warehouse_view", "id", array(array("product_id"=>$data->product_id, "size"=>$size, "color"=>$color)), true)["value"];
					if($warehouse_id) {
						$order_product_id=$getdb->read_scalar("ordered_products", "id", array(array("order_id"=>$order_id, "product_id"=>$data->product_id, "price"=>$data->price, "size"=>$size, "color"=>trim($color, '#'))), true)["value"];
						if($order_product_id) {
							$result=$getdb->update("ordered_products", array("count"=>"`count`-".$data->count), array("id"=>$order_product_id));
							$getdb->update("warehouse", array("count"=>"`count`+".$data->count), array("id"=>$warehouse_id));
						}
					}
					else
						output_error("item not exists in warehouse");
				}
				else
					output_error("no shopping order available");

				output($result);
			}
			else
				output_missed("price");
		else
			output_missed("product_id");
		break;
	case "drop-ordered-product":
		if(isset($data->product_id)) 
			if(isset($data->count)) {
				$size=NULL;
				if(isset($data->size) && $data->size!=="")
					$size=$data->size;
				$color=NULL;
				if(isset($data->color) && $data->color!=="")
					$color=$data->color;
				$order_id=$getdb->read_scalar("orders", "id", array(array("user_id"=>$_SESSION["id"], "status_id"=>ONSHOPPING_STATUS)), true)["value"];
				if($order_id) {
					$warehouse_id=$getdb->read_scalar("warehouse_view", "id", array(array("product_id"=>$data->product_id, "size"=>$size!=NULL?$size:"", "color"=>$color!=NULL?$color:"")), true)["value"];
					if($warehouse_id) {
						$result=$getdb->drop("ordered_products", array(array("order_id"=>$order_id, "product_id"=>$data->product_id, "size"=>$size, "color"=>trim($color, '#'))));
						$getdb->update("warehouse", array("count"=>"`count`+".$data->count), array("id"=>$warehouse_id));
						output($result);
					}
					else
						output_error("item not exists in warehouse");
				}
				else
					output_error("no shopping order available");
			}
			else
				output_missed("count");
		else
			output_missed("product_id");
		break;
	case "update-ordered-product":
		if(isset($data->product_id))
			if(isset($data->count)) {
				$size=NULL;
				if(isset($data->size) && $data->size!=="")
					$size=$data->size;
				$color=NULL;
				if(isset($data->color) && $data->color!=="")
					$color=$data->color;
				$order_id=$getdb->read_scalar("orders", "id", array(array("user_id"=>$_SESSION["id"], "status_id"=>ONSHOPPING_STATUS)), true)["value"];
				if($order_id) {
					$warehouse_id=$getdb->read_scalar("warehouse_view", "id", array(array("product_id"=>$data->product_id, "size"=>$size, "color"=>$color)), true)["value"];
					if($warehouse_id) {
						$warehouse_count=$getdb->read_scalar("warehouse", "count", array("id"=>$warehouse_id), true)["value"];
						$old_count=$getdb->read_scalar("ordered_products", "count", array(array("order_id"=>$order_id, "product_id"=>$data->product_id, "size"=>$size, "color"=>trim($color, "#"))), true)["value"];
						if($warehouse_count-($data->count-$old_count)>=0) {
							$result=$getdb->update("ordered_products", array("count"=>$data->count), array(array("order_id"=>$order_id, "product_id"=>$data->product_id, "size"=>$size, "color"=>trim($color, '#'))));
							$getdb->update("warehouse", array("count"=>"`count`-".($data->count-$old_count)), array("id"=>$warehouse_id));
							output($result);
						}
						else
							output_error("no enough quantity in warehouse");
					}
					else
						output_error("item not exists in warehouse");
				}
				else
					output_error("no shopping order available");
			}
			else
				output_missed("count");
		else
			output_missed("product_id");
		break;
	case "read-ordered-products":
		if(isset($data->order_id)) 
			output($getdb->read("ordered_products_view", array("product_id", "product", "logo", "price", "count", "size", "color", "logo", "total_price"), array("order_id"=>$data->order_id)));
		else
			output_missed("order_id");
		break;
	case "read-ordered-products-shopping-count":
		$order_id=$getdb->read_scalar("orders", "id", array(array("user_id"=>$_SESSION["id"], "status_id"=>ONSHOPPING_STATUS)))["value"];
		output($getdb->read_scalar("ordered_products_view", "count(product_id)", array("order_id"=>$order_id)));
		break;
	case "read-ordered-products-shopping":
		$order_id=$getdb->read_scalar("orders", "id", array(array("user_id"=>$_SESSION["id"], "status_id"=>ONSHOPPING_STATUS)))["value"];
		if($order_id) {
			output($getdb->read("ordered_products_view", array("product_id", "product",  "price", "count", "size", "color", "logo", "total_price"), array("order_id"=>$order_id)));
		}
		else
			output_missed("no shopping order available");
		break;
	case "read-ordered-products-price":
		if(isset($data->products) && count($data->products)>0) {
			$prices=[];
			foreach($data->products as $product) {
				$price=$getdb->read_scalar("products_view", "price", array("id"=>$product->product_id), true)["value"];	
				$prices[]=array("product_id"=>$product->product_id, "price"=>$price);
			}

			output($prices);
		}
		break;
	case "read-order-shopping-transportcost":
		$order_id=$getdb->read_scalar("orders", "id", array(array("user_id"=>$_SESSION["id"], "status_id"=>ONSHOPPING_STATUS)))["value"];
		if($order_id) {
			$user_province=$getdb->read_scalar("userinfo", "province_id", array("user_id"=>$_SESSION["id"]), true)["value"];
			$store_provinces=$getdb->read("ordered_products_view", array("province_id"), array("order_id"=>$order_id));
			$shipmethod_id=constant("SHIPMETHOD_DELIVER");
			foreach($store_provinces as $sp) {
				if(!($sp["province_id"]==$user_province || ($sp["province_id"]=="2" && $user_province=="1") || ($sp["province_id"]==1 && $user_province=="2")))
					$shipmethod_id=constant("SHIPMETHOD_SHIP");
				if($sp["province_id"]=="2" && $user_province=="1") 
					$user_province="2";
			}

			$transport_cost=$getdb->read_scalar("settings", "value", array("name"=>"transport".$user_province), true)["value"];
			$transport_message="";

			if($shipmethod_id==constant("SHIPMETHOD_SHIP")) 
				$transport_message=$getdb->read_scalar("settings", "value", array(array("name"=>"transport-message", "user_id"=>NULL)))["value"];

			output(array("transport_cost"=>$transport_cost, "transport_message"=>$transport_message));
		}
		else
			output_missed("no shopping order available");
		break;
	case "update-order-confirm":
		$order_id=$getdb->read_scalar("orders", "id", array(array("user_id"=>$_SESSION["id"], "status_id"=>ONSHOPPING_STATUS)))["value"];
		if($order_id) {
			$user_province=$getdb->read_scalar("userinfo", "province_id", array("user_id"=>$_SESSION["id"]), true)["value"];
			$store_provinces=$getdb->read("ordered_products_view", array("province_id"), array("order_id"=>$order_id));
			$shipmethod_id=constant("SHIPMETHOD_DELIVER");
			foreach($store_provinces as $sp) {
				if(!($sp["province_id"]==$user_province || ($sp["province_id"]=="2" && $user_province=="1") || ($sp["province_id"]==1 && $user_province=="2")))
					$shipmethod_id=constant("SHIPMETHOD_SHIP");
				if($sp["province_id"]=="2" && $user_province=="1") 
					$user_province="2";
			}

			$transport_cost=$getdb->read_scalar("settings", "value", array("name"=>"transport".$user_province), true)["value"];
			$transport_message="";

			if($shipmethod_id==constant("SHIPMETHOD_DELIVER"))
				$transport_message=$getdb->read_scalar("settings", "value", array(array("name"=>"transport-message", "user_id"=>NULL)))["value"];
			if(isset($data->code)) {
				$products=$getdb->read("ordered_products_view", array("id", "product_id", "product",  "store", "subcategory", "price", "count", "total_price"), array("order_id"=>$order_id));
				$coupon_info=$apply_coupon($getdb, $data->code, $products);
				foreach($products as $product)
					if($product["sold"]>0)
						$getdb->update("ordered_products", array("sold"=>$product["sold"], "remark"=>"coupon: ".$data->code), array("id"=>$product["id"]));

				if($coupon_info["used_count"]>0) {
					$getdb->update("coupons", array("purchase_count"=>"`purchase_count`+" . $coupon_info["used_count"]), array("code"=>$data->code));
					$getdb->create("coupons_users", array("coupon_id"=>$coupon_info["id"], "user_id"=>$_SESSION["id"]));
				}
			}
			
			output($getdb->update("orders", array("status_id"=>ONHOLD_STATUS, "transport_cost"=>$transport_cost, "shipmethod_id"=>$shipmethod_id), array(array("user_id"=>$_SESSION["id"], "id"=>$order_id))));
		}
		else
			output_missed("no shopping order available");
		break;
	case "update-order-cancel":
		if(isset($data->order_id)) { 
			$update_result=$getdb->update("orders", array("status_id"=>CANCEL_STATUS), array(array("user_id"=>$_SESSION["id"], "id"=>$data->order_id, "status_id"=>ONHOLD_STATUS)));
			if($update_result["value"]!==NULL) {
				$products=$getdb->read("ordered_products", array("product_id", "color", "size", "count"), array("order_id"=>$data->order_id));
				foreach($products as $product) {
					$size_id=NULL;
					if($product["size"]!="" && $product["size"]!=NULL)
						$size_id=$getdb->read_id_by_name("sizes", $product["size"])["value"];
					$image_id=NULL;
					if($product["color"]!="" && $product["color"]!=NULL)
						$image_id=$getdb->read_scalar("product_images", "id", array(array("product_id"=>$product["product_id"], "color"=>$product["color"])),true)["value"];
					$getdb->update("warehouse", array("count"=>"`count`+".$product["count"]), array(array("product_id"=>$product["product_id"], "size_id"=>$size_id, "product_images_id"=>$image_id))); 
				}
			}
			output($update_result);
		}
		else
			output_missed("order id");
		break;
	case "read-ads-products":
		if(isset($data->product_id)) 
			output($getdb->read("ads_products_view", array("link", "image_url"), array("product_id"=>$data->product_id)));
		else
			output_missed("product id");
		break;
	case "read-ads-stores":
		if(isset($data->store)) 
			output($getdb->read("ads_stores_view", array("link", "image_url"), array("store"=>$data->store)));
		else
			output_missed("store");
		break;
	case "read-ads-categories":
		if(isset($data->category)) 
			output($getdb->read("ads_categories_view", array("link", "image_url"), array("category"=>$data->category)));
		else
			output_missed("product id");
		break;
	case "read-ads-pages":
		if(isset($data->page_name)) 
			output($getdb->read("ads_pages_view", array("link", "image_url"), array("page_name"=>$data->page_name)));
		else
			output_missed("page_name");
		break;
	case "read-coupon":
		if(isset($data->code)) {
			$order_id=$getdb->read_scalar("orders", "id", array(array("user_id"=>$_SESSION["id"], "status_id"=>ONSHOPPING_STATUS)))["value"];
			if($order_id) {
				$sum_total_price=0;
				$products=$getdb->read("ordered_products_view", array("product_id", "product",  "store", "subcategory", "price", "count", "total_price"), array("order_id"=>$order_id));
				$coupon_info=$apply_coupon($getdb, $data->code, $products);
				$output_products=array();
				foreach($products as $product) {
					$total_price=$product["price"]*$product["count"];
					$output_products[]=array("product_id"=>$product["product_id"], "old_price"=>$total_price, "new_price"=>$total_price-$product["sold"]);
							$sum_total_price+=$total_price;
				}

				output(array("msg"=>$coupon_info["message"], "products"=>$output_products));
			}
			else
				output(array("msg"=>$coupon_info["message"]));
		}
		else
			output_missed("code");
	       break;	
	case "read-settings-contacts":
		$phone=$getdb->read_scalar("settings", "value", array(array("name"=>"phone", "user_id"=>NULL)))["value"];
		$address=$getdb->read_scalar("settings", "value", array(array("name"=>"address", "user_id"=>NULL)))["value"];
		$facebook=$getdb->read_scalar("settings", "value", array(array("name"=>"facebook-link", "user_id"=>NULL)))["value"];
		output(array("phone"=>$phone, "address"=>$address, "facebook"=>$facebook));
		break;
	case "read-settings-privacy":
		output($getdb->read_scalar("settings", "value", array(array("name"=>"privacy", "user_id"=>NULL))));
		break;
	default:
		output(array("status"=>"failed", "msg"=>"unsupported operation"));
	}



}

function output($value) {
	echo json_encode($value, JSON_UNESCAPED_UNICODE);
}

function output_missed($value) {
	output(array("status"=>"error", "msg"=>$value . " not exists."), JSON_UNESCAPED_UNICODE);
	die();
}

function output_error($msg) {
	output(array("status"=>"error", "msg"=>$msg), JSON_UNESCAPED_UNICODE);
	die();
}

function output_input_error() {
	output(array("status"=>"error", "msg"=>"input is not a valid json"));
	die();
}

function output_limit_access() {
	$user=$_SESSION["user"]??"<unknown user>";
	output(array("status"=>"error", "msg"=>$user . " doesn't has access permissions."));
	die();
}
?>


