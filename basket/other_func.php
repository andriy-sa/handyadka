<?php
session_start();
	if (!isset($_POST['view'])) header("Location: ../index.php");
	require_once "../lib/ajax_class.php";
	$ajax = new Ajax();

	if($_POST['view'] == 'new_comment') {
		$ajax->new_comment($_POST['name'], $_POST['text'],$_POST['product_id']);
	?>

		<h1 id="comments_title"><?php print $ajax->comment_count; ?> Comments</h1>
		<?php
			foreach ($ajax->comment as $item) {
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
	}
	if ($_POST['view'] == 'news_modal') {
		$ajax->get_news($_POST['id']);
	?>
			<div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel"><?php print $ajax->news['title']; ?></h4>
                </div>
                <div class="modal-body">
                    <img src="../userfiles/<?php print $ajax->news['image']; ?>" height="220" width="300" alt="">
					<?php print $ajax->news['text']; ?>
                </div>
	<?php
	}

	if ($_POST['view'] == 'contact_message') {
		$ajax->send_message($_POST['name'], $_POST['mail'], $_POST['phone'], $_POST['theme'],$_POST['message']);
	}

	if ($_POST['view'] == 'add_to_cart') {
		$product_id = htmlspecialchars($_POST['id']);
		$ajax->add_to_cart($product_id);
	?>
		<span class="count"><?php print $_SESSION['products_incart']; ?></span>
        <span class="price"><span class="ua">₴</span> <?php print $_SESSION['cart_coast']; ?></span>
    <?php
	}

	if($_POST['view'] == 'del_from_cart') {
		$ajax->remove_from_cart($_POST['id']);
		construct_cart();
	}

	if($_POST['view'] == 'update_cart_product_count') {
		$ajax->update_cart_product_count($_POST['id'], $_POST['count']);
		construct_cart();
	}

	function construct_cart() {
		$object = new Ajax();
		if ($_SESSION['products_incart'] == 0 ) {
			print "<p class='cart-empty'>Ваш кошик пустий!</p>";
		}
		else {
			foreach ($_SESSION['products'] as $key => $value) {
				$product = $object->get_product_item('product', 'id', $key);
	?>
					<div class="row">
						<div class="col-sm-2 col-md-1 hidden-xs">
							<div class="image">
							<a href="<?php print $product['url']; ?>"><img width="64" height="64" alt="<?php print $product['title'];?>" src="<?php print "userfiles/".$product['image']; ?>" /></a>
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
	}
?>