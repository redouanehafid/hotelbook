class InitialSchema < ActiveRecord::Migration
  def change

  	create_table :posts do |t|
  		t.string	:titre
  		t.text		:description
  		t.timestamps
  	end

  	create_table  :categories do |t|
  		t.string	:nom
  	end

  	create_table  :comments do |t|
  		t.text		:commentaire
  		t.timestamps
  	end

  	add_reference :posts, :category, index: true
  	add_reference :comments, :post, index: true

  end
end
