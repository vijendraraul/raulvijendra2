<!DOCTYPE html>
<html>
<?php 
 include('session_customer.php');
if(!isset($_SESSION['login_customer'])){
    session_destroy();
    header("location: customerlogin.php");
}
?> 
<title>Book Seed </title>
<head>
    <script type="text/javascript" src="assets/ajs/angular.min.js"> </script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="shortcut icon" type="image/png" href="assets/img/P.png.png">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/w3css/w3.css">
  <script type="text/javascript" src="assets/js/jquery.min.js"></script>
  <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>  
  <script type="text/javascript" src="assets/js/custom.js"></script> 
 <link rel="stylesheet" type="text/css" media="screen" href="assets/css/clientpage.css" />
</head>
<body ng-app=""> 


      <!-- Navigation -->
     <!-- Navigation -->
     <nav class="navbar navbar-custom navbar-fixed-top" role="navigation" style="color: black">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
                    <i class="fa fa-bars"></i>
                    </button>
                <a class="navbar-brand page-scroll" href="index.php">
                   SHETKARI SEED </a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->

            <?php
                if(isset($_SESSION['login_client'])){
            ?> 
            <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="index.php">Home</a>
                    </li>
                    <li>
                        <a href="#"><span class="glyphicon glyphicon-user"></span> Welcome <?php echo $_SESSION['login_client']; ?></a>
                    </li>
                    <li>
                    <ul class="nav navbar-nav navbar-right">
            <li><a href="#" class="dropdown-toggle active" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-user"></span> Control Panel <span class="caret"></span> </a>
                <ul class="dropdown-menu">
              <li> <a href="entercar.php">Add Seeds</a></li>
              <li> <a href="enterdriver.php"> Add Agent</a></li>
              <li> <a href="clientview.php">My Orders</a></li>

            </ul>
            </li>
          </ul>
                    </li>
                    <li>
                        <a href="logout.php"><span class="glyphicon glyphicon-log-out"></span> Logout</a>
                    </li>
                </ul>
            </div>
            
            <?php
                }
                else if (isset($_SESSION['login_customer'])){
            ?>
            <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="index.php">Home</a>
                    </li>
                    <li>
                        <a href="#"><span class="glyphicon glyphicon-user"></span> Welcome <?php echo $_SESSION['login_customer']; ?></a>
                    </li>
                    <ul class="nav navbar-nav">
            <li><a href="#" class="dropdown-toggle active" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> My Cart <span class="caret"></span> </a>
                <ul class="dropdown-menu">
              <li> <a href="prereturncar.php">Cart</a></li>
              <li> <a href="mybookings.php"> My Bookings</a></li>
            </ul>
            </li>
          </ul>
                    <li>
                        <a href="logout.php"><span class="glyphicon glyphicon-log-out"></span> Logout</a>
                    </li>
                </ul>
            </div>

            <?php
            }
                else {
            ?>

            <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="index.php">Home</a>
                    </li>
                    <li>
                        <a href="clientlogin.php">Admin</a>
                    </li>
                    <li>
                        <a href="customerlogin.php">Customer</a>
                    </li>
                    <li>
                </ul>
            </div>
                <?php   }
                ?>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    
