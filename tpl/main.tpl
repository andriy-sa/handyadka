<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title><?php print $this->title; ?></title>

	<!-- core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/chosen.min.css" rel="stylesheet">
    <link href="css/jquery-ui.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->

<body class="homepage">

    <header id="header">
        <div class="top-bar">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-xs-4">
                        <div class="top-number"><p><i class="fa fa-phone-square"></i>   <?php print $this->setting['phone']; ?></p></div>
                    </div>
                    <div class="col-sm-6 col-xs-8">
                       <div class="social">
                            <ul class="social-share">
                                <li><a href="<?php print $this->setting['fc']; ?>"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="<?php print $this->setting['twi']; ?>"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="<?php print $this->setting['vk']; ?>"><i class="fa fa-vk"></i></a></li>
                                <li><a href="<?php print $this->setting['skype']; ?>"><i class="fa fa-skype"></i></a></li>
                            </ul>
                            <div class="search">
                                <form role="form" method="GET" action="search">
                                    <input type="text" name="search" class="search-form" autocomplete="off" placeholder="Пошук">
                                    <i class="fa fa-search"></i>
                                </form>
                           </div>
                       </div>
                    </div>
                </div>
            </div><!--/.container-->
        </div><!--/.top-bar-->

        <nav class="navbar navbar-inverse" role="banner">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="/"><img src="images/logo.png" alt="logo"></a>
                </div>

                <div class="collapse navbar-collapse navbar-right">
                    <ul class="nav navbar-nav">
                        <li class="<?php if ($this->view == 'front') print 'active'; ?>"><a href="/">Головна</a></li>
                        <li class="<?php if ($this->view == 'catalog') print 'active'; ?>"><a href="catalog">Каталог</a></li>
                        <li class="<?php if ($this->view == 'about') print 'active'; ?>"><a href="about">Про нас</a></li>
                        <li class="<?php if ($this->view == 'contact') print 'active'; ?>"><a href="contact">Контакти</a></li>
                    </ul>
                </div>
            </div><!--/.container-->
        </nav><!--/nav-->

    </header><!--/header-->

    <?php include $this->view."_content.tpl"; ?>

    <footer id="footer" class="midnight-blue">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    &copy; 2015 <?php print $this->setting['fotter_tittle']; ?>
                </div>
                <div class="col-sm-6">
                    <ul class="pull-right">
                        <li><a href="/">Головна</a></li>
                        <li><a href="about">Про нас</a></li>
                        <li><a href="contact">Контакти</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer><!--/#footer-->

    <div class="modal fade" id="MessageModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Повідомлення</h4>
                </div>
                <div class="modal-body">

                </div>
            </div>
        </div>
    </div>
    <?php if ($this->view !='cart') { ?>
        <div class="block-mini-cart closed">
            <div class="top-zone">
                <span class="count-label">К-ть</span>
                <span class="price-label">Сумма</span>
            </div>
            <div class="cart-body">
                <div class="cart-ajax">
                    <span class="count"><?php
                    if(isset($_SESSION['products']))
                    print $_SESSION['products_incart'];
                    else print "0";
                     ?></span>
                    <span class="price"><span class="ua">₴</span> <?php
                    if(isset($_SESSION['products']))
                     print $_SESSION['cart_coast'];
                     else print "0"; ?></span>
                </div>
                <a href="cart" class="to-cart">До кошика</a>
                <a href="order" class="to-order">Оформити</a>
            </div>
            <button class="dinamic-cart ">
            </button>
        </div>
    <?php } ?>

    <script src="js/jquery-1.11.2.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="../js/jquery-ui.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/jquery.isotope.min.js"></script>
    <script src="js/main.js"></script>
    <script src="js/wow.min.js"></script>
    <script src="js/chosen.jquery.min.js"></script>
    <script src="js/function.js"></script>
</body>
</html>