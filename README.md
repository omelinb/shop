Shop API
-----------

Simple API for getting, adding or removing products to cart.


System Dependencies
-------------------

- Ruby 2.6.5 (install with [rbenv](https://github.com/sstephenson/rbenv))
- Rails 6.0.2.1
- Redis
- PostgreSQL

Project Install
-------------------
```shell
git clone git@github.com:omelinb/shop.git
bundle install
```

Database creation
-----------------

Add data about your pg user in /config/database.yml:  
&nbsp;&nbsp;username: pg_user 

Create environment variable with database_password:
```shell
echo 'export SHOP_DATABASE_PASSWORD="PostgreSQL_Role_Password"' >> ~/.bashrc
```
Create and seed database
```shell
rails db:create  
rails db:migrate  
rails db:seed  
```

API
---

- /api/products&nbsp; **GET** Get lisf of products
- /api/cart &nbsp; **GET** Get cart info
- /api/cart/{product_id} &nbsp; **DELETE** Remove product from cart
- /api/cart &nbsp; **POST** Add product to cart  
&nbsp;&nbsp;params: {product_id: integer, quantity: integer}

Examples
--------

```shell
curl http://localhost:3000/api/products
curl http://localhost:3000/api/cart
curl -d '{ "product_id": 2, "quantity": 3 }' -H "Content-Type: application/json" -X POST http://localhost:3000/api/cart
curl http://localhost:3000/api/cart/2
```
