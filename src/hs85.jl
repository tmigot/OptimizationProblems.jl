# Hock and Schittkowski problem number 85.
#
#   Source:
#   Problem 85 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification GGI-AN-5-41
#
# A. Montoison, Montreal, 05/2018.

export hs85

"HS85 model"
function hs85(args...)
  nlp = Model()

  a = Array{Float64}(17)
  a[1]     = 0
  a[2:10]  = [17.505,11.275,214.228,7.458,0.961,1.612,0.146,107.99,922.693]
  a[11:17] = [926.832,18.766,1072.163,8961.448,0.063,71084.33,2802713]

  b = Array{Float64}(17)
  b[1]     = 0
  b[2:10]  = [1053.6667,35.03,665.585,584.463,265.916,7.046,0.222,273.366,1286.105]
  b[11:17] = [1444.046,537.141,3247.039,26844.086,0.386,140000,12146108]

  x0 = [900,80,115,267,27]
  @variable(nlp, x[i=1:5], start=x0[i])

  function fc(x1,x2,x3,x4,x5)
    c = Array{Float64}(17)
    y = Array{Float64}(17)
    y[1]  = x2 + x3 + 41.6
    c[1]  = 0.024*x4 -4.62
    y[2]  = 12.5/c[1] + 12
    c[2]  = 0.0003535*x1^2 + 0.5311*x1 + 0.08705* y[2]*x1
    c[3]  = 0.052*x1 + 78 + 0.002377*y[2]*x1
    y[3]  = c[2]/c[3]
    y[4]  = 19*y[3]
    c[4]  = 0.04782*(x1 - y[3]) + 0.1956*(x1 - y[3])^2/x2 + 0.6376*y[4] + 1.594*y[3]
    c[5]  = 100*x2
    c[6]  = x1 - y[3] - y[4]
    c[7]  = 0.95 -c[4]/c[5]
    y[5]  = c[6]*c[7]
    y[6]  = x1 - y[5] - y[4] - y[3]
    c[8]  = (y[5] + y[4])*0.995
    y[7]  = c[8]/y[1]
    y[8]  = c[8]/3798
    c[9]  = y[7] - 0.0663*y[7]/y[8] - 0.3153
    y[9]  = 96.82/c[9] + 0.321*y[1]
    y[10] = 1.29*y[5] + 1.258*y[4] + 2.29*y[3] + 1.71*y[6]
    y[11] = 1.71*x1 -0.452*y[4] + 0.58*y[3]
    c[10] = 12.3/752.3
    c[11] = (1.75*y[2])*(0.995*x1)
    c[12] = 0.995*y[10] + 1998
    y[12] = c[10]*x1 +c[11]/c[12]
    y[13] = c[12] - 1.75*y[2]
    y[14] = 3623 + 64.4*x2 + 58.4*x3 + 146312/(y[9] + x5)
    c[13] = 0.995*y[10] + 60.8*x2 + 48*x4 - 0.1121*y[14] - 5095
    y[15] = y[13]/c[13]
    y[16] = 148000 -331000*y[15] + 40*y[13] - 61*y[15]*y[13]
    c[14] = 2324*y[10] - 28740000*y[2]
    y[17] = 14130000 - 1328*y[10] -531*y[11] + c[14]/c[12]
    c[15] = y[13]/y[15] - y[13]/0.52
    c[16] = 1.104 - 0.72*y[15]
    c[17] = y[9] + x5
    return c
  end

    function fy(x1,x2,x3,x4,x5)
    c = Array{Float64}(17)
    y = Array{Float64}(17)
    y[1]  = x2 + x3 + 41.6
    c[1]  = 0.024*x4 -4.62
    y[2]  = 12.5/c[1] + 12
    c[2]  = 0.0003535*x1^2 + 0.5311*x1 + 0.08705* y[2]*x1
    c[3]  = 0.052*x1 + 78 + 0.002377*y[2]*x1
    y[3]  = c[2]/c[3]
    y[4]  = 19*y[3]
    c[4]  = 0.04782*(x1 - y[3]) + 0.1956*(x1 - y[3])^2/x2 + 0.6376*y[4] + 1.594*y[3]
    c[5]  = 100*x2
    c[6]  = x1 - y[3] - y[4]
    c[7]  = 0.95 -c[4]/c[5]
    y[5]  = c[6]*c[7]
    y[6]  = x1 - y[5] - y[4] - y[3]
    c[8]  = (y[5] + y[4])*0.995
    y[7]  = c[8]/y[1]
    y[8]  = c[8]/3798
    c[9]  = y[7] - 0.0663*y[7]/y[8] - 0.3153
    y[9]  = 96.82/c[9] + 0.321*y[1]
    y[10] = 1.29*y[5] + 1.258*y[4] + 2.29*y[3] + 1.71*y[6]
    y[11] = 1.71*x1 -0.452*y[4] + 0.58*y[3]
    c[10] = 12.3/752.3
    c[11] = (1.75*y[2])*(0.995*x1)
    c[12] = 0.995*y[10] + 1998
    y[12] = c[10]*x1 +c[11]/c[12]
    y[13] = c[12] - 1.75*y[2]
    y[14] = 3623 + 64.4*x2 + 58.4*x3 + 146312/(y[9] + x5)
    c[13] = 0.995*y[10] + 60.8*x2 + 48*x4 - 0.1121*y[14] - 5095
    y[15] = y[13]/c[13]
    y[16] = 148000 -331000*y[15] + 40*y[13] - 61*y[15]*y[13]
    c[14] = 2324*y[10] - 28740000*y[2]
    y[17] = 14130000 - 1328*y[10] -531*y[11] + c[14]/c[12]
    c[15] = y[13]/y[15] - y[13]/0.52
    c[16] = 1.104 - 0.72*y[15]
    c[17] = y[9] + x5
    return y
  end

  JuMP.register(nlp, :fc, 5, fc, autodiff=true)
  @NLexpression(nlp, c[i=1:17], fc(x[1],x[2],x[3],x[4],x[5]))
  JuMP.register(nlp, :fy, 5, fy, autodiff=true)
  @NLexpression(nlp, y[i=1:17], fy(x[1],x[2],x[3],x[4],x[5]))

  @constraint(nlp, 1.5*x[2] - x[3]  >= 0)
  @NLconstraint(nlp, y[1]   - 213.1 >= 0)
  @NLconstraint(nlp, 405.23 - y[1]  >= 0)
  for j = 4:19
    @NLconstraint(nlp, y[j-2] - a[j-2] >= 0)
  end
    for j = 20:35
    @NLconstraint(nlp, b[j-18] - y[j-18] >= 0)
  end
  @NLconstraint(nlp, y[4] - 0.28/0.72*y[5] >= 0)
  @NLconstraint(nlp, 21 - 3496*y[2]/c[12] >= 0)
  @NLconstraint(nlp, 62212/c[17] - 110.6 - y[1] >= 0)

  @constraint(nlp, 704.4148 <= x[1] <= 906.3855)
  @constraint(nlp, 68.6     <= x[2] <= 288.88)
  @constraint(nlp, 0        <= x[3] <= 134.75)
  @constraint(nlp, 193      <= x[4] <= 287.0966)
  @constraint(nlp, 25       <= x[5] <= 84.1988)

  @NLobjective(
    nlp,
    Min,
    - 5.843e-7*y[17] + 1.17e-4*y[14] + 2.358e-5*y[13] + 1.502e-6*y[16] 
    + 0.0321y[12] + 0.00423*y[5] + 1.e-4*c[15]/c[16] + 37.48*y[2]/c[12] - 0.1365
  )

  return nlp
end