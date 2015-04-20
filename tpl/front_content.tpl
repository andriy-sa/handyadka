    <section id="main-slider" class="no-margin">
        <div class="carousel slide">
            <ol class="carousel-indicators">
                <li data-target="#main-slider" data-slide-to="0" class="active"></li>
                <li data-target="#main-slider" data-slide-to="1"></li>
                <li data-target="#main-slider" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="item active" style="background-image: url(images/slider/bg3.jpg)">
                    <div class="container">
                        <div class="row slide-margin">
                            <div class="col-sm-6">
                                <div class="carousel-content">
                                    <h1 class="animation animated-item-1">Знижки для постійних клієнтів</h1>
                                    <h2 class="animation animated-item-2">Нашим постійним партнерам ми надаємо постійні умови роботи - систему знижок, систему оплати, доставку, мерчандайзинг, пакетні пропозиції, консультації менеджера. Наша система знижок прозора, стабільна і, в теж час, індивідуальна в залежності від інтенсивності роботи кожного партнера.</h2>

                                </div>
                            </div>
                            <div class="col-sm-6 hidden-xs animation animated-item-4">
                                <div class="slider-img">
                                    <img src="images/slider/img3.png" class="img-responsive">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="item" style="background-image: url(images/slider/bg2.jpg)">
                    <div class="container">
                        <div class="row slide-margin">
                            <div class="col-sm-6">
                                <div class="carousel-content">
                                    <h1 class="animation animated-item-1">Товарна політика</h1>
                                    <h2 class="animation animated-item-2">Наша компанія веде на ринку ручного будівельного інструменту активну товарну політику. Ми гарантуємо якість того, що продаємо!</h2>

                                </div>
                            </div>

                            <div class="col-sm-6 hidden-xs animation animated-item-4">
                                <div class="slider-img">
                                    <img src="images/slider/img2.png" class="img-responsive">
                                </div>
                            </div>

                        </div>
                    </div>
                </div><!--/.item-->


                <div class="item " style="background-image: url(images/slider/bg1.jpg)">
                    <div class="container">
                        <div class="row slide-margin">
                            <div class="col-sm-6">
                                <div class="carousel-content">
                                    <h1 class="animation animated-item-1">Перспективи</h1>
                                    <h2 class="animation animated-item-2">Ми розвиваємо себе, свій персонал, свій товарний портфель, поповнюючи його новими групами і торговими марками. Наші постійні партнери мають можливість залучати все нові і нові групи кінцевих споживачів в свої торгові точки за допомогою нових груп товарів нашої компанії.</h2>

                                </div>
                            </div>

                            <div class="col-sm-6 hidden-xs animation animated-item-4">
                                <div class="slider-img">
                                    <img src="images/slider/img1.png" class="img-responsive">
                                </div>
                            </div>

                        </div>
                    </div>
                </div><!--/.item--><!--/.item-->
            </div><!--/.carousel-inner-->
        </div><!--/.carousel-->
        <a class="prev hidden-xs" href="#main-slider" data-slide="prev">
            <i class="fa fa-chevron-left"></i>
        </a>
        <a class="next hidden-xs" href="#main-slider" data-slide="next">
            <i class="fa fa-chevron-right"></i>
        </a>
    </section><!--/#main-slider-->

    <section id="feature" >
        <div class="container">
           <div class="center wow fadeInDown">
                <h2>Характеристики</h2>
            </div>

            <div class="row">
                <div class="features">
                <?php
                    foreach ($this->harakteristic as $item) {
                ?>
                    <div class="col-md-4 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="feature-wrap">
                            <i class="fa <?php print $item['icon']; ?>"></i>
                            <h2><?php print $item['title']; ?></h2>
                            <h3><?php print $item['text']; ?></h3>
                        </div>
                    </div>
                <?php
                    }
                ?>
                </div><!--/.services-->
            </div><!--/.row-->
        </div><!--/.container-->
    </section><!--/#feature-->

    <section id="recent-works">
        <div class="container">
            <div class="center wow fadeInDown">
                <h2>Новини</h2>

            </div>

            <div class="row">
            <?php
                foreach ($this->news as $item) {
            ?>
                <div class="col-xs-12 col-sm-4 col-md-3">
                    <div class="recent-work-wrap">
                        <img class="img-responsive" src="userfiles/<?php print $item['image']; ?>" alt="">
                        <div class="overlay">
                            <div class="recent-work-inner">
                            <h3> <?php print $item['title']; ?> </h3>
                                <p><?php
                                $text = substr($item['text'],0,150);
                                $pos = strrpos($text, " ");
                                print substr($text,0,$pos)."...";
                                 ?></p>
                                <button class="preview" ><i class="fa fa-eye"></i> Детальніше</button>
                                <input type="hidden" id="news_id" value="<?php print $item['id']; ?>">
                            </div>
                        </div>
                    </div>
                </div>
            <?php
                }
            ?>
            </div><!--/.row-->
        </div><!--/.container-->
    </section><!--/#recent-works-->

    <div class="modal fade" id="NewsModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">TITLE</h4>
                </div>
                <div class="modal-body">

                </div>
            </div>
        </div>
    </div>
