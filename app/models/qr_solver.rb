#coding: utf-8
require 'matrix'
class Matrix
  def []=(i, j, x)
    @rows[i][j] = x
  end
end

class QrSolver
  def self.sign(a)
    if a >= 0
      return 1
    else
      return -1
    end
  end

  def self.do_qr(a)
    n = a.row_size
    q = Matrix.identity(n)
    (0...n-1).each do |i|
      sum = 0
      a.column(i).each_with_index {|el, k| sum += el*el if k >= i}
      beta = sign(-a[i, i])*Math::sqrt(sum)
      w = Matrix.build n, 1 do |j, k|
        if j < i
          0
        elsif j == i
          a[i, i] - beta
        else
          a[j, i]
        end
      end
      sum = 0
      w.column(0).each {|el| sum += el*el}
      mu = 1 / Math::sqrt(sum)
      w = w*mu
      h = Matrix.identity(n) - 2*w*w.transpose
      q = h*q
      a = h*a
    end
    q = q.transpose
    return q, a
  end

  def self.find_eigenvalues(a, eps = 1e-5)
    error = 2*eps
    iter_cnt = 0
    while error >= eps do
      iter_cnt += 1
      q, r = do_qr(a)
      a = r*q
      error = 0
      a.each_with_index :strict_lower do |el, i, j|
        error = el.abs if error < el.abs
        a[i, j] = 0 if el.abs < eps
      end
      if iter_cnt >= 10000
        ans = nil
        return ans, iter_cnt
      end
    end
    ans = []
    a.each(:diagonal) { |el| ans.push(el)}
    return ans, iter_cnt
  end

end
