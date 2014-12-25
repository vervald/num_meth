#coding: utf-8
class Newton
  def self.do_straight_interpolation(func, nodes, sgn = 1)
    eval('def self.f(x); ' + func + '; end')
    x = []
    y = []
    real_y = []
    #magic
    cnt_node = 4
    current = 0
    iter = nodes.length / cnt_node
    if iter * cnt_node != nodes.length
      iter += 1
    end

    (0..iter).each do |i|
      delta = []
      tmp = []
      h = []
      cx = []
      nodes[current..[current + cnt_node - 1, nodes.length].min].each do |tx|
        cx << tx
        tmp << f(tx)
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
      (0..cx.length - 2).each do |i|
        (0..cnt - 1).each do |num|
          cur_x = cx[i] + h[i] / 20 * num
          x << cur_x
          real_y << f(cur_x)
          y << delta[0][0] + (cur_x - cx[0]) / h[0] * delta[1][0] + delta[2][0] * (cur_x - cx[0]) * (cur_x - cx[1]) / h[0] / h[1] / 2 +
               delta[3][0] * (cur_x - cx[0]) * (cur_x - cx[1]) * (cur_x - cx[2]) / h[0] / h[1] / h[2] / 2 / 3
        end
      end
    end
    puts x.to_s
    y.zip(real_y).map { |x| puts (x[0] - x[1]) }
    return x, y, real_y
  end

  def self.do_reverse_interpolation(func, nodes)
    nodes.reverse!
    return do_straight_interpolation(func, nodes, -1)
  end
end
