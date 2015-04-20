<div class="page-title container">Оформлення замовлення</div>
<section id="page-order-content" class="container">
<?php
		if ($_SESSION['products_incart'] == 0 ) {
			print "<p class='cart-empty'>Ваш кошик пустий!</p>";
		}
		else
		{
?>
	<form class="col-sm-12" name="order" action="" method="POST">
		<div class="form-group">
            <label>Імя</label>
            <input type="text" name="name" class="name form-control" >
        </div>
        <div class="form-group">
            <label>Фамілія</label>
            <input type="text" name="sname" class="sname form-control" >
        </div>
        <div class="form-group">
            <label>Email</label>
            <input type="text" name="mail" class="mail form-control" >
        </div>
        <div class="form-group">
            <label>Телефон</label>
            <input type="text" name="phone" class="phone form-control" >
        </div>
        <div class="form-group">
            <label>Адреса</label>
            <textarea name="address" class="address form-control" rows="8"></textarea>
        </div>
        <div class="form-group">
			<input onclick="return orderValidate()" name='order' type="submit" value="Оформити замовлення">
		</div>
	</form>
<?php
}
?>
</section>