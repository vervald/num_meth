class SolverController < ApplicationController
  require 'matrix'
  def do_qr
    resp = {}
    resp[:answer], resp[:iter_cnt] = QrSolver.find_eigenvalues(Matrix.rows(JSON.parse(params[:matrix])))
    render json: resp.to_json
  end

  def do_package_qr
    params[:from_val] = params[:from_val].to_i
    params[:to_val] = params[:to_val].to_i
    params[:mat_cnt] = params[:mat_cnt].to_i
    resp = {}

    (params[:from_dim].to_i..params[:to_dim].to_i).each do |dim|
      puts dim
      total_time = Time.now
      total_time -= total_time
      total_itr = 0
      (1..params[:mat_cnt]).each do |i|
        matr = Generator.gen_matrix(dim, params[:from_val], params[:to_val])
        start_time = Time.now
        ans, iter = QrSolver.find_eigenvalues(matr)
        finish_time = Time.now
        total_time += (finish_time - start_time)
        total_itr += iter
      end
      resp[dim] = { :avr_iter => total_itr / params[:mat_cnt], :avr_time => total_time / params[:mat_cnt] * 1000 }
    end
    render json: resp.to_json
  end

end