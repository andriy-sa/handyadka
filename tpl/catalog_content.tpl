<section id="catalog">
    <div class="container filter">

        <div class="row filter-element">
            <div class="col-md-4 col-sm-4 ">
                <label>Категорія</label>
                <div class="sa-select-box-container">
                    <select class="sa-select-box category-select form-control" name="" id="">
                        <option selected value="oll">Всі</option>
                        <?php
                            foreach ($this->product_categories as $key => $value) {
                                print "<option value='".$value."'>".$value."</option>>";
                            }
                         ?>
                    </select>

                </div>
            </div>
            <div class="col-md-4 col-sm-4 ">
                <label>Ціна</label>
                <input type="text" id="amount" readonly style="border:0; color:#f6931f; font-weight:bold;">
                <div id="slider-range"></div>
                <input type="hidden" id="max-slider-val" value="<?php print $this->setting['slider_max']; ?>">
            </div>
            <div class="col-md-4 col-sm-4 ">
                <label>Сортування</label>
                <div class="sa-select-box-container">
                    <select class="sa-select-box sort-select form-control" name="" id="">
                        <option value="1">Нові спочатку</option>
                        <option value="2">Давніші спочатку</option>
                        <option value="3">Від дешевих до дорогих</option>
                        <option value="4">Від дорогих до дешевих</option>
                    </select>
                </div>
            </div>
        </div>
    </div>
</section>
<section id="catalog-products">
    <div class="container">
        <div class="row">
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
                        <input type="hidden" value="<?php print $item['id']; ?>" class="product-id">
                    </div>
                </div>
            <?php
                }
            ?>
        </div>
        <input class="oll-product-count" type="hidden" value="<?php print($this->product_count); ?>">
        <input class="limit-product-count" type="hidden" value="9">
        <?php
        if ($this->product_count > 9)
           print "<button onclick='filter(18)' class='more-product'>Показати ще товари</button>";
        ?>
    </div>
</section>