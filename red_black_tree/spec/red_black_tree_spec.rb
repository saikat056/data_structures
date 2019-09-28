require 'spec_helper'
require 'red_black_tree'

RSpec.describe RedBlackTree do
  let(:red_black_tree)  { RedBlackTree.new }
  let(:unordered_array) { [8,5,9,8.8,7,1] }

  before  do
    unordered_array.each{|x| red_black_tree.insert(Node.new(x)) }
  end

  describe "#inorder_walk" do
    it "returns the tree elements in order" do
      expect(red_black_tree.inorder_walk).to match(unordered_array.sort)
    end
  end

  describe "#tree_minimum" do
    it "returns minimum value in the tree" do
      expect(red_black_tree.tree_minimum(red_black_tree.root).key).to eql(1)
    end
  end

  describe "#tree_maximum" do
    it "returns maximum value in the tree" do
      expect(red_black_tree.tree_maximum(red_black_tree.root).key).to eql(9)
    end
  end

  describe "#lower_key" do
    it "returns lower_key for a value" do
      expect(red_black_tree.lower_key(1)).to eql(nil)
      expect(red_black_tree.lower_key(5)).to eql(1)
      expect(red_black_tree.lower_key(9)).to eql(8.8)
      expect(red_black_tree.lower_key(8.8)).to eql(8)
      expect(red_black_tree.lower_key(7)).to eql(5)
      expect(red_black_tree.lower_key(100)).to eql(9)
      expect(red_black_tree.lower_key(6)).to eql(5)
    end

    it "returns lower value for a tree with two elements" do
      rb_tree = RedBlackTree.new
      rb_tree.insert(Node.new(4))
      rb_tree.insert(Node.new(1))
      expect(rb_tree.lower_key(1)).to eql(nil)
      expect(rb_tree.lower_key(2.3)).to eql(1)
      expect(rb_tree.lower_key(4)).to eql(1)
      expect(rb_tree.lower_key(5)).to eql(4)
      expect(rb_tree.lower_key(0.5)).to eql(nil)
      expect(rb_tree.lower_key(100)).to eql(4)
    end

    it "returns lower value for a tree with two elements" do
      rb_tree = RedBlackTree.new
      rb_tree.insert(Node.new(4))
      rb_tree.insert(Node.new(6))
      expect(rb_tree.lower_key(1)).to eql(nil)
      expect(rb_tree.lower_key(2.3)).to eql(nil)
      expect(rb_tree.lower_key(4)).to eql(nil)
      expect(rb_tree.lower_key(5)).to eql(4)
      expect(rb_tree.lower_key(6)).to eql(4)
      expect(rb_tree.lower_key(0.5)).to eql(nil)
      expect(rb_tree.lower_key(100)).to eql(6)
    end

    it "returns lower value for a tree with one element" do
      rb_tree = RedBlackTree.new
      rb_tree.insert(Node.new(4))
      expect(rb_tree.lower_key(1)).to eql(nil)
      expect(rb_tree.lower_key(2.3)).to eql(nil)
      expect(rb_tree.lower_key(4)).to eql(nil)
      expect(rb_tree.lower_key(5)).to eql(4)
      expect(rb_tree.lower_key(100)).to eql(4)
    end

    it "returns lower value for a tree with no element" do
      rb_tree = RedBlackTree.new
      expect(rb_tree.lower_key(1)).to eql(nil)
      expect(rb_tree.lower_key(2.3)).to eql(nil)
      expect(rb_tree.lower_key(4)).to eql(nil)
      expect(rb_tree.lower_key(100)).to eql(nil)
    end
  end

  describe "#flooring_key" do
    it "returns flooring_key for a value" do
      expect(red_black_tree.flooring_key(1)).to eql(1)
      expect(red_black_tree.flooring_key(5)).to eql(5)
      expect(red_black_tree.flooring_key(9)).to eql(9)
      expect(red_black_tree.flooring_key(8.9)).to eql(8.8)
      expect(red_black_tree.flooring_key(7)).to eql(7)
      expect(red_black_tree.flooring_key(100)).to eql(9)
      expect(red_black_tree.flooring_key(6)).to eql(5)
    end

    it "returns flooring key for a tree with two elements" do
      rb_tree = RedBlackTree.new
      rb_tree.insert(Node.new(4))
      rb_tree.insert(Node.new(1))
      expect(rb_tree.flooring_key(1)).to eql(1)
      expect(rb_tree.flooring_key(2.3)).to eql(1)
      expect(rb_tree.flooring_key(4)).to eql(4)
      expect(rb_tree.flooring_key(5)).to eql(4)
      expect(rb_tree.flooring_key(0.5)).to eql(nil)
      expect(rb_tree.flooring_key(100)).to eql(4)
    end

    it "returns flooring key for a tree with two elements" do
      rb_tree = RedBlackTree.new
      rb_tree.insert(Node.new(4))
      rb_tree.insert(Node.new(6))
      expect(rb_tree.flooring_key(1)).to eql(nil)
      expect(rb_tree.flooring_key(2.3)).to eql(nil)
      expect(rb_tree.flooring_key(4)).to eql(4)
      expect(rb_tree.flooring_key(5)).to eql(4)
      expect(rb_tree.flooring_key(0.5)).to eql(nil)
      expect(rb_tree.flooring_key(100)).to eql(6)
      expect(rb_tree.flooring_key(6)).to eql(6)
    end

    it "returns flooring key for a tree with one element" do
      rb_tree = RedBlackTree.new
      rb_tree.insert(Node.new(4))
      expect(rb_tree.flooring_key(1)).to eql(nil)
      expect(rb_tree.flooring_key(2.3)).to eql(nil)
      expect(rb_tree.flooring_key(4)).to eql(4)
      expect(rb_tree.flooring_key(0.5)).to eql(nil)
      expect(rb_tree.flooring_key(100)).to eql(4)
    end

    it "returns flooring key for a tree with no elements" do
      rb_tree = RedBlackTree.new
      expect(rb_tree.flooring_key(1)).to eql(nil)
      expect(rb_tree.flooring_key(4)).to eql(nil)
    end
  end

  describe "#higher_key" do
    it "returns higher_key for a value" do
      expect(red_black_tree.higher_key(1)).to eql(5)
      expect(red_black_tree.higher_key(5)).to eql(7)
      expect(red_black_tree.higher_key(9)).to eql(nil)
      expect(red_black_tree.higher_key(8.8)).to eql(9)
      expect(red_black_tree.higher_key(7)).to eql(8)
      expect(red_black_tree.higher_key(100)).to eql(nil)
      expect(red_black_tree.higher_key(6)).to eql(7)
    end

    it "returns higher value for a tree with two elements" do
      rb_tree = RedBlackTree.new
      rb_tree.insert(Node.new(4))
      rb_tree.insert(Node.new(1))
      expect(rb_tree.higher_key(1)).to eql(4)
      expect(rb_tree.higher_key(2.3)).to eql(4)
      expect(rb_tree.higher_key(4)).to eql(nil)
      expect(rb_tree.higher_key(5)).to eql(nil)
      expect(rb_tree.higher_key(0.5)).to eql(1)
    end

    it "returns higher value for a tree with two elements" do
      rb_tree = RedBlackTree.new
      rb_tree.insert(Node.new(4))
      rb_tree.insert(Node.new(6))
      expect(rb_tree.higher_key(1)).to eql(4)
      expect(rb_tree.higher_key(2.3)).to eql(4)
      expect(rb_tree.higher_key(4)).to eql(6)
      expect(rb_tree.higher_key(5)).to eql(6)
      expect(rb_tree.higher_key(0.5)).to eql(4)
      expect(rb_tree.higher_key(10)).to eql(nil)
      expect(rb_tree.higher_key(6)).to eql(nil)
    end

    it "returns higher key for a tree with one element" do
      rb_tree = RedBlackTree.new
      rb_tree.insert(Node.new(4))
      expect(rb_tree.higher_key(1)).to eql(4)
      expect(rb_tree.higher_key(4)).to eql(nil)
      expect(rb_tree.higher_key(4.1)).to eql(nil)
      expect(rb_tree.higher_key(5)).to eql(nil)
    end

    it "returns ceiling key for a tree with no elements" do
      rb_tree = RedBlackTree.new
      expect(rb_tree.ceiling_key(1)).to eql(nil)
      expect(rb_tree.ceiling_key(4)).to eql(nil)
    end
  end

  describe "#ceiling_key" do
    it "returns ceiling_key for a value" do
      expect(red_black_tree.ceiling_key(1)).to eql(1)
      expect(red_black_tree.ceiling_key(5)).to eql(5)
      expect(red_black_tree.ceiling_key(9)).to eql(9)
      expect(red_black_tree.ceiling_key(8.8)).to eql(8.8)
      expect(red_black_tree.ceiling_key(8.9)).to eql(9)
      expect(red_black_tree.ceiling_key(8.4)).to eql(8.8)
      expect(red_black_tree.ceiling_key(7)).to eql(7)
      expect(red_black_tree.ceiling_key(100)).to eql(nil)
      expect(red_black_tree.ceiling_key(6)).to eql(7)
    end

    it "returns ceiling key for a tree with two elements" do
      rb_tree = RedBlackTree.new
      rb_tree.insert(Node.new(4))
      rb_tree.insert(Node.new(1))
      expect(rb_tree.ceiling_key(1)).to eql(1)
      expect(rb_tree.ceiling_key(4)).to eql(4)
      expect(rb_tree.ceiling_key(3.4)).to eql(4)
      expect(rb_tree.ceiling_key(0.4)).to eql(1)
      expect(rb_tree.ceiling_key(100)).to eql(nil)
    end

    it "returns ceiling key for a tree with two elements" do
      rb_tree = RedBlackTree.new
      rb_tree.insert(Node.new(4))
      rb_tree.insert(Node.new(5))
      expect(rb_tree.ceiling_key(1)).to eql(4)
      expect(rb_tree.ceiling_key(4)).to eql(4)
      expect(rb_tree.ceiling_key(4.1)).to eql(5)
      expect(rb_tree.ceiling_key(5)).to eql(5)
      expect(rb_tree.ceiling_key(6)).to eql(nil)
    end

    it "returns ceiling key for a tree with one element" do
      rb_tree = RedBlackTree.new
      rb_tree.insert(Node.new(4))
      expect(rb_tree.ceiling_key(1)).to eql(4)
      expect(rb_tree.ceiling_key(4)).to eql(4)
      expect(rb_tree.ceiling_key(4.1)).to eql(nil)
      expect(rb_tree.ceiling_key(5)).to eql(nil)
    end

    it "returns ceiling key for a tree with no elements" do
      rb_tree = RedBlackTree.new
      expect(rb_tree.ceiling_key(1)).to eql(nil)
      expect(rb_tree.ceiling_key(4)).to eql(nil)
    end
  end

end
