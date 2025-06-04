<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="Link Generator & Cloacker. Ultimately Link cloacker for Facebook">
  <meta name="keywords" content="link cloacker, facebook, instagram, cloack, generator link, short link">
  <meta name="author" content="<?php echo $teamName;?>">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
  <title><?= $teamName; ?> - Ultimate Link Generator</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.3/css/bootstrap.min.css" integrity="sha512-oc9+XSs1H243/FRN9Rw62Fn8EtxjEYWHXRvjS43YtueEewbS6ObfXcJNyohjHqVKFPoXXUxwc+q1K7Dee6vv9g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.19/css/jquery.dataTables.min.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0/css/all.min.css" integrity="sha256-ybRkN9dBjhcS2qrW1z+hfCxq+1aBdwyQM5wlQoQVt/0=" crossorigin="anonymous" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0/js/all.min.js" integrity="sha256-0vuk8LXoyrmCjp1f0O300qo1M75ZQyhH9X3J6d+scmk=" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="<?php echo $siteurl;?>css/style.css">

  <link href="https://fonts.googleapis.com/css2?family=Barlow+Condensed:wght@200;400;700&display=swap" rel="stylesheet">
  <style>
    .teksberjalan {
      font-weight: bold;
      margin: 10px 0;
      padding: 0 10px;
    }
    .teksberjalan h3 {
      margin: 0px;
      padding: 0px;
    }
  </style>


  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>  
<?php 
if(isset($_GET['team'])) {

} else {
?>
<nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
  <a class="navbar-brand" href="index.php"><img src="images/logo-ptg.png" style="max-height: 30px"></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarsExampleDefault">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <a class="nav-link" href="index.php"><i class="fa fa-link"></i> Generator</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="image.php"><i class="fa fa-image"></i> Image Gen</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="domain.php"><i class="fa fa-globe"></i> Domain</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="mylinks.php"><i class="fa fa-link"></i> My Links</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="hitstats.php"><i class="fa fa-chart-bar"></i> My Stats</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="myteam.php"><i class="fa fa-users"></i> My Team</a>
      </li>
      <?php if(User::access()) { ?>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-user"></i> Account</a>
        <div class="dropdown-menu" aria-labelledby="dropdown01">
          <?php if(User::access(1)) { ?>
          <a class="dropdown-item" href="user.php"><i class="fa fa-users"></i> Users</a>
          <a class="dropdown-item" href="manage-order.php"><i class="fa fa-money"></i> Orders</a>
          <?php }?>
          <a class="dropdown-item" href="profile.php"><i class="fa fa-user"></i> Profile</a>
          <a class="dropdown-item" href="logout.php"><i class="fa fa-power-off"></i> Logout</a>
        </div>
      </li>
      <?php } else { ?>

      <?php }?>
    </ul>
  </div>
</nav>
<?php 
}
?>
<div class='container content'>