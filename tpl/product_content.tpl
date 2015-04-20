<section id="product-content">
	<div class="container">
		<div class="row">
			<div  class="col-md-6 col-sm-6 col-xs-12 left">
				<img style="margin: 0 auto" class="img-responsive" src="<?php print $this->config->img_dir.$this->product['image']; ?>" alt="<?php print $this->product['title'] ?>">
			</div>
			<div class="col-md-6 col-sm-6 col-xs-12 right">
				<h2><?php print $this->product['title']; ?></h2>
				<p class="price"><?php print $this->product['price']; ?><span> грн.</span></p>
				<button class="add-to-cart">В кошик</button>
				<input type="hidden" value="<?php print $this->product['id']; ?>" class="product-id">
				<p class="category">Категорія:<span>   <?php print $this->product['category']; ?></span></p>
				<p class="proiz">Виробник: <span>   <?php print $this->product['proiz']; ?></span></p>
				<p class="desc">Опис: <span>   <?php print $this->product['description']; ?></span></p>
			</div>
		</div>
	</div>
</section>
<section id="product-comment">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-sm-6 col-xs-12 comment">
				<h1 id="comments_title"><?php print $this->comment_count; ?> Comments</h1>
				<?php
					foreach ($this->comment as $item) {
				?>
				<div class="media comment_section">
                    <div class="pull-left post_comments">
                        <img src="images/blog/boy2.png" class="img-circle" alt="people" />
                    </div>
                    <div class="media-body post_reply_comments">
                        <h3><?php print $item['name']; ?></h3>
                        <h4><?php print $item['data']; ?></h4>
                        <p><?php print $item['text']; ?></p>
                    </div>
                </div>
                <?php
            		}
                ?>
			</div>
			<div class="col-md-6 col-sm-6 col-xs-12 add-comment">
				<div id="main-contact-form" class="contact-form" >
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label>Імя *</label>
                            <input type="text" class="form-control" >
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label>Повідомлення *</label>
                            <textarea name="message" id="message"  class="form-control" rows="8"></textarea>
                        </div>
                        <div class="form-group">
                        	<input type="hidden" class="hidden-id" value="<?php print $this->product['id']; ?>">
                            <button id="add-comment" class="btn btn-primary btn-lg" >Опублікувати повідомлення</button>

                        </div>
                    </div>
                </div>
			</div>
		</div>
	</div>
</section>