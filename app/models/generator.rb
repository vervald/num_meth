#!/usr/bin/ruby
#coding: utf-8
require 'matrix'

class Matrix
  def []=(i, j, x)
    @rows[i][j] = x
  end
end
class Generator
  def self.gen_matrix(n, min, max, symm = true)
    a = Matrix.build(n) do |i, j|
      rand(min .. max)
    end
    a.each_with_index(:strict_lower) { |el, i, j| a[i, j] = a[j, i] } if symm
    return a
  end
end
