<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>
    <link rel="shortcut icon" href="img/logo_darkblue_notfull.svg" type="image/x-icon">
    <link rel="stylesheet" href="giaodien/home.css">
    <link rel="stylesheet" href="giaodien/sign_in.css">
    <link rel="stylesheet" href="giaodien/userDetail.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <script src="https://kit.fontawesome.com/6dab569175.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>

</head>

<body>
    <?php
    include "view/Component/header.php"
    ?>
    <!-- End header -->
    <main>
        <nav>
            <ul>
                <li>
                    <a href="index.php">Trang chủ</a>
                    <i class="fa-solid fa-angle-right"></i>
                </li>
                <li>
                    <h5>Profile</h5>
                </li>
            </ul>
        </nav>
        <div class="profile">tài khoản cá nhân</div>
        <div class="main_content">
            <form action="?act=update_profile" method="POST" enctype="multipart/form-data" class="form-profile">
                <div class="avatar">
                    <?php
                    if ($info->acc_image == "") { ?>
                        <img src="img/account/user_default.png" alt="">
                    <?php  } else { ?>
                        <img src="img/account/<?= $info->acc_image ?>" alt="">
                    <?php  } ?>
                    <input type="text" name='acc_image' value="<?= $info->acc_image ?>" hidden>
                </div>
                <div class="detail_info">
                    <div class="hoten">Tên đăng kí: <?= $info->acc_name ?>
                        <input type="text" name='acc_name' value='<?= $info->acc_name ?>' hidden>
                    </div>
                    <div class="email">Email: <?= $info->acc_email ?>
                        <input type="email" name='acc_email' value='<?= $info->acc_email ?>' hidden>
                    </div>
                    <div class="password">Mật khẩu: *********
                        <input type="password" name='acc_password' value='<?= $info->acc_password ?>' hidden>
                    </div>
                    <div class="password">Số điện thoại: <?= $info->acc_phone ?>
                        <input type="text" name='acc_phone' value='<?= $info->acc_phone ?>' hidden>
                    </div>

                </div>
                <a href="" class="btn-edit">
                    <button name='updateProfile'>chỉnh sửa</button>
                </a>
            </form>

            <div class="inf_Order">
                <h2 style="text-align:center;padding-bottom:10px">Lịch sử đơn hàng của bạn</h2>

                <?php
                if ($check == 1) { ?>
                    <div class="bill_dt_one">
                        <?php foreach ($bill_dt_one as $order) : ?>
                            <div class="one_pro_order">
                                <div class="Oder_img">
                                    <a href="?act=ctsp&id=<?= $order->pro_id ?>">
                                        <img src="img/product/<?= $order->pro_image ?>" alt="">
                                    </a>
                                </div>
                                <div class="Oder_inf">
                                    <h5><?= $order->pro_name ?> : <?= $order->pro_color ?>, <?= $order->pro_size ?></h5>
                                    <h5>Số lượng: <?= $order->quantity ?></h5>
                                    <h5>Tổng tiền: <span style="color: #DC3544;"><?= $order->total ?></span></h5>
                                    <h5> <span style="color: #6482AD; font-style:italic"><?= $order->date_order ?></span></h5>

                                </div>
                            </div>
                            <hr>
                        <?php endforeach; ?>
                    </div>
                <?php    }
                ?>



                <div class="all_pro_order">
                    <?php
                    foreach ($dsOrder_bill as $bill_one) { ?>
                        <div class="one_bill">
                            <form action="" style="display: flex;" id="form_dt">
                                <div class="line1">
                                    <h5>Người nhận: <span style="font-style: italic; font-size: 14px; color: darkcyan;"><?= $bill_one->fullname ?></span> </h5>
                                    <h5>Địa chỉ: <span style="font-style: italic; font-size: 14px; color: darkcyan;"><?= $bill_one->address ?></span></h5>
                                </div>
                                <div class="line2">
                                    <h5>Ngày order: <span style="font-style: italic; font-size: 14px; color: #f1a618;"><?= $bill_one->date_order ?></span></h5>
                                    <h5>Tổng giá trị đơn hàng: <span style="font-style: italic; font-size: 14px; color: #ef5420;"><?= $bill_one->bill_total ?></span></h5>
                                </div>
                                <div class="line3">
                                    <h5>Trạng thái: <?php if ($bill_one->bill_status == 0) { ?>
                                            <span style="font-style: italic; font-size: 14px; color: #6EACDA;">Chờ xác nhận</span>
                                            <a href="?act=update_bill_status_profile&bill_id=<?= $bill_one->bill_id ?>&bill_status=0">
                                                <button style="background-color: #DC3544;" id="check_bill_dt" type="button" class="bill_dt_btn" data-id=<?= $bill_one->bill_id ?>>
                                                    Hủy đơn
                                                </button>
                                            </a>
                                        <?php } else if ($bill_one->bill_status == 1) { ?>
                                            <span style="font-style: italic; font-size: 14px; color: #03346E;"> Đã xác nhận </span>
                                            <a href="?act=update_bill_status_profile&bill_id=<?= $bill_one->bill_id ?>&bill_status=1">
                                                <button style="background-color: #DC3544;" id="check_bill_dt" type="button" class="bill_dt_btn" data-id=<?= $bill_one->bill_id ?>>
                                                    Hủy đơn
                                                </button>
                                            </a>
                                        <?php } else if ($bill_one->bill_status == 2) { ?>
                                            <span style="font-style: italic; font-size: 14px; color: #FFAF00;">Đang giao hàng</span>
                                        <?php } else if ($bill_one->bill_status == 3) { ?>
                                            <span style="font-style: italic; font-size: 12px; color: #198754;">Giao hàng thành công</span>
                                            <div class="box_btn" style="display: flex;">
                                                <a href="">
                                                    <button style="background-color: #198754;" id="check_bill_dt" type="button" class="bill_status_btn" data-id=<?= $bill_one->bill_id ?>>
                                                        Đã nhận hàng
                                                    </button>
                                                </a>
                                            </div>
                                        <?php } else if ($bill_one->bill_status == 4) { ?>
                                            <span style="font-style: italic; font-size: 14px; color:red;">Đã hủy đơn</span> <?php
                                                                                                                        } ?>
                                    </h5>

                                    <a href="?act=view_profile&bill_id=<?= $bill_one->bill_id ?>">
                                        <button id="check_bill_dt" type="button" class="bill_dt_btn" data-id=<?= $bill_one->bill_id ?>>
                                            Xem chi tiết
                                        </button>
                                    </a>
                                </div>
                            </form>



                        </div>

                    <?php }
                    ?>


                </div>
            </div>
        </div>

    </main>
    <hr>

    <?php include "view/Component/footer.php" ?>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var billButtons = document.querySelectorAll('.bill_status_btn');

            billButtons.forEach(function(button) {
                var billId = button.getAttribute('data-id');
                var storageKey = 'bill_status_' + billId;

                // Kiểm tra nếu trạng thái đã được lưu trong Local Storage
                var storedStatus = localStorage.getItem(storageKey);
                if (storedStatus === 'bought') {
                    button.innerHTML = 'Mua lại';
                }

                button.addEventListener('click', function() {
                    button.innerHTML = 'Mua lại';

                    // Lưu trạng thái vào Local Storage khi click
                    localStorage.setItem(storageKey, 'bought');
                });
            });
        });
    </script>

</body>




</html>