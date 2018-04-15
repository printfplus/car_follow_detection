function a_list = generate_a_list(STEP,type)

a_list = ones(1,STEP);
if type == 0
    
    for i = 1:STEP
        if i < 0.2*STEP
            a_list(i) = 0;
        else
            a_list(i) = -3;
        end
    end
elseif type == 1
    for i = 1:STEP
        if i < 0.2*STEP
            a_list(i) = 3;
        else
            a_list(i) = -3;
        end
    end 
elseif type == 2
    for i = 1:STEP
        if i < 0.2*STEP
            a_list(i) = -3;
        else
            a_list(i) = -3;
        end
    end  



end

