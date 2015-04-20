<?php
require_once "../lib/filter_class.php";

	if (isset($_POST['max_price'])) {
		$filter = new Filter("filter");
		$filter->get_filter($_POST['min_price'],$_POST['max_price'], $_POST['category'], $_POST['sort'], $_POST['count']);
?>
		<div class="container">
	        <div class="row">
	            <?php
	            if (count($filter->product) == 0) print "По Вашому запиту нічого не знайдено!";
	                foreach ($filter->product as $item) {
	            ?>
	                <div class="col-md-4 col-sm-4 col-xs-12">
	                    <div class="item">
	                        <a href="<?php print $item['url']; ?>" class="title"><?php print $item['title']; ?></a>
	                        <a class="img-cont" href="<?php print $item['url']; ?>">
	                        <img width="200px" height="200px" src="<?php print "userfiles/".$item['image']; ?>" alt="<?php print $item['title']; ?>">
	                        </a>
	                        <p class="price"><?php print $item['price']; ?><span> грн.</span></p>
	                        <button class="add-to-cart">В кошик</button>
	                        <input type="hidden" value="<?php print $item['id']; ?>" class="product-id">
	                    </div>
	                </div>
	            <?php
	                }
	            ?>
	        </div>
        <input class="oll-product-count" type="hidden" value="<?php print($filter->product_count); ?>">
        <input class="limit-product-count" type="hidden" value="<?php print $filter->product_count_limit ?>">
        <?php
        if ($filter->product_count > $filter->product_count_limit)
           print "<button onclick='filter($filter->product_count_limit+9)' class='more-product'>Показати ще товари</button>";
        ?>
    </div>
<?php
	}
	else header("Location: ../index.php");
?>