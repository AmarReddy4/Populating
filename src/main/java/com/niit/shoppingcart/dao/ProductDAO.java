package com.niit.shoppingcart.dao;

import java.util.List;

import com.niit.shoppingcart.model.Product;

public interface ProductDAO {

	public boolean saveOrUpdate(Product product);
	public boolean delete(Product product);
	public Product get(int id);
	public List<Product> list();
	public Object getproduct(int id);

}