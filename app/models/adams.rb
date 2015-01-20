#coding: utf-8
class Adams
  def self.f(x, y, f_str)
    return eval(f_str)
  end

  def self.solve_eq(func, x0, y0, a, b, id, h = 0.01)
    x = []
    y = []
    #FROM a TO END POINT x0
    x << x0
    y << y0
    while x.length < id
      if x[-1] - h < a then
        break
      end
      y << y[-1] - h * f(x[-1], y[-1], func)
      x << x[-1] - h
    end
    while x[-1] - h >= a
      if id == 1 then
        yt = y[-1] - h * f(x[-1], y[-1], func)
        y << y[-1] - h * f(x[-1] - h, yt, func)
      elsif id == 2 then
        yt = y[-1] - h * (3 * f(x[-1], y[-1], func) - f(x[-2], y[-2], func)) / 2
        y << y[-1] - h * (f(x[-1] - h, yt, func) + f(x[-1], y[-2], func)) / 2
      elsif id == 3 then
        yt = y[-1] - h * (23 * f(x[-1], y[-1], func) - 16 * f(x[-2], y[-2], func) + 5 * f(x[-3], y[-3], func)) / 12
        y << y[-1] - h * (5 * f(x[-1] - h, yt, func) + 8 * f(x[-1], y[-1], func) - f(x[-2], y[-2], func)) / 12
      elsif id == 4 then
        yt = y[-1] - h * (55 * f(x[-1], y[-1], func) - 59 * f(x[-2], y[-2], func) + 37 * f(x[-3], y[-3], func) - 9 * f(x[-4], y[-4], func)) / 24
        y << y[-1] - h * (9 * f(x[-1] - h, yt, func) + 19 * f(x[-1], y[-1], func) - 5 * f(x[-2], y[-2], func) + f(x[-3], y[-3], func)) / 24
      elsif id == 5 then
        yt = y[-1] - h * (1901 * f(x[-1], y[-1], func) - 2774 * f(x[-2], y[-2], func) + 2616 * f(x[-3], y[-3], func) - 1274 * f(x[-4], y[-4], func) + 251 * f(x[-5], y[-5], func)) / 720
        y << y[-1] - h * (251 * f(x[-1] - h, yt, func) + 646 * f(x[-1], y[-1], func) - 264 * f(x[-2], y[-2], func) + 106 * f(x[-3], y[-3], func) + 19 * f(x[-4], y[-4], func)) / 720
      end
      x << x[-1] - h
    end
    x.reverse!
    y.reverse!

    #FROM START POINT x0 TO b
    #Euler method
    while x.length < id
      if x[-1] + h > b then
        break
      end
      y << y[-1] + h * f(x[-1], y[-1], func)
      x << x[-1] + h
    end
    while x[-1] + h <= b
      if id == 1 then
        yt = y[-1] + h * f(x[-1], y[-1], func)
        y << y[-1] + h * f(x[-1] + h, yt, func)
      elsif id == 2 then
        yt = y[-1] + h * (3 * f(x[-1], y[-1], func) - f(x[-2], y[-2], func)) / 2
        y << y[-1] + h * (f(x[-1] + h, yt, func) + f(x[-1], y[-2], func)) / 2
      elsif id == 3 then
        yt = y[-1] + h * (23 * f(x[-1], y[-1], func) - 16 * f(x[-2], y[-2], func) + 5 * f(x[-3], y[-3], func)) / 12
        y << y[-1] + h * (5 * f(x[-1] + h, yt, func) + 8 * f(x[-1], y[-1], func) - f(x[-2], y[-2], func)) / 12
      elsif id == 4 then
        yt = y[-1] + h * (55 * f(x[-1], y[-1], func) - 59 * f(x[-2], y[-2], func) + 37 * f(x[-3], y[-3], func) - 9 * f(x[-4], y[-4], func)) / 24
        y << y[-1] + h * (9 * f(x[-1] + h, yt, func) + 19 * f(x[-1], y[-1], func) - 5 * f(x[-2], y[-2], func) + f(x[-3], y[-3], func)) / 24
      elsif id == 5 then
        yt = y[-1] + h * (1901 * f(x[-1], y[-1], func) - 2774 * f(x[-2], y[-2], func) + 2616 * f(x[-3], y[-3], func) - 1274 * f(x[-4], y[-4], func) + 251 * f(x[-5], y[-5], func)) / 720
        y << y[-1] + h * (251 * f(x[-1] + h, yt, func) + 646 * f(x[-1], y[-1], func) - 264 * f(x[-2], y[-2], func) + 106 * f(x[-3], y[-3], func) + 19 * f(x[-4], y[-4], func)) / 720
      end
      x << x[-1] + h
    end
    return x, y
  end
end
