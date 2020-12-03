CREATE DATABASE product_detail

USE product_detail

CREATE TABLE IF NOT EXISTS product (
  product_id INTEGER AUTO_INCREMENT UNIQUE PRIMARY KEY,
  product_name TEXT,
  slogan TEXT,
  product_description TEXT,
  category TEXT,
  default_price TEXT,
  feature_id INTEGER FOREIGN KEY REFERENCES product_feature(feature_id),
)

CREATE TABLE IF NOT EXISTS product_feature (
  feature_id INTEGER AUTO_INCREMENT UNIQUE PRIMARY KEY,
  product_id INTEGER FOREIGN KEY REFERENCES product(product_id),
  feature TEXT,
  feature_value TEXT
)

CREATE TABLE IF NOT EXISTS product_photo (
  photo_id INTEGER AUTO_INCREMENT UNIQUE PRIMARY KEY,
  product_id INTEGER FOREIGN KEY REFERENCES product(product_id),
  thumbnail_url TEXT,
  photo_url TEXT
)

CREATE TABLE IF NOT EXISTS style (
  style_id INTEGER AUTO_INCREMENT UNIQUE PRIMARY KEY,
  product_id INTEGER FOREIGN KEY REFERENCES product(product_id),
  product_style_id INTEGER,
  style_name TEXT,
  original_price TEXT,
  sale_price TEXT,
  default_style INTEGER,
  sku_id INTEGER FOREIGN KEY REFERENCES sku(sku_id)
)

CREATE TABLE IF NOT EXISTS sku (
  sku_id INTEGER AUTO_INCREMENT UNIQUE PRIMARY KEY,
  style_id INTEGER FOREIGN KEY REFERENCES style(style_id),
  XS INTEGER,
  S INTEGER, 
  M INTEGER,
  L INTEGER,
  XL INTEGER,
  XXL INTEGER
)

CREATE TABLE IF NOT EXISTS product_rating_meta (
  meta_id INTEGER AUTO_INCREMENT UNIQUE PRIMARY KEY,
  product_id INTEGER FOREIGN KEY REFERENCES product(product_id),
  one_star INTEGER, 
  two_star INTEGER, 
  three_star INTEGER, 
  four_star INTEGER, 
  five_star INTEGER
)

CREATE TABLE IF NOT EXISTS cart (
  cart_id INTEGER AUTO_INCREMENT UNIQUE PRIMARY KEY,
  user_session INTEGER,
  product_id INTEGER FOREIGN KEY REFERENCES product(product_id),
  active BOOLEAN
)