    <section id="contact-info">
        <div class="center">
            <h2>Як з нами звязатися?</h2>
            <p class="lead">На цій сторінці ви зможете ознайомитися з нашими контактними даними.</p>
        </div>
        <div class="gmap-area">
            <div class="container">
                <div class="row">
                    <div class="col-sm-5 text-center">
                        <div class="gmap">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1265.7002980637517!2d26.249683200137206!3d50.6196746195568!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x472f13528785d5fb%3A0xe8165c11caa25838!2z0LLRg9C7LiDQodC-0LHQvtGA0L3QsCwgOTYsINCg0ZbQstC90LUsINCg0ZbQstC90LXQvdGB0YzQutCwINC-0LHQu9Cw0YHRgtGM!5e0!3m2!1sru!2sua!4v1429542451024" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
                        </div>
                    </div>

                    <div class="col-sm-7 map-content">
                        <ul class="row">
                            <li class="col-sm-12">
                                <address>
                                    <h5>Наші контакти:</h5>
                                    <p>Адреса: <span> <?php print $this->setting['address'] ?> </span> </p>
                                    <p>Телефон: <span> <?php print $this->setting['phone']; ?></span> </p>
                                    <p>Email Address: <span><?php print $this->setting['email']; ?></span></p>
                                </address>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>  <!--/gmap_area -->

    <section id="contact-page">
        <div class="container">
            <div class="center">
                <h2>Напишіть нам повідомлення</h2>
                <p class="lead">Заповніть форму повідомлення і натисніть відправити, щоб звязатися з нами.</p>
            </div>
            <div class="row contact-wrap">

                <div id="main-contact-form" class="contact-form">
                    <div class="col-sm-5 col-sm-offset-1">
                        <div class="form-group">
                            <label>Імя *</label>
                            <input type="text" name="name" class=" contact-name form-control" >
                        </div>
                        <div class="form-group">
                            <label>Email *</label>
                            <input type="email" name="email" class=" contact-mail form-control" >
                        </div>
                        <div class="form-group">
                            <label>Телефон</label>
                            <input type="text" class=" contact-phone form-control">
                        </div>

                    </div>
                    <div class="col-sm-5">
                        <div class="form-group">
                            <label>Тема *</label>
                            <input type="text" name="subject" class=" contact-theme form-control" >
                        </div>
                        <div class="form-group">
                            <label>Повідомлення *</label>
                            <textarea name="message" id="message"  class="contact-message form-control" rows="8"></textarea>
                        </div>
                        <div class="form-group">
                            <button id="contact-button" class="btn btn-primary btn-lg" >Відправити повідомлення</button>
                        </div>
                    </div>
                </div>
            </div><!--/.row-->
        </div><!--/.container-->
    </section><!--/#contact-page-->