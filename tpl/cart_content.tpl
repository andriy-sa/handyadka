<div class="page-title container">Кошик</div>
<section id="cart-page-content" class="container">
	<?php
		if ($_SESSION['products_incart'] == 0 ) {
			print "<p class='cart-empty'>Ваш кошик пустий!</p>";
		}
		else {
			foreach ($_SESSION['products'] as $key => $value) {
				$product = $this->get_item_by_param('product', 'id', $key);
	?>
					<div class="row">
						<div class="col-sm-2 col-md-1 hidden-xs">
							<div class="image">
							<a href="<?php print $product['url']; ?>"><img width="64" height="64" alt="<?php print $product['title'];?>" src="<?php print $this->config->img_dir.$product['image']; ?>" /></a>
							</div>
						</div>
						<div class="col-sm-3 col-md-4 col-xs-12">
							<a class="title" href="<?php print $product['url']; ?>"><?php print $product['title']; ?></a>
						</div>
						<div class="col-sm-2 col-xs-3">
							<div class="price">
								<?php print $product['price']."<span> грн.</span>" ?>
							</div>
						</div>
						<div class="col-sm-2 col-xs-3 nodepadding">
							<button class='min_one_count'>-</button>
							<input readonly='true' type="text" id="quantity" value="<?php print $_SESSION['products'][$key]['count']; ?>">
							<button class='add_one_count'>+</button>
							<input type="hidden" id='#hidden-id' value='<?php print $product['id']; ?>'>
						</div>
						<div class="col-sm-2 col-xs-3">
							<div class="price-count">
								<?php print $product['price']*$_SESSION['products'][$key]['count']."<span> грн.</span>" ?>
							</div>
						</div>
						<div class="col-sm-1 col-xs-3">
							<button class="del_from_cart" onclick="del_from_cart(<?php print $key; ?>)"></button>
						</div>
					</div>
	<?
			}
	?>
					<div class="row cart-footer">
						<div class="total-price">
							Разом: <?php print $_SESSION['cart_coast']."<span> грн.</span>" ?>
						</div>
						<a href="order" class="go-to-order">Оформити замовлення</a>
					</div>
	<?php
		}
	?>
</section>