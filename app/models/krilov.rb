#coding utf-8
require 'matrix'
require './qr_solver.rb'

class Matrix
  def []=(i, j, x)
    @rows[i][j] = x
  end
end

class Krilov
  def self.find_eigenvalues(a, eps = 1e-5)
    b = []
    b << a.row(0)
    (0..a.row_size - 2).each do |row_id|
      cur_row = []
      (0..a.row_size - 1).each do |cur_id|
        tmp = 0
        (0..a.row_size - 1).each do |to_sum|
          tmp += b[row_id][to_sum]*a[to_sum, cur_id]
        end
        cur_row << tmp
      end
      b << cur_row
    end
    b = Matrix.rows(b)
    c = []
    tmp = [1]
    (1..a.row_size - 1).each do |i|
      tmp << 0
    end
    c << tmp
    (0..a.row_size - 2).each do |i|
      c << b.row(i)
    end
    c = Matrix.rows(c).det
    koef = [1]
    (0..a.row_size - 1).each do |i|
      tmp = []
      (0..a.row_size - 1).each do |j|
        if j != i
          t = b.row(j).to_a
          t.delete_at(0)
          tmp << t
        end
      end
      koef << Matrix.rows(tmp).det
    end
    puts koef
    a, b = QrSolver.find_eigenvalues(a)
    return a
  end
end
