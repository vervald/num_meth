#coding: utf-8
class Newton

  def self.f(x, f_str)
    return eval(f_str)
  end

  def self.do_straight_interpolation(func, nodes, sgn = 1)
    x = []
    y = []
    real_y = []
    #magic
    cnt_node = 4
    current = 0
    iter = nodes.length - 4

    (0..iter).each do |i|
      delta = []
      tmp = []
      h = []
      cx = []
      nodes[current..[current + cnt_node - 1, nodes.length].min].each do |tx|
        cx << tx
        tmp << f(tx, func)
      end
      (current + 1..[current + cnt_node - 1, nodes.length].min).each do |i|
        h << (nodes[i] - nodes[i - 1]) * sgn
      end
      delta << tmp
      (0..delta[0].length - 2).each do |idx|
        tmp = []
        (1..delta[-1].length - 1).each do |i|
          tmp << delta[-1][i] - delta[-1][i - 1]
        end
        delta << tmp
      end

      cnt = 20
      (0...1).each do |i|
        (0..cnt - 1).each do |num|
          cur_x = cx[i] + h[i] / 20 * num
          x << cur_x
          real_y << f(cur_x, func)
          y << delta[0][0] + (cur_x - cx[0]) / h[0] * delta[1][0] + delta[2][0] * (cur_x - cx[0]) * (cur_x - cx[1]) / h[0] / h[1] / 2 +
               delta[3][0] * (cur_x - cx[0]) * (cur_x - cx[1]) * (cur_x - cx[2]) / h[0] / h[1] / h[2] / 2 / 3
          if (y[-1] - real_y[-1]).abs > 5
            x.pop
            y.pop
            real_y.pop
          end
        end
      end
      current += 1
    end
    return x, y, real_y
  end

  def self.do_reverse_interpolation(func, nodes)
    nodes.reverse!
    return do_straight_interpolation(func, nodes, -1)
  end
end