<div class="container" style="margin-top: 65px;" >
    <div class="col-md-7" style="float: none; margin: 0 auto;">
      <div class="form-area">
        <form role="form" action="bookingconfirm.php" method="POST">
        <br style="clear: both">
          <h2 style="margin-bottom: 25px; text-align: center; font-size: 30px;"> Buy your Seeds here </h2><br>

        <?php
        $car_id = $_GET["id"];
        $sql1 = "SELECT * FROM cars WHERE car_id = '$car_id'";
        $result1 = mysqli_query($conn, $sql1);

        if(mysqli_num_rows($result1)){
            while($row1 = mysqli_fetch_assoc($result1)){
                $car_name = $row1["car_name"];
                $car_nameplate = $row1["car_nameplate"];
                $ac_price = $row1["ac_price"];
                $non_ac_price = $row1["non_ac_price"];
                $ac_price_per_day = $row1["ac_price_per_day"];
                $non_ac_price_per_day = $row1["non_ac_price_per_day"];
            }
        }

        ?>

          <!-- <div class="form-group"> -->
              <h5> Seed:&nbsp;  <?php echo($car_name);?></h5>
         <!-- </div> -->
         
          <!-- <div class="form-group"> -->
            <h5> Seed Number:&nbsp; <?php echo($car_nameplate);?></h5>
          <!-- </div>      -->
        <!-- <div class="form-group"> -->
        <?php $today = date("Y-m-d") ?>
          <label><h5>Delivery Date:</h5></label>
            <input type="date" name="rent_start_date" min="<?php echo($today);?>" required="">
            &nbsp;
          <label><h5>Expected Delivery Date:</h5></label>
          <input type="date" name="rent_end_date" min="<?php echo($today);?>" required="">
        <!-- </div>      -->
        
        <h5> Choose your Seed Quantity:  &nbsp;
            <input onclick="reveal()" type="radio" name="radio" value="ac" ng-model="myVar"> 1KG &nbsp;
            <input onclick="reveal()" type="radio" name="radio" value="non_ac" ng-model="myVar"> Half KG
                
        
        <div ng-switch="myVar"> 
        <div ng-switch-default>
                    <!-- <div class="form-group"> -->
                <h5>Amount: <h5>    
                <!-- </div>    -->
                     </div>
                    <div ng-switch-when="ac">
                    <!-- <div class="form-group"> -->
                <h5>Amount: <?php echo("₹" . $ac_price . "/kg and ₹" . $ac_price_per_day . "/per 1Kg ");?><h5>    
                <!-- </div>    -->
                     </div>
                     <div ng-switch-when="non_ac">
                     <!-- <div class="form-group"> -->
                <h5>Amount: <?php echo("₹" . $non_ac_price . "/Half kg and ₹" . $non_ac_price_per_day . "/per Half kg");?><h5>    
                <!-- </div>   -->
                     </div>
        </div>

         <h5> Choose charge :  &nbsp;
            <input onclick="reveal()" type="radio" name="radio1" value="km"> per kg(s) &nbsp;
            <input onclick="reveal()" type="radio" name="radio1" value="days"> per 1kg(s)

            <br><br>
                <!-- <form class="form-group"> -->
                Choose a Agent: &nbsp;
                <select name="driver_id_from_dropdown" ng-model="myVar1">
                        <?php
                        $sql2 = "SELECT * FROM driver d WHERE d.driver_availability = 'yes' AND d.client_username IN (SELECT cc.client_username FROM clientcars cc WHERE cc.car_id = '$car_id')";
                        $result2 = mysqli_query($conn, $sql2);

                        if(mysqli_num_rows($result2) > 0){
                            while($row2 = mysqli_fetch_assoc($result2)){
                                $driver_id = $row2["driver_id"];
                                $driver_name = $row2["driver_name"];
                                $driver_gender = $row2["driver_gender"];
                                $driver_phone = $row2["driver_phone"];
                    ?>
  

                    <option value="<?php echo($driver_id); ?>"><?php echo($driver_name); ?>
                   

                    <?php }} 
                    else{
                        ?>
                    Sorry! No Agents are currently available, try again later...
                        <?php
                    }
                    ?>
                </select>
                <!-- </form> -->
                <div ng-switch="myVar1">
                

                <?php
                        $sql3 = "SELECT * FROM driver d WHERE d.driver_availability = 'yes' AND d.client_username IN (SELECT cc.client_username FROM clientcars cc WHERE cc.car_id = '$car_id')";
                        $result3 = mysqli_query($conn, $sql3);

                        if(mysqli_num_rows($result3) > 0){
                            while($row3 = mysqli_fetch_assoc($result3)){
                                $driver_id = $row3["driver_id"];
                                $driver_name = $row3["driver_name"];
                                $driver_gender = $row3["driver_gender"];
                                $driver_phone = $row3["driver_phone"];

                ?>

                <div ng-switch-when="<?php echo($driver_id); ?>">
                    <h5>Agent Name:&nbsp; <?php echo($driver_name); ?></h5>
                    <p>Gender:&nbsp; <?php echo($driver_gender); ?> </p>
                    <p>Contact:&nbsp; <?php echo($driver_phone); ?> </p>
                </div>
                <?php }} ?>
                </div>
                <input type="hidden" name="hidden_carid" value="<?php echo $car_id; ?>">
                
         
           <input type="submit"name="submit" value="Book Now" class="btn btn-success pull-right">     
        </form>
        
      </div>
      <div class="col-md-12" style="float: none; margin: 0 auto; text-align: center;">
            <h6><strong>Kindly Note:</strong> You will be charged <span class="text-danger">₹200/-</span> for each day after the due date.</h6>
        </div>
    </div>

</body>
<footer class="site-footer">
        <div class="container">
            <hr>
            <div class="row">
                <div class="col-sm-6">
                    <h5>© 2023 Shetkari Seed</h5>
                </div>
            </div>
        </div>
    </footer>
</html>