<main class="w-100 d-f f-d al-c">
               
               <h1 class="title_product_new">Sản phẩm </h1>
               <div class="product-page-banner">
                   <span class="product-page-banner_title">Trang chủ - Giỏ hàng</span>
              </div>
              <?php
        if (isset($_SESSION['user'])) {
            $info_user =$_SESSION['user']['user'];
            $info_email =$_SESSION['user']['email'];
            $info_address =$_SESSION['user']['address'];
            $info_tele=$_SESSION['user']['tel'];
            
        }
        else{
            $info_user = "";
            $info_email = "";
            $info_address = "";
            $info_tele= 0;
        }

        ?>
              <!-- ----------------------------------- Form hiển thị giỏ hàng ----v--------------------- -->
              <form method="POST" action="index.php?act=confirm_bill&header=headerSecond" class="w-100 d-f jf-b form-pay" style="padding-left: 15px;" >
             
                <section class="contain-form-submit-cart w-100">

                <div  class="form-submit-cart w-100" >         
               <table class="table-cart w-100">
      
                <thead>
                  <tr>
                    <th>Tên trà sữa</th>
                    <th>Thêm topping</th>
                    <th>Lựa chọn khác</th>
                    <th>Giá</th>
                    <th>Số lượng</th>
                    <th>Tổng</th>
      
                  </tr>
                </thead>
                <tbody>

                <?php

                $totalSum = 0;
                for ($i = 0; $i < count($cart_result); $i++) {
                    $id =  $cart_result[$i]['id'] ;
                    $idsp =  $cart_result[$i]['idsp'] ;
                    $image =   $cart_result[$i]['image'] ;
                    $product =   $cart_result[$i]['tensp']  ;
                    $price =   $cart_result[$i]['gia']  ;
                    $sugar =   $cart_result[$i]['sugar'] ;
                    $size =   $cart_result[$i]['size'] ;
                    $ice =   $cart_result[$i]['ice']  ;
                    $topping =   $cart_result[$i]['topping']  ;
                    $quantity =   $cart_result[$i]['soluong'] ;
                    $total =   $cart_result[$i]['thanhtien'] ;
                    $totalSum += $total;
                    $billTotal = $totalSum + 10000;                    
                    $result = [($price + floatval($sugar) + floatval($size) + floatval($ice) + floatval($topping)) * floatval($quantity)];
                    $toppingInfo = handleTopping($topping);                    
                    $url_delete = "index.php?act=delete_cart&id_Cart=$id&header=headerSecond";
                    ?>
     
                 <!-- ----------------------------- -->
                  <tr>
                    <td> 
                       <img style="width: 20px;" src="<?=   $image  ?>" alt=""> 
                       <?= $product ?> (<?= handleSize($size) ?>)
                     </td>
                     <td>
                       <ul>
                        <?php for($j = 0 ; $j < count($toppingInfo);$j++){ ?>
                          <li><?= $toppingInfo[$j] ?></li>                         
                        <?php } ?>
                       </ul>
                     </td>
                     <td><?= handleSugar($sugar) ?> đường <?= handleIce($ice) ?> đá</td>
                     <td><?= number_format($price) ?>đ</td>
                     <td>
                       <div class="quantity d-f al-c jf-c">
                         
                         <div class="product_quantity"><?= $quantity ?></div>
                         <input style="width:30px" type="number" name="quantity1[]" hidden value="<?= $quantity ?>">
                                                  
                       </div>
                     </td>
                     <td class="totalCash">
                      <?= number_format($result[0])  ?>đ
                    </td>
                    <input type="text" hidden name="totalCash[]" style="width:60px" value="<?= $result[0] ?>">
                    <input type="text" hidden name="sugar" style="width:60px" value="<?= $sugar ?>">
                    <input type="text" hidden name="size" style="width:60px" value="<?= $size ?>">
                    <input type="text" hidden name="toppping" style="width:60px" value="<?= $topping ?>">
                    <input type="text" hidden name="price" style="width:60px" value="<?= $price ?>">
                    <input type="text" hidden name="giohang_id[]" value="<?= $id ?>">
                    

                    
                  </tr>
                  <?php } ?>
                 <!-- ----------------------------- -->
                  
     
                </tbody>
      
      
               </table>
               <div class="w-100 d-f jf-b m-t-b10">
                 
                 <button>
                   <a href="index.php" class="continue-buy" style="padding: 10px 20px;display:block">
                     Tiếp tục mua hàng
                   </a>
                 </button>
                
                 
               </div>
              </div>
              </section>
              <!-- ----------------------------------- Form hiển thị giỏ hàng ----^--------------------- -->
     
     
             <!-- ------------------ Nhập thông tin người dùng và thanh toán----------------v--------------- -->
               <section class="contain-info_user-pay w-100 ">
     
                 <!-- --------------Thông tin người dùng---------v----- -->
                 <div class="d-f jf-b w-100">
                 <div class="info_user w-45">
                   <h4>Thông tin mua hàng</h4>
                   <div>
                     
                       <a class="get-old-info" href="">
                         Lấy thông tin cũ
                       </a>
                     
                       <!-- ------- -->
                       <div class="d-f w-100 m-t-b10">
                         <label class="label_input-info-user" for=""><i class="fa-solid fa-user"></i></label>
                         <input type="text" placeholder="Tên người nhận" class="input-info" id="user" name="user" value="<?= $info_user ?>">
                       </div>
                       <!-- --------- -->
                       <!-- ------- -->
                       <div class="d-f w-100 m-t-b10">
                         <label class="label_input-info-user" for=""><i class="fa-solid fa-phone"></i></label>
                         <input type="text" placeholder="Số điện thoại" class="input-info" id="number-phone" name="number-phone" value="<?= $info_tele ?>">
                       </div>
                       <!-- --------- --> 
                       <!-- ------- -->
                       <div class="d-f w-100 m-t-b10">
                         <label class="label_input-info-user" for=""><i class="fa-solid fa-location-dot"></i></label>
                         <input type="text" placeholder="Địa chỉ" class="input-info" id="address" name="address" value="<?= $info_address ?>">
                       </div>
                       <!-- --------- -->
                       <!-- ------- -->
                       <div class="d-f w-100 m-t-b10">
                         <label class="label_input-info-user" for="">
                           <i class="fa-regular fa-clipboard"></i>
                         </label>
                         <input type="text" placeholder="Ghi chú thêm địa chỉ" class="input-info" id="note" name="note">
                       </div>
                       <!-- --------- -->
                       
                       <span class="note" style="color:red">
                         Note : 3 trường đầu không được để trống
                       </span>
                       
                   </div>
                 </div>
                 <!-- --------------Thông tin người dùng---------^----- -->
                 <!-- -------------------- Thanh toán -----------v----- -->
                 <div class="block-pay w-45">
                   <div class="payments w-100">
                     <h4>Hình thức chuyển khoản</h4>
                     <div  class="w-100">
                     <div class="m-t-b10">
                       <input type="radio" class="input-info"  required  name="credit" value="1" >
                       <label for="">Chuyển khoản ngân hàng</label>
                     </div>
                     <div class="m-t-b10">
                       <input type="radio" class="input-info" name="credit" value="2">
                       <label for="">Thanh toán tiền mặt</label>
                     </div>
                   </div>
                   </div>
                   <ul class="w-100 block-pay_ul">
                     <li class="d-f jf-b">
                       <span style="font-weight: 600;font-size: 1.7rem;">
                         Tổng tiền giỏ hàng
                       </span>
                      
                     </li>
                     <li class="d-f jf-b">
                       <span>
                         Tiền tạm tính
                       </span>
                       <span class="cash">
                        <?= number_format($totalSum) ?>đ
                       </span>
                     </li>
                     <li class="d-f jf-b">
                       <span>
                          Phí vận chuyển
                       </span>
                       <span class="cash">
                         10,000đ
                       </span>
                     </li>
                     <li class="d-f jf-b">
                       <span>
                       Tổng tiền
                       </span>
                       <span class="cash">
                         <?php if(isset($billTotal))echo number_format( $billTotal) ?>đ
                         <input hidden type="text" value="<?=  $billTotal ?>" name="total">
                       </span>
                     </li>
                     <li class="d-f jf-c">

                      <!-- <span class="w-100 d-f jf-c buy-now " >Mua ngay</span> -->
                      <input type="submit" style="text-align: center;" class="w-100 d-f jf-c buy-now " value="Mua ngay" name="order">
                     </li>
                     
                   </ul>
                 </div>
                 </div>
     
     
                 <!-- -------------------- Thanh toán -----------^----- -->
     

                 </section>
               </form>
               
     
     
           
                                                            
             <!-- ------------------ Nhập thông tin người dùng và thanh toán---------------^--------------- -->
                                           
           </main>
           <div class="contain-overlay-product-detail">
            <div class="contain-product-detail">

            <!-- ------------------------------ -->
                  <div class="sideBar_pay">
                    <div class="timePay blockPayment" >
                      <span>Đơn hàng hết hạn sau</span>
                      <span class="timeRestPay">10:00</span>
                    </div>
                    <div class="timePay blockPayment">
                      <span><i class="fa-solid fa-shop"></i> Nhà cung cấp</span>
                      <span>Shop</span>
                    </div>
                    <div class="timePay blockPayment">
                      <span><i class="fa-solid fa-money-bill"></i> Số tiền</span>
                      <span><?=  number_format($billTotal) ?> đ</span>
                    </div>
                    <div class="timePay blockPayment">
                      <span><i class="fa-solid fa-circle-info"></i> Thông tin</span>
                      <span>Thanh toán bằng MBbank</span>
                      <span>STK : 0396277278</span>
                    </div>
                    <div class="timePay blockPayment">
                      <span><i class="fa-solid fa-id-card-clip"></i> Mã đơn hàng</span>
                      <span > <?= $id ?></span>
                    </div>
                    <div class="timePay blockPayment">
                      <button class="button-back-pay">
                      <i class="fa-solid fa-arrow-left"></i> Quay lại
                      </button>
                    </div>
                  </div>
            <!-- ------------------------------ -->
                  <div class="contain_QR_code">
                    <div class="w-100 d-f jf-e">
                        <div class="close_show">
                          <i class="fa-solid fa-xmark"></i>
                        </div>
                    </div>
                
                    <div class="contain_logo_MBbank">
                          <div class="logo_MBbank">
                            <img width="120px" src="img/logo/mbbank.png" alt="">
                          </div>
                          <div class="logo_MBbank">
                          <img width="120px" src="img/logo/mbbank.png" alt="">
                          </div>
                    </div>
                    <div class="line_pay"></div>
                    <div class="qr_code w-100 d-f al-c f-d">
                      <h4 class="m-t-b10">Quét mã để thanh toán</h4>
                      <div class="img_QR_code">
                        <img src="img/logo/mblong.jpg" width="230px" alt="">
                      </div>
                      <p>
                         Sử dụng app MBBank để quét mã
                      </p>
                      <div>
                        <span class="loading-pay "><i class="fa-solid fa-spinner loading-pay-icon loading-pay-icon-ani"></i></span>
                        <span class="processing-pay">
                        Đang chờ quét mã
                        </span>
                      </div>
                    </div>
                    <div class="notePay">
                      * Sau khi chuyển khoản hãy chờ để ngân hàng xác nhận
                    </div>

                  </div>
              </div>
            </div>
    <script type="module" src="JavaScript/cart.js"></script>
    
