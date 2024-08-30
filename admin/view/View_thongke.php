<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách tin tức</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/be9ed8669f.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../giaodien/style.css">
</head>

<body>
    <?php
    include "view/component/header.php"
    ?>
    <!-- END HEADER -->
    <!-- CONTENT -->
    <main class="d-flex container" style="display: flex;">
        <!-- Sidebar trái -->
        <?php
        include "view/component/sidebar.php"
        ?>

        <!-- Main content -->
        <div class="bieudo1">
            <div class="pt-4 ms-4 me-4">
                <h3 style="height:70px">Thông kê sản phẩm theo danh mục</h3>
                <div class="">
                    <table class="table table-striped table-hover table-bordered">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Tên danh mục</th>
                                <th scope="col">Số lượng tổng kho</th>
                                <!-- <th scope="col">Hành động</th> -->
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $i = 1;
                            foreach ($dsthongKe as $key => $tk) {
                            ?>

                                <tr>
                                    <td scope="row"><?= $i++; ?></td>

                                    <td>
                                        <div style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; width: 100px;">
                                            <?= $tk->cate_name ?>
                                        </div>
                                    </td>

                                    <td>
                                        <div style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; width: 100px;">
                                            <?= $tk->total_quantity ?>
                                        </div>
                                    </td>
                                </tr>
                            <?php
                            }

                            ?>
                        </tbody>
                    </table>
                </div>

            </div>

            <div class="chart1 mt-5">
                <h3 style="text-align: center">Biểu đồ</h3>

                <div id="piechart"></div>

                <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

                <script type="text/javascript">
                    // Load google charts
                    google.charts.load('current', {
                        'packages': ['corechart']
                    });
                    google.charts.setOnLoadCallback(drawChart);

                    // Draw the chart and set the chart values
                    function drawChart() {
                        var data = google.visualization.arrayToDataTable([
                            ['Tên danh mục', 'Số lượng sản phẩm'],
                            <?php foreach ($dsthongKe as $tk) : ?>['<?= $tk->cate_name ?>', <?= $tk->total_quantity ?>],
                            <?php endforeach; ?>

                        ]);

                        // Optional; add a title and set the width and height of the chart
                        var options = {
                            'title': 'Thống kê sản phẩm theo danh mục',
                            'width': 550,
                            'height': 400
                        };

                        // Display the chart inside the <div> element with id="piechart"
                        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
                        chart.draw(data, options);
                    }
                </script>
            </div>
        </div>

        <div class="bieudo2">
            <div class="pt-4 ms-4 me-4">
                <h3 style="height:70px">Thông kê sản phẩm đã bán - T7/2024</h3>
                <div class="">
                    <table class="table table-striped table-hover table-bordered">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Tên sản phẩm</th>
                                <th scope="col">Số lượng bán được</th>
                                <!-- <th scope="col">Hành động</th> -->
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $i = 1;
                            foreach ($dsSold_M7 as $key => $tk) {
                            ?>

                                <tr>
                                    <td>
                                        <?= $i++; ?>
                                    </td>
                                    <td>
                                        <div style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; width: 100px;">
                                            <?= $tk->pro_name ?>
                                        </div>
                                    </td>

                                    <td>
                                        <div style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; width: 100px;">
                                            <?= $tk->total_pro_bill ?>
                                        </div>
                                    </td>
                                </tr>
                            <?php
                            }

                            ?>
                        </tbody>
                    </table>
                </div>

            </div>

        </div>

        <!-- End main content -->
    </main>
    <!-- FOOTER -->
    <?php
    include "view/component/footer.php"
    ?>
    <!-- END FOOTER -->


</body>

</html>