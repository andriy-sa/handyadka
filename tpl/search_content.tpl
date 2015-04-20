<section id="catalog-products" class="search-content">
	<div class="container">
        <div class="row">
	<?php
		if(count($this->product) == 0) print "<p class='not-found-search'>За Вашим запитом нічого не знайдено!</p>";
		else {
	?>
		<p class="kl-slovo">Результати пошуку: <span><?php print $this->search; ?></span></p>
	<?php

			foreach ($this->product as $item) {
    ?>
	            <div class="col-md-4 col-sm-4 col-xs-12">
	                <div class="item">
	                    <a href="<?php print $item['url']; ?>" class="title"><?php print $item['title']; ?></a>
	                    <a class="img-cont" href="<?php print $item['url']; ?>">
	                    <img width="200px" height="200px" src="<?php print $this->config->img_dir.$item['image']; ?>" alt="<?php print $item['title']; ?>">
	                    </a>
	                    <p class="price"><?php print $item['price']; ?><span> грн.</span></p>
	                    <button class="add-to-cart">В кошик</button>
	                </div>
	            </div>
	<?php
			}
		}
	 ?>
		</div>
	</div>
</section>