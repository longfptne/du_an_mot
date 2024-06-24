<?php
 ob_start();
session_start();
include "../../model/pdo.php";
include "../../model/binhluan.php";
include "../../model/taikhoan.php";
$id_pro = $_REQUEST['id_pro'];
$comment = loadall_binhluan($id_pro,0);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/product/product-detail.css">
    <title>Bình luận</title>
</head>
<body>
    <div class="product_category contain_comment w-100">
        <ul>
            <li style="position: sticky;top:0px;left:0px;" class="li-comment" >Bình luận</li>
            <table class="table-comment">
            <?php 
                $count ;
                for ($i = 0; $i < count($comment); $i++) {
                    $user_id = $comment[$i]['iduser'];
                    $content = $comment[$i]['noidung'];
                    $date = $comment[$i]['ngaybinhluan'];
                    $userAccount = checkUserId($user_id);
                    $userName = $userAccount['user'];
                    $imagePath = "upload/";
                    $image = $imagePath . $userAccount['avatar'];
                    
                   $count = $i;
                ?>
               
                    <tr class="d-f f-d" >                        
                        <td style="font-size: 1.8rem;font-weight:700">
                          <div class="d-f">  
                            <div class="avatarComment" ><img src="<?= $image ?>" alt=""></div>
                            <?= $userName ?></div>
                        </td>
                        <td><?= $content ?></td>
                        <td><?= $date ?></td>                                               
                    </tr>
                  
                    <?php }  ?>   

            </table>
            <!--  -->
            

                    <?php if(isset($_SESSION['user'])){ ?>
                    <li style="position:<?php if($count > 2){echo "sticky";}else{echo "absolute";}?>;bottom:-0.5px;box-sizing:border-box;width:100%;">
                        <form action="<?= $_SERVER['PHP_SELF'];  ?>" class="d-f " method="POST">
                            <input hidden type="text" id="search_product" name="id_pro" value="<?= $id_pro ?>">
                            <textarea class="comment_textarea" style="width:90%;resize: none;" name="comment" id="" rows="5"  placeholder="Nhập phần bình luận của bạn ở đây" required></textarea>
                            <button class="comment_product_btn">
                                <div class="btn_send_comment">
                                    <input type="submit" value="Send" name="sendComment" >
                                </div>
                            </button>
                        </form>
                    </li>
               <?php }  else{?>


                    <li style="bottom:0px;box-sizing:border-box;width:100%;padding : 20px 20px;background:#9999;" class="li_comment">
                        Please <a style="color: red;font-weight:700" href="index.php">sign in</a> to comment
                    </li>
               <?php } ?>



       
            
        </ul>        
    </div>

    <?php   
    if (isset($_POST['sendComment']) && $_POST['sendComment']) {
        $id_product = isset($_POST['id_pro']) ? $_POST['id_pro'] : 0;
        $user_id = $_SESSION['user']['id'];
        $content = isset($_POST['comment']) ? $_POST['comment'] : 0;
        date_default_timezone_set('Asia/Ho_Chi_Minh');
        $date_comment = date('H:i:sa d/m/Y');
        insert_binhluan($content, $id_product,$user_id,$date_comment);
        
        header("Location: " . $_SERVER['HTTP_REFERER']);
    }
    // ob_end_flush();
    ?>
</body>
</html>