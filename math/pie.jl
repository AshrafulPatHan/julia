function calculate_pi_chudnovsky(iterations::Int, precision_digits::Int)
    # Set the working precision
    bits = ceil(Int, precision_digits * 3.321928)
    setprecision(BigFloat, bits)
    
    # Chudnovsky Constants
    C = BigFloat(426880) * sqrt(BigFloat(10005))
    L = BigFloat(13591409)
    X = BigFloat(1)
    M = BigFloat(1)
    K = BigFloat(6)
    S = BigFloat(13591409) # First term (k=0)
    
    for k in 1:iterations
        # Update M = M * (K^3 - 16K) / k^3
        M = M * (K^3 - 16*K) / BigFloat(k)^3
        L += 545140134
        X *= -262537412640768000
        S += (M * L) / X
        K += 12
    end
    
    return C / S
end


custom_pi = calculate_pi_chudnovsky(7, 10000)
println(custom_pi)