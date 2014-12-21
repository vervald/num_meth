#coding utf-8
require 'matrix'

class Matrix
  def []=(i, j, x)
    @rows[i][j] = x
  end
end

class Krilov
  def construct_b(a)
    for i in
  end

  def find_eigenvalues(a, eps = 1e-5)
    a = construct_b(a)
  end
end
